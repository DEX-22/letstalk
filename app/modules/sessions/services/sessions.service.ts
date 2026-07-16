import { sessionsRepository } from '../repositories/sessions.repository'
import type { Session, Turn } from '../types'
import { ParticipantRole, SessionStatus, TurnStatus } from '~/shared/types/constants'

function shuffle<T>(items: T[]): T[] {
  const result = [...items]
  for (let index = result.length - 1; index > 0; index -= 1) {
    const randomIndex = Math.floor(Math.random() * (index + 1))
    const current = result[index]
    result[index] = result[randomIndex]!
    result[randomIndex] = current!
  }
  return result
}

export const sessionsService = {
  async startSession(client: any, roomId: string, profileId: string): Promise<Session> {
    const room = await sessionsRepository.getRoom(client, roomId)
    if (!room) throw new Error('Room not found')
    if (room.host_id !== profileId) throw new Error('Only the host can start the session')
    if (room.status !== 'waiting') throw new Error('This room cannot start a new session')

    const existingSession = await sessionsRepository.getActiveSession(client, roomId)
    if (existingSession) throw new Error('A session is already in progress')

    const participants = await sessionsRepository.getParticipants(client, roomId)
    if (participants.length < 2) throw new Error('At least two participants are required to start')

    const cards = await sessionsRepository.getCards(client, room)
    if (cards.length === 0) throw new Error('No conversation cards are available for this room')

    const session = await sessionsRepository.createSession(client, {
      room_id: roomId,
      status: SessionStatus.WAITING,
    })

    const orderedParticipants = shuffle(participants)
    const orderedCards = shuffle(cards)
    await sessionsRepository.createTurns(client, orderedParticipants.map((participant: any, index: number) => ({
      session_id: session.id,
      participant_id: participant.id,
      card_id: orderedCards[index % orderedCards.length]!.card_id,
      turn_order: index + 1,
      status: index === 0 ? TurnStatus.ACTIVE : TurnStatus.PENDING,
      started_at: index === 0 ? new Date().toISOString() : null,
    })))

    const startedSession = await sessionsRepository.updateSession(client, session.id, {
      status: SessionStatus.ACTIVE,
      started_at: new Date().toISOString(),
    })

    return this.mapSession(startedSession)
  },

  async endSession(client: any, sessionId: string, profileId: string): Promise<void> {
    const session = await this.getSession(client, sessionId)
    if (!session) throw new Error('Session not found')
    await this.assertHost(client, session.roomId, profileId)
    await sessionsRepository.skipOpenTurns(client, sessionId)
    await sessionsRepository.updateSession(client, sessionId, {
      status: SessionStatus.COMPLETED,
      ended_at: new Date().toISOString(),
    })
  },

  async nextParticipant(client: any, sessionId: string, profileId: string): Promise<void> {
    const session = await this.getSession(client, sessionId)
    if (!session) throw new Error('Session not found')
    if (session.status !== SessionStatus.ACTIVE) return
    await this.assertHost(client, session.roomId, profileId)

    const turns = await this.getTurns(client, sessionId)
    const activeTurn = turns.find((turn) => turn.status === TurnStatus.ACTIVE)
    if (!activeTurn) throw new Error('There is no active turn')

    await sessionsRepository.updateTurn(client, activeTurn.id, {
      status: TurnStatus.COMPLETED,
      ended_at: new Date().toISOString(),
    })

    const nextTurn = turns.find((turn) => turn.status === TurnStatus.PENDING)
    if (!nextTurn) {
      await sessionsRepository.updateSession(client, sessionId, {
        status: SessionStatus.COMPLETED,
        ended_at: new Date().toISOString(),
      })
      return
    }

    await sessionsRepository.updateTurn(client, nextTurn.id, {
      status: TurnStatus.ACTIVE,
      started_at: new Date().toISOString(),
    })
  },

  async getActiveSession(client: any, roomId: string): Promise<Session | null> {
    const session = await sessionsRepository.getActiveSession(client, roomId)
    return session ? this.mapSession(session) : null
  },

  async getSession(client: any, sessionId: string): Promise<Session | null> {
    const session = await sessionsRepository.getSessionById(client, sessionId)
    return session ? this.mapSession(session) : null
  },

  async getTurns(client: any, sessionId: string): Promise<Turn[]> {
    const turns = await sessionsRepository.getTurns(client, sessionId)
    return turns.map((turn: any) => this.mapTurn(turn))
  },

  async assertHost(client: any, roomId: string, profileId: string): Promise<void> {
    const room = await sessionsRepository.getRoom(client, roomId)
    if (!room || room.host_id !== profileId) throw new Error('Only the host can manage this session')
  },

  mapSession(session: any): Session {
    return {
      id: session.id,
      roomId: session.room_id,
      status: session.status as SessionStatus,
      startedAt: session.started_at,
      endedAt: session.ended_at,
    }
  },

  mapTurn(turn: any): Turn {
    return {
      id: turn.id,
      sessionId: turn.session_id,
      participantId: turn.participant_id,
      participantName: turn.participants?.profiles?.name ?? 'Participant',
      participantRole: (turn.participants?.role ?? ParticipantRole.PARTICIPANT) as ParticipantRole,
      cardId: turn.card_id,
      order: turn.turn_order,
      status: turn.status as TurnStatus,
      startedAt: turn.started_at,
      endedAt: turn.ended_at,
    }
  },
}

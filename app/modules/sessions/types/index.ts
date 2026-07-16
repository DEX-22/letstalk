import type { SessionStatus, TurnStatus, ParticipantRole } from '~/shared/types/constants'

export interface Session {
  id: string
  roomId: string
  status: SessionStatus
  startedAt: string | null
  endedAt: string | null
}

export interface Turn {
  id: string
  sessionId: string
  participantId: string
  participantName: string
  participantRole: ParticipantRole
  cardId: string
  order: number
  status: TurnStatus
  startedAt: string | null
  endedAt: string | null
}

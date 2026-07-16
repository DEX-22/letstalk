import { roomsRepository } from '../repositories/rooms.repository'
import type { CreateRoomInput, Room, Participant } from '../types'
import { RoomStatus, ParticipantRole, ParticipantStatus } from '~/shared/types/constants'

/**
 * Rooms service — contains all room management business logic.
 *
 * This service is pure: it does NOT call useSupabaseClient() directly.
 * The Supabase client is passed in from the calling composable.
 */
export const roomsService = {
  async createRoom(
    client: any,
    input: CreateRoomInput,
    profileId: string,
  ): Promise<Room> {
    // Generate a unique room code
    let code = roomsRepository.generateRoomCode()
    let existing = await roomsRepository.getRoomByCode(client, code)
    while (existing) {
      code = roomsRepository.generateRoomCode()
      existing = await roomsRepository.getRoomByCode(client, code)
    }

    const room = await roomsRepository.createRoom(client, {
      host_id: profileId,
      name: input.name,
      code,
      language_id: input.languageId,
      topic_id: input.topicId,
      level_id: input.levelId,
      turn_duration: input.turnDuration ?? 60,
      max_participants: input.maxParticipants ?? 8,
      status: RoomStatus.WAITING,
    })

    // Add host as participant
    await roomsRepository.addParticipant(client, {
      room_id: room.id,
      profile_id: profileId,
      role: ParticipantRole.HOST,
      status: ParticipantStatus.ONLINE,
    })

    return this.mapRoom(room)
  },

  async joinRoom(
    client: any,
    code: string,
    profileId: string,
  ): Promise<Room> {
    const room = await roomsRepository.getRoomByCode(client, code.toUpperCase())

    if (!room) {
      throw new Error('Room not found')
    }

    if (room.status !== RoomStatus.WAITING) {
      throw new Error('Room is no longer accepting participants')
    }

    // Check if already in room
    const existingParticipant = await roomsRepository.getParticipantByProfileAndRoom(
      client,
      profileId,
      room.id,
    )

    if (existingParticipant) {
      if (existingParticipant.status === ParticipantStatus.LEFT) {
        // Rejoin
        await roomsRepository.updateParticipantStatus(
          client,
          existingParticipant.id,
          ParticipantStatus.ONLINE,
        )
      }
      return this.mapRoom(room)
    }

    // Check participant limit
    const count = await roomsRepository.getParticipantCount(client, room.id)
    if (count >= room.max_participants) {
      throw new Error('Room is full')
    }

    await roomsRepository.addParticipant(client, {
      room_id: room.id,
      profile_id: profileId,
      role: ParticipantRole.PARTICIPANT,
      status: ParticipantStatus.ONLINE,
    })

    return this.mapRoom(room)
  },

  async leaveRoom(
    client: any,
    roomId: string,
    profileId: string,
  ): Promise<void> {
    const participant = await roomsRepository.getParticipantByProfileAndRoom(
      client,
      profileId,
      roomId,
    )

    if (!participant) {
      throw new Error('You are not in this room')
    }

    // If host is leaving, delete the room
    if (participant.role === ParticipantRole.HOST) {
      await roomsRepository.deleteRoom(client, roomId)
      return
    }

    await roomsRepository.removeParticipant(client, participant.id)
  },

  async getRoomById(
    client: any,
    id: string,
  ): Promise<Room | null> {
    const room = await roomsRepository.getRoomById(client, id)
    if (!room) return null
    return this.mapRoom(room)
  },

  async getActiveRooms(
    client: any,
  ): Promise<Room[]> {
    const rooms = await roomsRepository.getActiveRooms(client)
    return rooms.map((room) => this.mapRoom(room))
  },

  async getParticipants(
    client: any,
    roomId: string,
  ): Promise<Participant[]> {
    const participants = await roomsRepository.getParticipantsByRoomId(client, roomId)
    return participants.map((p: any) => ({
      id: p.id,
      roomId: p.room_id,
      profileId: p.profile_id,
      name: p.profiles?.name ?? 'Unknown',
      avatarUrl: p.profiles?.avatar_url ?? null,
      role: p.role as ParticipantRole,
      status: p.status as ParticipantStatus,
      joinedAt: p.joined_at,
    }))
  },

  async updateRoomSettings(
    client: any,
    roomId: string,
    profileId: string,
    settings: { name?: string; turnDuration?: number; maxParticipants?: number },
  ): Promise<void> {
    const room = await roomsRepository.getRoomById(client, roomId)

    if (!room) {
      throw new Error('Room not found')
    }

    if (room.host_id !== profileId) {
      throw new Error('Only the host can update room settings')
    }

    const updates: Record<string, unknown> = {}
    if (settings.name !== undefined) updates.name = settings.name
    if (settings.turnDuration !== undefined) updates.turn_duration = settings.turnDuration
    if (settings.maxParticipants !== undefined) updates.max_participants = settings.maxParticipants

    await roomsRepository.updateRoom(client, roomId, updates)
  },

  async subscribeToParticipants(
    client: any,
    roomId: string,
    callback: (participants: Participant[]) => void,
  ) {
    return roomsRepository.subscribeToRoomParticipants(client, roomId, async () => {
      const participants = await this.getParticipants(client, roomId)
      callback(participants)
    })
  },

  async subscribeToRoom(
    client: any,
    roomId: string,
    callback: (room: Room) => void,
  ) {
    return roomsRepository.subscribeToRoomChanges(client, roomId, async () => {
      const room = await this.getRoomById(client, roomId)
      if (room) {
        callback(room)
      }
    })
  },

  mapRoom(room: any): Room {
    return {
      id: room.id,
      name: room.name,
      code: room.code,
      status: room.status as RoomStatus,
      languageId: room.language_id,
      topicId: room.topic_id,
      levelId: room.level_id,
      hostId: room.host_id,
      hostName: room.profiles?.name ?? '',
      languageName: room.languages?.name ?? '',
      topicName: room.topics?.name ?? '',
      levelName: room.levels?.name ?? '',
      turnDuration: room.turn_duration,
      maxParticipants: room.max_participants,
      participantCount: room.participant_count ?? 0,
      createdAt: room.created_at,
      updatedAt: room.updated_at,
    }
  },
}
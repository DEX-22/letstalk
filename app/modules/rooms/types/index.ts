import type { Database } from '~/shared/types/database'
import { RoomStatus, ParticipantRole, ParticipantStatus } from '~/shared/types/constants'

export type RoomRow = Database['public']['Tables']['rooms']['Row']
export type RoomInsert = Database['public']['Tables']['rooms']['Insert']
export type RoomUpdate = Database['public']['Tables']['rooms']['Update']

export type ParticipantRow = Database['public']['Tables']['participants']['Row']
export type ParticipantInsert = Database['public']['Tables']['participants']['Insert']
export type ParticipantUpdate = Database['public']['Tables']['participants']['Update']

export interface CreateRoomInput {
  name: string
  languageId: string
  topicId: string
  levelId: string
  turnDuration?: number
  maxParticipants?: number
}

export interface JoinRoomInput {
  code: string
}

export interface Room {
  id: string
  name: string
  code: string
  status: RoomStatus
  languageId: string
  topicId: string
  levelId: string
  hostId: string
  hostName: string
  languageName: string
  topicName: string
  levelName: string
  turnDuration: number
  maxParticipants: number
  participantCount: number
  createdAt: string
  updatedAt: string
}

export interface Participant {
  id: string
  roomId: string
  profileId: string
  name: string
  avatarUrl: string | null
  role: ParticipantRole
  status: ParticipantStatus
  joinedAt: string
}

export interface RoomError {
  code: string
  message: string
}

export interface RoomState {
  rooms: Room[]
  currentRoom: Room | null
  participants: Participant[]
  loading: boolean
  error: string | null
}
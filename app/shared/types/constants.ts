export const ROOM_CONSTANTS = {
  MAX_PARTICIPANTS: 8,
  MIN_PARTICIPANTS: 2,
  TURN_DURATION_MIN: 30,
  TURN_DURATION_MAX: 300,
  TURN_DURATION_DEFAULT: 60,
  ROOM_CODE_LENGTH: 6,
} as const

export const SESSION_CONSTANTS = {
  CLEANUP_TIMEOUT_MS: 30 * 60 * 1000, // 30 minutes
} as const

export const AUTH_CONSTANTS = {
  GUEST_ID_KEY: 'letstalk_guest_id',
  GUEST_NAME_KEY: 'letstalk_guest_name',
} as const

export const API_CONSTANTS = {
  DEFAULT_PAGE_SIZE: 20,
  MAX_PAGE_SIZE: 100,
} as const

export enum RoomStatus {
  WAITING = 'waiting',
  ACTIVE = 'active',
  COMPLETED = 'completed',
}

export enum ParticipantRole {
  HOST = 'host',
  PARTICIPANT = 'participant',
}

export enum ParticipantStatus {
  ONLINE = 'online',
  AWAY = 'away',
  LEFT = 'left',
}

export enum SessionStatus {
  WAITING = 'waiting',
  ACTIVE = 'active',
  PAUSED = 'paused',
  COMPLETED = 'completed',
}

export enum TurnStatus {
  PENDING = 'pending',
  ACTIVE = 'active',
  COMPLETED = 'completed',
  SKIPPED = 'skipped',
}

export enum RoomLevel {
  BEGINNER = 'beginner',
  INTERMEDIATE = 'intermediate',
  ADVANCED = 'advanced',
}

export enum AuthProvider {
  GUEST = 'guest',
  GOOGLE = 'google',
}
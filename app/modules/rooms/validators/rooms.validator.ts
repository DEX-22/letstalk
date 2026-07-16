import { z } from 'zod'
import { ROOM_CONSTANTS } from '~/shared/types/constants'

export const createRoomSchema = z.object({
  name: z
    .string()
    .min(1, 'Room name is required')
    .max(100, 'Room name must be 100 characters or less'),
  languageId: z.string().uuid('Language is required'),
  topicId: z.string().uuid('Topic is required'),
  levelId: z.string().uuid('Level is required'),
  turnDuration: z
    .number()
    .min(ROOM_CONSTANTS.TURN_DURATION_MIN, `Turn duration must be at least ${ROOM_CONSTANTS.TURN_DURATION_MIN} seconds`)
    .max(ROOM_CONSTANTS.TURN_DURATION_MAX, `Turn duration must be ${ROOM_CONSTANTS.TURN_DURATION_MAX} seconds or less`)
    .default(ROOM_CONSTANTS.TURN_DURATION_DEFAULT)
    .optional(),
  maxParticipants: z
    .number()
    .min(ROOM_CONSTANTS.MIN_PARTICIPANTS, `At least ${ROOM_CONSTANTS.MIN_PARTICIPANTS} participants required`)
    .max(ROOM_CONSTANTS.MAX_PARTICIPANTS, `Maximum ${ROOM_CONSTANTS.MAX_PARTICIPANTS} participants allowed`)
    .default(ROOM_CONSTANTS.MAX_PARTICIPANTS)
    .optional(),
})

export type CreateRoomForm = z.infer<typeof createRoomSchema>

export const joinRoomSchema = z.object({
  code: z
    .string()
    .min(1, 'Room code is required')
    .length(ROOM_CONSTANTS.ROOM_CODE_LENGTH, `Room code must be ${ROOM_CONSTANTS.ROOM_CODE_LENGTH} characters`)
    .regex(/^[A-Z0-9]+$/, 'Room code must contain only uppercase letters and numbers'),
})

export type JoinRoomForm = z.infer<typeof joinRoomSchema>

export const updateRoomSettingsSchema = z.object({
  name: z.string().min(1).max(100).optional(),
  turnDuration: z
    .number()
    .min(ROOM_CONSTANTS.TURN_DURATION_MIN)
    .max(ROOM_CONSTANTS.TURN_DURATION_MAX)
    .optional(),
  maxParticipants: z
    .number()
    .min(ROOM_CONSTANTS.MIN_PARTICIPANTS)
    .max(ROOM_CONSTANTS.MAX_PARTICIPANTS)
    .optional(),
})

export type UpdateRoomSettingsForm = z.infer<typeof updateRoomSettingsSchema>
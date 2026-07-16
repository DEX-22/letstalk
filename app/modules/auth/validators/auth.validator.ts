import { z } from 'zod'

export const guestLoginSchema = z.object({
  name: z
    .string()
    .min(1, 'Name is required')
    .max(50, 'Name must be at most 50 characters')
    .trim(),
})

export type GuestLoginInput = z.infer<typeof guestLoginSchema>
import type { Database } from '~/shared/types/database'
import { RoomStatus, ParticipantRole, ParticipantStatus } from '~/shared/types/constants'
import type { RoomRow, RoomInsert, ParticipantRow, ParticipantInsert } from '../types'

type Room = Database['public']['Tables']['rooms']['Row']
type Participant = Database['public']['Tables']['participants']['Row']

/**
 * Rooms repository — communicates with Supabase for room and participant management.
 *
 * Each method receives the Supabase client as a parameter.
 * This design keeps the repository pure and testable.
 */
export const roomsRepository = {
  async createRoom(
    client: any,
    data: RoomInsert,
  ): Promise<Room> {
    const { data: room, error } = await client
      .from('rooms')
      .insert(data as never)
      .select()
      .single()

    if (error) {
      throw new Error(`Failed to create room: ${error.message}`)
    }

    return room as unknown as Room
  },

  async getRoomById(
    client: any,
    id: string,
  ): Promise<Room | null> {
    const { data } = await client
      .from('rooms')
      .select()
      .eq('id', id)
      .maybeSingle()

    return data as unknown as Room | null
  },

  async getRoomByCode(
    client: any,
    code: string,
  ): Promise<Room | null> {
    const { data } = await client
      .from('rooms')
      .select()
      .eq('code', code)
      .maybeSingle()

    return data as unknown as Room | null
  },

  async getActiveRooms(
    client: any,
  ): Promise<Room[]> {
    const { data } = await client
      .from('rooms')
      .select()
      .in('status', [RoomStatus.WAITING, RoomStatus.ACTIVE])
      .order('created_at', { ascending: false })

    return (data as unknown as Room[]) ?? []
  },

  async updateRoom(
    client: any,
    id: string,
    data: Partial<RoomInsert>,
  ): Promise<void> {
    const { error } = await client
      .from('rooms')
      .update(data as never)
      .eq('id', id)

    if (error) {
      throw new Error(`Failed to update room: ${error.message}`)
    }
  },

  async deleteRoom(
    client: any,
    id: string,
  ): Promise<void> {
    const { error } = await client
      .from('rooms')
      .delete()
      .eq('id', id)

    if (error) {
      throw new Error(`Failed to delete room: ${error.message}`)
    }
  },

  async addParticipant(
    client: any,
    data: ParticipantInsert,
  ): Promise<Participant> {
    const { data: participant, error } = await client
      .from('participants')
      .insert(data as never)
      .select()
      .single()

    if (error) {
      throw new Error(`Failed to join room: ${error.message}`)
    }

    return participant as unknown as Participant
  },

  async getParticipantsByRoomId(
    client: any,
    roomId: string,
  ): Promise<Participant[]> {
    const { data } = await client
      .from('participants')
      .select('*, profiles(name, avatar_url)')
      .eq('room_id', roomId)
      .order('joined_at', { ascending: true })

    return (data as unknown as Participant[]) ?? []
  },

  async getParticipantByProfileAndRoom(
    client: any,
    profileId: string,
    roomId: string,
  ): Promise<Participant | null> {
    const { data } = await client
      .from('participants')
      .select()
      .eq('profile_id', profileId)
      .eq('room_id', roomId)
      .maybeSingle()

    return data as unknown as Participant | null
  },

  async updateParticipantStatus(
    client: any,
    id: string,
    status: ParticipantStatus,
  ): Promise<void> {
    const { error } = await client
      .from('participants')
      .update({ status } as never)
      .eq('id', id)

    if (error) {
      throw new Error(`Failed to update participant status: ${error.message}`)
    }
  },

  async removeParticipant(
    client: any,
    id: string,
  ): Promise<void> {
    const { error } = await client
      .from('participants')
      .update({
        status: ParticipantStatus.LEFT,
        left_at: new Date().toISOString(),
      } as never)
      .eq('id', id)

    if (error) {
      throw new Error(`Failed to leave room: ${error.message}`)
    }
  },

  async getParticipantCount(
    client: any,
    roomId: string,
  ): Promise<number> {
    const { count, error } = await client
      .from('participants')
      .select('*', { count: 'exact', head: true })
      .eq('room_id', roomId)
      .in('status', [ParticipantStatus.ONLINE, ParticipantStatus.AWAY])

    if (error) {
      throw new Error(`Failed to get participant count: ${error.message}`)
    }

    return count ?? 0
  },

  async subscribeToRoomParticipants(
    client: any,
    roomId: string,
    callback: (payload: any) => void,
  ) {
    return client
      .channel(`room:${roomId}`)
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'participants',
          filter: `room_id=eq.${roomId}`,
        },
        callback,
      )
      .subscribe()
  },

  async subscribeToRoomChanges(
    client: any,
    roomId: string,
    callback: (payload: any) => void,
  ) {
    return client
      .channel(`room:${roomId}`)
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'rooms',
          filter: `id=eq.${roomId}`,
        },
        callback,
      )
      .subscribe()
  },

  generateRoomCode(): string {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    let code = ''
    for (let i = 0; i < 6; i++) {
      code += chars.charAt(Math.floor(Math.random() * chars.length))
    }
    return code
  },
}
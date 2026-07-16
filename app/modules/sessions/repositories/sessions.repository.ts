import type { Database } from '~/shared/types/database'
import { SessionStatus, TurnStatus } from '~/shared/types/constants'

type SessionInsert = Database['public']['Tables']['sessions']['Insert']
type TurnInsert = Database['public']['Tables']['turns']['Insert']

export const sessionsRepository = {
  async getRoom(client: any, roomId: string) {
    const { data, error } = await client.from('rooms').select().eq('id', roomId).maybeSingle()
    if (error) throw new Error(`Failed to load room: ${error.message}`)
    return data
  },

  async getParticipants(client: any, roomId: string) {
    const { data, error } = await client
      .from('participants')
      .select('id, profile_id, role, status')
      .eq('room_id', roomId)
      .in('status', ['online', 'away'])
    if (error) throw new Error(`Failed to load participants: ${error.message}`)
    return (data ?? []) as Array<{ id: string; profile_id: string; role: string; status: string }>
  },

  async getCards(client: any, room: any) {
    const { data, error } = await client.rpc('get_room_card_ids', {
      target_room_id: room.id,
    })
    if (error) throw new Error(`Failed to load conversation cards: ${error.message}`)
    return (data ?? []) as Array<{ card_id: string }>
  },

  async getActiveSession(client: any, roomId: string) {
    const { data, error } = await client
      .from('sessions')
      .select()
      .eq('room_id', roomId)
      .in('status', [SessionStatus.WAITING, SessionStatus.ACTIVE, SessionStatus.PAUSED])
      .order('created_at', { ascending: false })
      .maybeSingle()
    if (error) throw new Error(`Failed to load session: ${error.message}`)
    return data
  },

  async getSessionById(client: any, sessionId: string) {
    const { data, error } = await client.from('sessions').select().eq('id', sessionId).maybeSingle()
    if (error) throw new Error(`Failed to load session: ${error.message}`)
    return data
  },

  async createSession(client: any, data: SessionInsert) {
    const { data: session, error } = await client.from('sessions').insert(data).select().single()
    if (error) throw new Error(`Failed to create session: ${error.message}`)
    return session
  },

  async updateSession(client: any, sessionId: string, data: Database['public']['Tables']['sessions']['Update']) {
    const { data: session, error } = await client.from('sessions').update(data).eq('id', sessionId).select().single()
    if (error) throw new Error(`Failed to update session: ${error.message}`)
    return session
  },

  async createTurns(client: any, turns: TurnInsert[]) {
    const { error } = await client.from('turns').insert(turns)
    if (error) throw new Error(`Failed to create turns: ${error.message}`)
  },

  async getTurns(client: any, sessionId: string) {
    const { data, error } = await client
      .from('turns')
      .select('*, participants(role, profiles(name))')
      .eq('session_id', sessionId)
      .order('turn_order', { ascending: true })
    if (error) throw new Error(`Failed to load turns: ${error.message}`)
    return data ?? []
  },

  async updateTurn(client: any, turnId: string, data: Database['public']['Tables']['turns']['Update']) {
    const { error } = await client.from('turns').update(data).eq('id', turnId)
    if (error) throw new Error(`Failed to update turn: ${error.message}`)
  },

  async skipOpenTurns(client: any, sessionId: string) {
    const { error } = await client
      .from('turns')
      .update({ status: TurnStatus.SKIPPED, ended_at: new Date().toISOString() })
      .eq('session_id', sessionId)
      .in('status', [TurnStatus.PENDING, TurnStatus.ACTIVE])
    if (error) throw new Error(`Failed to end turns: ${error.message}`)
  },

  subscribeToSessions(client: any, roomId: string, callback: () => void) {
    return client.channel(`room:${roomId}:sessions`).on('postgres_changes', {
      event: '*', schema: 'public', table: 'sessions', filter: `room_id=eq.${roomId}`,
    }, callback).subscribe()
  },

  subscribeToTurns(client: any, sessionId: string, callback: () => void) {
    return client.channel(`session:${sessionId}:turns`).on('postgres_changes', {
      event: '*', schema: 'public', table: 'turns', filter: `session_id=eq.${sessionId}`,
    }, callback).subscribe()
  },
}

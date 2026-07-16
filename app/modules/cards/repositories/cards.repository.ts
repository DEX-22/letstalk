import type { ConversationCard } from '../types'

export const cardsRepository = {
  async getActiveTurnCard(client: any, sessionId: string): Promise<ConversationCard | null> {
    const { data, error } = await client.rpc('get_active_turn_card', {
      target_session_id: sessionId,
    })
    if (error) throw new Error(`Failed to load conversation card: ${error.message}`)

    const card = (data as ConversationCard[] | null)?.[0]
    return card ?? null
  },
}

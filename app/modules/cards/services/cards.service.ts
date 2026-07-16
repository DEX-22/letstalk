import { cardsRepository } from '../repositories/cards.repository'
import type { ConversationCard } from '../types'

export const cardsService = {
  async getActiveTurnCard(client: any, sessionId: string): Promise<ConversationCard | null> {
    return cardsRepository.getActiveTurnCard(client, sessionId)
  },

  async getCurrentTurnCard(client: any, sessionId: string): Promise<ConversationCard | null> {
    return cardsRepository.getCurrentTurnCard(client, sessionId)
  },
}

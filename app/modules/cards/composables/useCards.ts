import { useSupabaseClient } from '#imports'
import { cardsService } from '../services/cards.service'
import { useCardsStore } from '../stores/cards.store'

export function useCards() {
  const supabase = useSupabaseClient()
  const store = useCardsStore()

  async function loadActiveTurnCard(sessionId: string | null): Promise<void> {
    if (!sessionId) {
      store.setActiveCard(null)
      return
    }

    store.setLoading(true)
    store.setError(null)
    try {
      // The database returns a card only to the active participant.
      store.setActiveCard(await cardsService.getActiveTurnCard(supabase, sessionId))
    } catch (error) {
      store.setActiveCard(null)
      store.setError(error instanceof Error ? error.message : 'Failed to load conversation card')
    } finally {
      store.setLoading(false)
    }
  }

  return {
    activeCard: computed(() => store.activeCard),
    loading: computed(() => store.loading),
    error: computed(() => store.error),
    loadActiveTurnCard,
  }
}

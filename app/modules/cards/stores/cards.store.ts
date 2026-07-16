import { defineStore } from 'pinia'
import type { ConversationCard } from '../types'

export const useCardsStore = defineStore('cards', () => {
  const activeCard = ref<ConversationCard | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)

  function setActiveCard(card: ConversationCard | null) {
    activeCard.value = card
  }

  function setLoading(value: boolean) {
    loading.value = value
  }

  function setError(value: string | null) {
    error.value = value
  }

  return { activeCard, loading, error, setActiveCard, setLoading, setError }
})

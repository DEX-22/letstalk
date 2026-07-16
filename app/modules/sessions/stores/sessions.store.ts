import { defineStore } from 'pinia'
import type { Session, Turn } from '../types'

export const useSessionsStore = defineStore('sessions', () => {
  const currentSession = ref<Session | null>(null)
  const turns = ref<Turn[]>([])
  const loading = ref(false)
  const error = ref<string | null>(null)

  const currentTurn = computed(() => turns.value.find((turn) => turn.status === 'active') ?? null)

  function setCurrentSession(session: Session | null) {
    currentSession.value = session
  }

  function setTurns(newTurns: Turn[]) {
    turns.value = newTurns
  }

  function setLoading(value: boolean) {
    loading.value = value
  }

  function setError(value: string | null) {
    error.value = value
  }

  function clearSession() {
    currentSession.value = null
    turns.value = []
  }

  return {
    currentSession,
    turns,
    loading,
    error,
    currentTurn,
    setCurrentSession,
    setTurns,
    setLoading,
    setError,
    clearSession,
  }
})

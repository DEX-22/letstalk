import { useSupabaseClient } from '#imports'
import { sessionsRepository } from '../repositories/sessions.repository'
import { sessionsService } from '../services/sessions.service'
import { useSessionsStore } from '../stores/sessions.store'
import { SessionStatus } from '~/shared/types/constants'

export function useSessions() {
  const supabase = useSupabaseClient()
  const store = useSessionsStore()
  const remainingSeconds = ref(0)
  let sessionsSubscription: ReturnType<typeof supabase.channel> | null = null
  let turnsSubscription: ReturnType<typeof supabase.channel> | null = null
  let timerInterval: ReturnType<typeof setInterval> | null = null
  let advancingTurn = false

  async function getProfileId(): Promise<string> {
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) throw new Error('You must be logged in')
    const { data: profile, error } = await supabase
      .from('profiles')
      .select('id')
      .eq('auth_user_id', user.id)
      .single() as unknown as { data: { id: string } | null; error: Error | null }
    if (error || !profile) throw new Error('Profile not found')
    return profile.id
  }

  function updateTimer() {
    const activeTurn = store.currentTurn
    if (!activeTurn?.startedAt) {
      remainingSeconds.value = 0
      return
    }
    const elapsed = Math.floor((Date.now() - new Date(activeTurn.startedAt).getTime()) / 1000)
    remainingSeconds.value = Math.max(0, activeTurnDuration.value - elapsed)
  }

  const activeTurnDuration = ref(0)

  function startTimer(duration: number) {
    activeTurnDuration.value = duration
    if (timerInterval) clearInterval(timerInterval)
    updateTimer()
    timerInterval = setInterval(updateTimer, 1000)
  }

  function stopTimer() {
    if (timerInterval) clearInterval(timerInterval)
    timerInterval = null
    remainingSeconds.value = 0
  }

  async function loadSession(roomId: string, turnDuration: number): Promise<void> {
    store.setLoading(true)
    store.setError(null)
    try {
      const session = await sessionsService.getActiveSession(supabase, roomId)
      store.setCurrentSession(session)
      store.setTurns(session ? await sessionsService.getTurns(supabase, session.id) : [])
      if (session?.status === SessionStatus.ACTIVE) startTimer(turnDuration)
      else stopTimer()
    } catch (error) {
      store.setError(error instanceof Error ? error.message : 'Failed to load session')
    } finally {
      store.setLoading(false)
    }
  }

  async function startSession(roomId: string, turnDuration: number): Promise<void> {
    store.setLoading(true)
    store.setError(null)
    try {
      const session = await sessionsService.startSession(supabase, roomId, await getProfileId())
      store.setCurrentSession(session)
      store.setTurns(await sessionsService.getTurns(supabase, session.id))
      startTimer(turnDuration)
      subscribeToTurns(session.id, roomId, turnDuration)
    } catch (error) {
      store.setError(error instanceof Error ? error.message : 'Failed to start session')
      throw error
    } finally {
      store.setLoading(false)
    }
  }

  async function endSession(): Promise<void> {
    if (!store.currentSession) return
    store.setLoading(true)
    store.setError(null)
    try {
      await sessionsService.endSession(supabase, store.currentSession.id, await getProfileId())
      store.clearSession()
      stopTimer()
    } catch (error) {
      store.setError(error instanceof Error ? error.message : 'Failed to end session')
      throw error
    } finally {
      store.setLoading(false)
    }
  }

  async function nextParticipant(): Promise<void> {
    if (!store.currentSession || advancingTurn) return
    advancingTurn = true
    store.setError(null)
    try {
      await sessionsService.nextParticipant(supabase, store.currentSession.id, await getProfileId())
    } catch (error) {
      store.setError(error instanceof Error ? error.message : 'Failed to advance to the next participant')
      throw error
    } finally {
      advancingTurn = false
    }
  }

  function subscribeToTurns(sessionId: string, roomId: string, turnDuration: number) {
    if (turnsSubscription) turnsSubscription.unsubscribe()
    turnsSubscription = sessionsRepository.subscribeToTurns(supabase, sessionId, async () => {
      await loadSession(roomId, turnDuration)
    })
  }

  function subscribe(roomId: string, turnDuration: number) {
    if (sessionsSubscription) sessionsSubscription.unsubscribe()
    sessionsSubscription = sessionsRepository.subscribeToSessions(supabase, roomId, async () => {
      await loadSession(roomId, turnDuration)
      if (store.currentSession) subscribeToTurns(store.currentSession.id, roomId, turnDuration)
    })
    if (store.currentSession) subscribeToTurns(store.currentSession.id, roomId, turnDuration)
  }

  function unsubscribe() {
    if (sessionsSubscription) sessionsSubscription.unsubscribe()
    if (turnsSubscription) turnsSubscription.unsubscribe()
    sessionsSubscription = null
    turnsSubscription = null
    stopTimer()
  }

  return {
    currentSession: computed(() => store.currentSession),
    turns: computed(() => store.turns),
    currentTurn: computed(() => store.currentTurn),
    loading: computed(() => store.loading),
    error: computed(() => store.error),
    remainingSeconds: computed(() => remainingSeconds.value),
    loadSession,
    startSession,
    endSession,
    nextParticipant,
    subscribe,
    unsubscribe,
  }
}

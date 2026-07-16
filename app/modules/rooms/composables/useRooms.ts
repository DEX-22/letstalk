import { useSupabaseClient } from '#imports'
import { useRoomsStore } from '../stores/rooms.store'
import { roomsService } from '../services/rooms.service'
import type { CreateRoomInput, Room, Participant } from '../types'

/**
 * Rooms composable — entry point for components to interact with rooms.
 *
 * This is the ONLY place that calls useSupabaseClient().
 * Components call this composable instead of the service directly.
 */
export function useRooms() {
  const supabase = useSupabaseClient()
  const store = useRoomsStore()
  let participantsSubscription: ReturnType<typeof supabase.channel> | null = null
  let roomSubscription: ReturnType<typeof supabase.channel> | null = null

  async function getProfileId(): Promise<string> {
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) throw new Error('You must be logged in')

    const { data: profile } = await supabase
      .from('profiles')
      .select('id')
      .eq('auth_user_id', user.id)
      .single() as unknown as { data: { id: string } | null }

    if (!profile) throw new Error('Profile not found')
    return profile.id
  }

  async function createRoom(input: CreateRoomInput): Promise<Room> {
    store.setLoading(true)
    store.setError(null)

    try {
      const profileId = await getProfileId()
      const room = await roomsService.createRoom(supabase, input, profileId)
      store.setCurrentRoom(room)
      return room
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Failed to create room'
      store.setError(message)
      throw err
    } finally {
      store.setLoading(false)
    }
  }

  async function joinRoom(code: string): Promise<Room> {
    store.setLoading(true)
    store.setError(null)

    try {
      const profileId = await getProfileId()
      const room = await roomsService.joinRoom(supabase, code, profileId)
      store.setCurrentRoom(room)
      return room
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Failed to join room'
      store.setError(message)
      throw err
    } finally {
      store.setLoading(false)
    }
  }

  async function leaveRoom(roomId: string): Promise<void> {
    store.setLoading(true)
    store.setError(null)

    try {
      const profileId = await getProfileId()
      await roomsService.leaveRoom(supabase, roomId, profileId)
      unsubscribe()
      store.clearRoom()
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Failed to leave room'
      store.setError(message)
      throw err
    } finally {
      store.setLoading(false)
    }
  }

  async function loadRoom(id: string): Promise<void> {
    store.setLoading(true)
    store.setError(null)

    try {
      const room = await roomsService.getRoomById(supabase, id)
      store.setCurrentRoom(room)

      if (room) {
        const participants = await roomsService.getParticipants(supabase, id)
        store.setParticipants(participants)
      }
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Failed to load room'
      store.setError(message)
    } finally {
      store.setLoading(false)
    }
  }

  async function loadActiveRooms(): Promise<void> {
    store.setLoading(true)
    store.setError(null)

    try {
      const rooms = await roomsService.getActiveRooms(supabase)
      store.setRooms(rooms)
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Failed to load rooms'
      store.setError(message)
    } finally {
      store.setLoading(false)
    }
  }

  async function updateRoomSettings(
    roomId: string,
    settings: { name?: string; turnDuration?: number; maxParticipants?: number },
  ): Promise<void> {
    store.setError(null)

    try {
      const profileId = await getProfileId()
      await roomsService.updateRoomSettings(supabase, roomId, profileId, settings)
      await loadRoom(roomId)
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Failed to update room settings'
      store.setError(message)
      throw err
    }
  }

  function subscribeToParticipants(roomId: string) {
    if (participantsSubscription) {
      participantsSubscription.unsubscribe()
    }

    roomsService.subscribeToParticipants(supabase, roomId, (participants) => {
      store.setParticipants(participants)
    }).then((subscription) => {
      participantsSubscription = subscription
    })
  }

  function subscribeToRoom(roomId: string) {
    if (roomSubscription) {
      roomSubscription.unsubscribe()
    }

    roomsService.subscribeToRoom(supabase, roomId, (room) => {
      store.setCurrentRoom(room)
    }).then((subscription) => {
      roomSubscription = subscription
    })
  }

  function unsubscribe() {
    if (participantsSubscription) {
      participantsSubscription.unsubscribe()
      participantsSubscription = null
    }
    if (roomSubscription) {
      roomSubscription.unsubscribe()
      roomSubscription = null
    }
  }

  return {
    rooms: computed(() => store.rooms),
    currentRoom: computed(() => store.currentRoom),
    participants: computed(() => store.participants),
    loading: computed(() => store.loading),
    error: computed(() => store.error),

    createRoom,
    joinRoom,
    leaveRoom,
    loadRoom,
    loadActiveRooms,
    updateRoomSettings,
    subscribeToParticipants,
    subscribeToRoom,
    unsubscribe,
  }
}
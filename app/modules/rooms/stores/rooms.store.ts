import { defineStore } from 'pinia'
import type { Room, Participant } from '../types'
import { ParticipantStatus } from '~/shared/types/constants'

export const useRoomsStore = defineStore('rooms', () => {
  const rooms = ref<Room[]>([])
  const currentRoom = ref<Room | null>(null)
  const participants = ref<Participant[]>([])
  const loading = ref(false)
  const error = ref<string | null>(null)

  function setRooms(newRooms: Room[]) {
    rooms.value = newRooms
  }

  function setCurrentRoom(room: Room | null) {
    currentRoom.value = room
  }

  function setParticipants(newParticipants: Participant[]) {
    participants.value = newParticipants
  }

  function addParticipant(participant: Participant) {
    const exists = participants.value.find((p) => p.id === participant.id)
    if (!exists) {
      participants.value.push(participant)
    }
  }

  function removeParticipant(profileId: string) {
    const participant = participants.value.find((p) => p.profileId === profileId)
    if (participant) {
      participant.status = ParticipantStatus.LEFT
    }
  }

  function setLoading(value: boolean) {
    loading.value = value
  }

  function setError(value: string | null) {
    error.value = value
  }

  function clearRoom() {
    currentRoom.value = null
    participants.value = []
  }

  return {
    rooms,
    currentRoom,
    participants,
    loading,
    error,
    setRooms,
    setCurrentRoom,
    setParticipants,
    addParticipant,
    removeParticipant,
    setLoading,
    setError,
    clearRoom,
  }
})
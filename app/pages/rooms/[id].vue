<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})

import { useRooms } from '~/modules/rooms/composables/useRooms'

const route = useRoute()
const roomId = route.params.id as string

const {
  currentRoom,
  participants,
  loading,
  error,
  loadRoom,
  leaveRoom,
  updateRoomSettings,
  subscribeToParticipants,
  subscribeToRoom,
  unsubscribe,
} = useRooms()

const showSettings = ref(false)
const showQRCode = ref(false)
const isHost = ref(false)

onMounted(async () => {
  await loadRoom(roomId)
  if (currentRoom.value) {
    subscribeToParticipants(roomId)
    subscribeToRoom(roomId)
  }
})

onUnmounted(() => {
  unsubscribe()
})

watch(currentRoom, (room) => {
  if (room) {
    // Check if current user is host
    checkIsHost()
  }
})

async function checkIsHost() {
  const supabase = useSupabaseClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (user && currentRoom.value) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('id')
      .eq('auth_user_id', user.id)
      .single() as any
    if (profile) {
      isHost.value = profile.id === currentRoom.value.hostId
    }
  }
}

async function handleLeave() {
  try {
    await leaveRoom(roomId)
    navigateTo('/rooms')
  } catch {
    // Error handled by composable
  }
}

async function handleUpdateSettings(settings: { name?: string; turnDuration?: number; maxParticipants?: number }) {
  try {
    await updateRoomSettings(roomId, settings)
    showSettings.value = false
  } catch {
    // Error handled by composable
  }
}

const onlineParticipants = computed(() =>
  participants.value.filter((p) => p.status === 'online' || p.status === 'away')
)

const host = computed(() =>
  participants.value.find((p) => p.role === 'host')
)
</script>

<template>
  <div class="flex flex-1 flex-col gap-4 py-6">
    <!-- Loading state -->
    <div v-if="loading" class="flex justify-center py-12">
      <LoadingSpinner size="lg" />
    </div>

    <!-- Error state -->
    <div v-else-if="error" class="py-8">
      <ErrorMessage :message="error" />
    </div>

    <!-- Room content -->
    <template v-else-if="currentRoom">
      <!-- Room header -->
      <div class="flex items-center justify-between">
        <div>
          <h2 class="text-xl font-semibold text-slate-100">{{ currentRoom.name }}</h2>
          <p class="mt-1 text-sm text-slate-400">
            {{ currentRoom.languageName }} · {{ currentRoom.topicName }} · {{ currentRoom.levelName }}
          </p>
        </div>
        <div class="flex gap-2">
          <Button
            v-if="isHost"
            variant="outline"
            size="sm"
            @click="showSettings = true"
          >
            Settings
          </Button>
          <Button
            variant="outline"
            size="sm"
            @click="showQRCode = true"
          >
            QR Code
          </Button>
          <Button
            variant="ghost"
            size="sm"
            class="text-red-400 hover:text-red-300"
            @click="handleLeave"
          >
            Leave
          </Button>
        </div>
      </div>

      <!-- Room info card -->
      <div class="rounded-xl bg-slate-800 p-4">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-sm text-slate-400">Room Code</p>
            <p class="mt-1 text-2xl font-bold tracking-widest text-primary-400">
              {{ currentRoom.code }}
            </p>
          </div>
          <div class="text-right">
            <p class="text-sm text-slate-400">Status</p>
            <span class="mt-1 inline-block rounded-full bg-green-600/20 px-3 py-1 text-sm text-green-400">
              {{ currentRoom.status }}
            </span>
          </div>
        </div>

        <div class="mt-4 grid grid-cols-2 gap-4 border-t border-slate-700 pt-4">
          <div>
            <p class="text-xs text-slate-500">Turn Duration</p>
            <p class="text-sm text-slate-300">{{ currentRoom.turnDuration }}s</p>
          </div>
          <div>
            <p class="text-xs text-slate-500">Participants</p>
            <p class="text-sm text-slate-300">{{ onlineParticipants.length }}/{{ currentRoom.maxParticipants }}</p>
          </div>
          <div>
            <p class="text-xs text-slate-500">Host</p>
            <p class="text-sm text-slate-300">{{ host?.name ?? currentRoom.hostName }}</p>
          </div>
          <div>
            <p class="text-xs text-slate-500">Created</p>
            <p class="text-sm text-slate-300">{{ new Date(currentRoom.createdAt).toLocaleDateString() }}</p>
          </div>
        </div>
      </div>

      <!-- Participants section -->
      <div>
        <h3 class="mb-3 text-sm font-medium text-slate-400">
          Participants ({{ onlineParticipants.length }})
        </h3>

        <div v-if="participants.length === 0" class="py-8">
          <EmptyState
            title="No participants yet"
            description="Share the room code to invite others"
          />
        </div>

        <div v-else class="flex flex-col gap-2">
          <div
            v-for="participant in participants"
            :key="participant.id"
            class="flex items-center gap-3 rounded-xl bg-slate-800 p-3"
          >
            <div class="relative flex h-10 w-10 items-center justify-center rounded-full bg-slate-700">
              <span class="text-sm font-medium text-slate-300">
                {{ participant.name.charAt(0) }}
              </span>
              <span
                :class="[
                  'absolute -right-0.5 -top-0.5 h-3 w-3 rounded-full border-2 border-slate-800',
                  participant.status === 'online' ? 'bg-green-500' :
                  participant.status === 'away' ? 'bg-yellow-500' : 'bg-slate-500'
                ]"
              />
            </div>
            <div class="flex-1">
              <p class="text-sm font-medium text-slate-100">{{ participant.name }}</p>
              <p class="text-xs text-slate-500">
                {{ participant.role === 'host' ? 'Host' : 'Participant' }}
              </p>
            </div>
          </div>
        </div>
      </div>
    </template>

    <!-- Not found state -->
    <div v-else class="py-12">
      <EmptyState
        title="Room not found"
        description="This room may have been deleted or is no longer available"
      />
    </div>

    <!-- Settings modal -->
    <div
      v-if="showSettings && currentRoom"
      class="fixed inset-0 z-50 flex items-end sm:items-center justify-center bg-black/50"
    >
      <div class="w-full max-w-md rounded-t-2xl sm:rounded-2xl bg-slate-900 p-6">
        <div class="mb-6 flex items-center justify-between">
          <h3 class="text-lg font-semibold text-slate-100">Room Settings</h3>
          <button class="text-slate-400 hover:text-slate-300" @click="showSettings = false">
            <span class="sr-only">Close</span>
            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <form
          class="flex flex-col gap-4"
          @submit.prevent="handleUpdateSettings({
            name: ($event.target as any).name?.value,
            turnDuration: Number(($event.target as any).turnDuration?.value),
            maxParticipants: Number(($event.target as any).maxParticipants?.value),
          })"
        >
          <div>
            <label class="mb-1 block text-sm text-slate-400" for="name">Room Name</label>
            <input
              id="name"
              :value="currentRoom.name"
              type="text"
              class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"
            />
          </div>

          <div class="grid grid-cols-2 gap-3">
            <div>
              <label class="mb-1 block text-sm text-slate-400" for="turnDuration">Turn Duration (s)</label>
              <input
                id="turnDuration"
                :value="currentRoom.turnDuration"
                type="number"
                min="30"
                max="300"
                class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"
              />
            </div>
            <div>
              <label class="mb-1 block text-sm text-slate-400" for="maxParticipants">Max Participants</label>
              <input
                id="maxParticipants"
                :value="currentRoom.maxParticipants"
                type="number"
                min="2"
                max="12"
                class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"
              />
            </div>
          </div>

          <Button type="submit" variant="default" size="lg" class="mt-2 w-full">
            Save Changes
          </Button>
        </form>
      </div>
    </div>

    <!-- QR Code modal -->
    <div
      v-if="showQRCode && currentRoom"
      class="fixed inset-0 z-50 flex items-end sm:items-center justify-center bg-black/50"
    >
      <div class="w-full max-w-sm rounded-t-2xl sm:rounded-2xl bg-slate-900 p-6">
        <div class="mb-6 flex items-center justify-between">
          <h3 class="text-lg font-semibold text-slate-100">Share Room</h3>
          <button class="text-slate-400 hover:text-slate-300" @click="showQRCode = false">
            <span class="sr-only">Close</span>
            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <QRCode :code="currentRoom.code" />
      </div>
    </div>
  </div>
</template>

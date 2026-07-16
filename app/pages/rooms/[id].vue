<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})


import QRCode from '~/modules/rooms/components/QRCode.vue'
import { useAuth } from '~/modules/auth/composables/useAuth'
import { useCards } from '~/modules/cards/composables/useCards'
import { useRooms } from '~/modules/rooms/composables/useRooms'
import { useSessions } from '~/modules/sessions/composables/useSessions'

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
  unsubscribe: unsubscribeRooms,
} = useRooms()

const {
  currentSession,
  turns,
  currentTurn,
  loading: sessionLoading,
  error: sessionError,
  remainingSeconds,
  loadSession,
  startSession,
  endSession,
  nextParticipant,
  subscribe: subscribeToSession,
  unsubscribe: unsubscribeSession,
} = useSessions()

const { user } = useAuth()
const { activeCard, error: cardError, loadCurrentTurnCard } = useCards()

const showSettings = ref(false)
const showQRCode = ref(false)
const isHost = ref(false)
const activeBubbleWord = ref<string | null>(null)

function toggleBubble(word: string) {
  activeBubbleWord.value = activeBubbleWord.value === word ? null : word
}

function closeBubble() {
  activeBubbleWord.value = null
}

const currentParticipant = computed(() => {
  const currentUser = user.value
  if (!currentUser || !participants.value) return null
  return participants.value.find((p) => p.profileId === currentUser.id)
})

const isMyTurn = computed(() => {
  if (!currentParticipant.value || !currentTurn.value) return false
  return currentTurn.value.participantId === currentParticipant.value.id
})

onMounted(async () => {
  window.addEventListener('click', closeBubble)
  await loadRoom(roomId)
  if (currentRoom.value) {
    await subscribeToParticipants(roomId)
    subscribeToRoom(roomId)
    await loadSession(roomId, currentRoom.value.turnDuration)
    subscribeToSession(roomId, currentRoom.value.turnDuration)
  }
})

onUnmounted(() => {
  window.removeEventListener('click', closeBubble)
  unsubscribeRooms()
  unsubscribeSession()
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

async function handleStartSession() {
  if (!currentRoom.value) return
  try {
    await startSession(roomId, currentRoom.value.turnDuration)
  } catch {
    // The session composable exposes the error in the UI.
  }
}

async function handleEndSession() {
  try {
    await endSession()
  } catch {
    // The session composable exposes the error in the UI.
  }
}

async function handleNextParticipant() {
  try {
    await nextParticipant()
  } catch {
    // The session composable exposes the error in the UI.
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

const formattedTime = computed(() => {
  const minutes = Math.floor(remainingSeconds.value / 60)
  const seconds = remainingSeconds.value % 60
  return `${minutes}:${seconds.toString().padStart(2, '0')}`
})

watch(remainingSeconds, (seconds) => {
  if (
    seconds === 0
    && currentSession.value?.status === 'active'
    && currentTurn.value
    && isHost.value
  ) {
    handleNextParticipant()
  }
})

watch([currentSession, currentTurn], ([session]) => {
  loadCurrentTurnCard(session?.id ?? null)
}, { immediate: true })
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
            v-if="isHost && currentSession"
            variant="outline"
            size="sm"
            @click="handleEndSession"
          >
            End Session
          </Button>
          <Button
            v-if="isHost && !currentSession"
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

      <!-- Session view -->
      <section v-if="currentSession" class="rounded-xl bg-slate-800 p-4">
        <div class="flex items-start justify-between gap-4">
          <div class="flex-1">
            <p class="text-xs font-medium uppercase tracking-wide text-slate-400">Current turn</p>
            <p class="mt-1 text-lg font-semibold text-slate-100">
              {{ currentTurn?.participantName ?? 'Preparing next turn' }}
            </p>
            <!-- Show the question directly below the current turn's name for other participants -->
            <p v-if="!isMyTurn && activeCard" class="mt-2 text-sm text-slate-300 italic font-medium border-l-2 border-blue-500/50 pl-3">
              "{{ activeCard.question }}"
            </p>
          </div>
          <p class="font-mono text-3xl font-bold text-primary-400 shrink-0" aria-live="polite">
            {{ formattedTime }}
          </p>
        </div>
        
        <!-- Full conversation card: only shown to the user whose turn it is -->
        <div v-if="isMyTurn && activeCard" class="mt-4 border-t border-slate-700 pt-4">
          <div class="rounded-xl border border-blue-500/25 bg-blue-950/20 p-5 shadow-lg shadow-blue-950/20 transition-all duration-300">
            <div class="flex items-center gap-2 mb-3">
              <span class="inline-flex items-center rounded-full bg-blue-500/10 px-2.5 py-0.5 text-xs font-semibold text-blue-400 ring-1 ring-inset ring-blue-500/30 uppercase tracking-wider">
                Topic: {{ activeCard.topic }}
              </span>
            </div>
            <h4 class="text-lg font-bold text-slate-50 leading-relaxed mb-4">{{ activeCard.question }}</h4>
            <p v-if="activeCard.context" class="text-sm text-slate-300 leading-relaxed mb-4 bg-slate-900/40 rounded-lg p-3 border-l-2 border-slate-500">
              {{ activeCard.context }}
            </p>
            <div v-if="activeCard.vocabulary && activeCard.vocabulary.length > 0" class="border-t border-slate-700/50 pt-4">
              <p class="text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2.5">Suggested Vocabulary (Click for definition)</p>
              <div class="flex flex-wrap gap-2">
                <div 
                  v-for="item in activeCard.vocabulary" 
                  :key="item.word"
                  class="relative"
                >
                  <button 
                    type="button"
                    class="inline-flex items-center rounded-lg bg-slate-800/80 border border-slate-700/60 hover:bg-slate-700/85 px-3 py-1.5 text-xs font-medium text-slate-300 transition-colors shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500/50"
                    @click.stop="toggleBubble(item.word)"
                  >
                    {{ item.word }}
                  </button>
                  
                  <!-- Bubble tooltip -->
                  <Transition
                    enter-active-class="transition ease-out duration-100"
                    enter-from-class="transform opacity-0 scale-95 -translate-y-1"
                    enter-to-class="transform opacity-100 scale-100 translate-y-0"
                    leave-active-class="transition ease-in duration-75"
                    leave-from-class="transform opacity-100 scale-100 translate-y-0"
                    leave-to-class="transform opacity-0 scale-95 -translate-y-1"
                  >
                    <div 
                      v-if="activeBubbleWord === item.word"
                      class="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 z-20 w-48 bg-slate-950 border border-slate-700 rounded-lg p-2.5 shadow-xl text-xs text-slate-200 leading-normal pointer-events-auto"
                      @click.stop
                    >
                      <p class="font-semibold text-blue-400 mb-1">{{ item.word }}</p>
                      <p>{{ item.definition || 'No definition available.' }}</p>
                      <!-- Arrow -->
                      <div class="absolute top-full left-1/2 -translate-x-1/2 w-0 h-0 border-4 border-transparent border-t-slate-950"></div>
                      <!-- Arrow border shadow helper -->
                      <div class="absolute top-full left-1/2 -translate-x-1/2 w-0 h-0 border-4 border-transparent border-t-slate-700 -z-10 translate-y-[1px]"></div>
                    </div>
                  </Transition>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div v-else-if="cardError" class="mt-4 border-t border-slate-700 pt-3">
          <ErrorMessage :message="cardError" />
        </div>
        <div class="mt-4 flex items-center justify-between border-t border-slate-700 pt-3">
          <p class="text-sm text-slate-400">
            {{ currentTurn ? `${currentTurn.participantName}'s turn` : 'Preparing next participant' }}
          </p>
          <Button v-if="isHost" size="sm" @click="handleNextParticipant">
            Next Participant
          </Button>
        </div>
      </section>

      <!-- Room view -->
      <template v-else>
        <div v-if="sessionError" class="py-2">
          <ErrorMessage :message="sessionError" />
        </div>

        <div v-if="isHost" class="py-2">
          <Button
            variant="default"
            size="lg"
            :loading="sessionLoading"
            @click="handleStartSession"
          >
            Start Session
          </Button>
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

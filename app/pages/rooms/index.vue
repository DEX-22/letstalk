<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})

import { useRooms } from '~/modules/rooms/composables/useRooms'
import { useAuth } from '~/modules/auth/composables/useAuth'
import CreateRoomModal from '~/modules/rooms/components/CreateRoomModal.vue'
import JoinRoomModal from '~/modules/rooms/components/JoinRoomModal.vue'

const { user, logout } = useAuth()
const { rooms, loading, error, loadActiveRooms } = useRooms()

const showCreateModal = ref(false)
const showJoinModal = ref(false)

onMounted(() => {
  loadActiveRooms()
})

function handleRoomCreated(roomId: string) {
  showCreateModal.value = false
  navigateTo(`/rooms/${roomId}`)
}

function handleRoomJoined(roomId: string) {
  showJoinModal.value = false
  navigateTo(`/rooms/${roomId}`)
}
</script>

<template>
  <div class="flex flex-1 flex-col gap-4 py-6">
    <div class="flex items-center justify-between">
      <h2 class="text-xl font-semibold text-slate-100">Rooms</h2>
      <div class="flex gap-2">
        <Button variant="outline" size="sm" @click="showJoinModal = true">
          Join Room
        </Button>
        <Button variant="default" size="sm" @click="showCreateModal = true">
          Create Room
        </Button>
      </div>
    </div>

    <!-- User card -->
    <div class="flex items-center gap-3 rounded-xl bg-slate-800 p-3">
      <div class="flex h-10 w-10 items-center justify-center rounded-full bg-primary-600">
        <span class="text-sm font-medium text-white">
          {{ user?.name?.charAt(0) ?? '?' }}
        </span>
      </div>
      <div class="flex-1">
        <p class="text-sm font-medium text-slate-100">{{ user?.name }}</p>
        <p class="text-xs text-slate-400">
          {{ user?.role === 'guest' ? 'Guest' : 'Signed in' }}
        </p>
      </div>
      <Button variant="ghost" size="sm" @click="logout">
        Sign out
      </Button>
    </div>

    <!-- Loading state -->
    <div v-if="loading" class="flex justify-center py-12">
      <LoadingSpinner size="lg" />
    </div>

    <!-- Error state -->
    <div v-else-if="error" class="py-8">
      <ErrorMessage :message="error" />
    </div>

    <!-- Rooms list -->
    <div v-else-if="rooms.length > 0" class="flex flex-col gap-3">
      <NuxtLink
        v-for="room in rooms"
        :key="room.id"
        :to="`/rooms/${room.id}`"
        class="flex flex-col gap-2 rounded-xl bg-slate-800 p-4 transition-colors hover:bg-slate-750"
      >
        <div class="flex items-center justify-between">
          <h3 class="font-medium text-slate-100">{{ room.name }}</h3>
          <span class="rounded-full bg-primary-600/20 px-2 py-0.5 text-xs text-primary-400">
            {{ room.status }}
          </span>
        </div>
        <div class="flex items-center gap-3 text-xs text-slate-400">
          <span>{{ room.languageName }}</span>
          <span>·</span>
          <span>{{ room.topicName }}</span>
          <span>·</span>
          <span>{{ room.levelName }}</span>
        </div>
        <div class="flex items-center justify-between text-xs">
          <span class="text-slate-500">
            Host: {{ room.hostName }}
          </span>
          <span class="text-slate-400">
            {{ room.participantCount }}/{{ room.maxParticipants }} participants
          </span>
        </div>
      </NuxtLink>
    </div>

    <!-- Empty state -->
    <div v-else class="py-12">
      <EmptyState
        title="No active rooms"
        description="Create a room or join one to get started"
      />
    </div>

    <!-- Modals -->
    <CreateRoomModal
      v-if="showCreateModal"
      @close="showCreateModal = false"
      @created="handleRoomCreated"
    />
    <JoinRoomModal
      v-if="showJoinModal"
      @close="showJoinModal = false"
      @joined="handleRoomJoined"
    />
  </div>
</template>

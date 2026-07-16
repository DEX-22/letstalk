<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})

import { useAuth } from '~/modules/auth/composables/useAuth'

const { user, logout } = useAuth()
</script>

<template>
  <div class="flex flex-1 flex-col gap-4 py-6">
    <div class="flex items-center justify-between">
      <h2 class="text-xl font-semibold text-slate-100">Rooms</h2>
      <Button variant="default" size="sm">
        Create Room
      </Button>
    </div>

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

    <EmptyState
      title="No rooms yet"
      description="Create a room or join one to get started"
    />
  </div>
</template>
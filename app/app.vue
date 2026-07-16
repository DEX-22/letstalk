<script setup lang="ts">
import { useAuth } from '~/modules/auth/composables/useAuth'

// Initialize auth on app load
const { initialize } = useAuth()

// Auth sessions are stored by Supabase in the browser. Initializing during SSR
// would serialize an unauthenticated state into the page and skip restoration
// after hydration.
if (import.meta.client) {
  await initialize()
}
</script>

<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>

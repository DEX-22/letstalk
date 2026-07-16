<script setup lang="ts">
import { useAuth } from '~/modules/auth/composables/useAuth'

// Initialize auth on app load
const { initialize } = useAuth()
await initialize()
</script>

<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>
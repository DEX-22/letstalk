<script setup lang="ts">
interface ErrorProps {
  error: {
    statusCode: number
    statusMessage?: string
    message?: string
  }
}

const props = defineProps<ErrorProps>()

const handleClearError = () => clearError({ redirect: '/' })
</script>

<template>
  <div class="flex min-h-dvh flex-col items-center justify-center gap-6 bg-slate-950 px-4">
    <div class="text-center">
      <p class="text-6xl font-bold text-primary-500">{{ error.statusCode }}</p>
      <h1 class="mt-4 text-xl font-semibold text-slate-100">
        {{ error.statusMessage ?? 'Something went wrong' }}
      </h1>
      <p v-if="error.message" class="mt-2 text-sm text-slate-400">
        {{ error.message }}
      </p>
    </div>
    <Button variant="default" @click="handleClearError">
      Go Home
    </Button>
  </div>
</template>
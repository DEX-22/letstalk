<script setup lang="ts">
interface ErrorMessageProps {
  title?: string
  message: string
  retryable?: boolean
}

withDefaults(defineProps<ErrorMessageProps>(), {
  title: 'Something went wrong',
  retryable: true,
})

const emit = defineEmits<{
  retry: []
}>()
</script>

<template>
  <div
    class="flex flex-col items-center justify-center gap-4 rounded-2xl border border-red-900/50 bg-red-950/20 px-4 py-8 text-center"
    role="alert"
  >
    <div
      class="flex h-12 w-12 items-center justify-center rounded-full bg-red-900/30"
    >
      <span class="text-xl text-red-400">!</span>
    </div>
    <div class="space-y-1">
      <h3 class="text-base font-semibold text-red-300">{{ title }}</h3>
      <p class="text-sm text-red-400/80">{{ message }}</p>
    </div>
    <button
      v-if="retryable"
      class="rounded-lg bg-red-900/30 px-4 py-2 text-sm font-medium text-red-300 transition-colors hover:bg-red-900/50"
      @click="emit('retry')"
    >
      Try again
    </button>
  </div>
</template>
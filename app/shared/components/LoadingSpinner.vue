<script setup lang="ts">
interface LoadingSpinnerProps {
  size?: 'sm' | 'default' | 'lg'
  label?: string
}

withDefaults(defineProps<LoadingSpinnerProps>(), {
  size: 'default',
  label: 'Loading...',
})
</script>

<template>
  <div
    class="flex flex-col items-center justify-center gap-3"
    role="status"
    aria-live="polite"
  >
    <span
      :class="{
        'h-4 w-4': size === 'sm',
        'h-6 w-6': size === 'default',
        'h-8 w-8': size === 'lg',
      }"
      class="animate-spin rounded-full border-2 border-primary-500 border-t-transparent"
    />
    <span v-if="label" class="text-sm text-slate-400">{{ label }}</span>
  </div>
</template>
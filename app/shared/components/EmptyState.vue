<script setup lang="ts">
interface EmptyStateProps {
  icon?: string
  title: string
  description?: string
}

defineProps<EmptyStateProps>()
</script>

<template>
  <div
    class="flex flex-col items-center justify-center gap-4 px-4 py-12 text-center"
  >
    <div
      class="flex h-16 w-16 items-center justify-center rounded-2xl bg-slate-800"
    >
      <slot name="icon">
        <span class="text-2xl text-slate-400">{{ icon }}</span>
      </slot>
    </div>
    <div class="space-y-1">
      <h3 class="text-lg font-semibold text-slate-100">{{ title }}</h3>
      <p v-if="description" class="text-sm text-slate-400">
        {{ description }}
      </p>
    </div>
    <slot />
  </div>
</template>
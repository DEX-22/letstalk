<script setup lang="ts">
useHead({
  htmlAttrs: {
    class: 'dark',
  },
})
</script>

<template>
  <div class="flex min-h-dvh flex-col bg-slate-950">
    <main class="mx-auto flex w-full max-w-lg flex-1 flex-col px-4">
      <slot />
    </main>
  </div>
</template>
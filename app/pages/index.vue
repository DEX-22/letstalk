<script setup lang="ts">
definePageMeta({
  title: 'Welcome',
})
</script>

<template>
  <div class="flex flex-1 flex-col items-center justify-center gap-6">
    <div class="text-center">
      <h1 class="text-3xl font-bold text-slate-100">Let's Talk</h1>
      <p class="mt-2 text-sm text-slate-400">
        Guided conversation sessions for language practice
      </p>
    </div>

    <div class="flex w-full flex-col gap-3">
      <Button variant="default" size="lg" class="w-full">
        Continue as Guest
      </Button>
      <Button variant="outline" size="lg" class="w-full">
        Sign in with Google
      </Button>
    </div>
  </div>
</template>
<script setup lang="ts">
definePageMeta({
  title: 'Rooms',
})
</script>

<template>
  <div class="flex flex-1 flex-col gap-4 py-6">
    <div class="flex items-center justify-between">
      <h2 class="text-xl font-semibold text-slate-100">Rooms</h2>
      <Button variant="default" size="sm">
        Create Room
      </Button>
    </div>

    <EmptyState
      title="No rooms yet"
      description="Create a room or join one to get started"
    />
  </div>
</template>
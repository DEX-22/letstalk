<script setup lang="ts">
const route = useRoute('rooms-id')

definePageMeta({
  title: 'Room',
})
</script>

<template>
  <div class="flex flex-1 flex-col gap-4 py-6">
    <h2 class="text-xl font-semibold text-slate-100">
      Room {{ route.params.id }}
    </h2>
  </div>
</template>
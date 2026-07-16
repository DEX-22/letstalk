<script setup lang="ts">
import { useClipboard } from '@vueuse/core'

const props = defineProps<{
  code: string
  size?: number
}>()

const qrCodeUrl = computed(() => {
  const qrSize = props.size ?? 200
  return `https://api.qrserver.com/v1/create-qr-code/?size=${qrSize}x${qrSize}&data=${encodeURIComponent(props.code)}`
})

const { copy, copied } = useClipboard({ source: computed(() => props.code) })
</script>

<template>
  <div class="flex flex-col items-center gap-3">
    <div class="rounded-xl bg-white p-3">
      <img
        :src="qrCodeUrl"
        :width="size ?? 200"
        :height="size ?? 200"
        :alt="`QR Code for room ${code}`"
        class="h-auto"
      />
    </div>

    <div class="flex items-center gap-2">
      <code class="rounded-lg bg-slate-800 px-3 py-1.5 text-lg font-bold tracking-widest text-slate-100">
        {{ code }}
      </code>
      <Button
        variant="outline"
        size="sm"
        @click="copy()"
      >
        <span v-if="copied">Copied!</span>
        <span v-else>Copy</span>
      </Button>
    </div>
  </div>
</template>
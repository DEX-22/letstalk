<script setup lang="ts">
import { useFormValidation } from '~/shared/composables/useFormValidation'
import { joinRoomSchema } from '../validators/rooms.validator'
import { useRooms } from '../composables/useRooms'
import type { JoinRoomForm } from '../validators/rooms.validator'

const emit = defineEmits<{
  close: []
  joined: [roomId: string]
}>()

const { joinRoom } = useRooms()

const { errors, handleSubmit, isSubmitting, setFieldValue, useFieldValue } = useFormValidation(joinRoomSchema)

const codeValue = useFieldValue('code')

const onSubmit = handleSubmit(async (values: JoinRoomForm) => {
  try {
    const room = await joinRoom(values.code)
    emit('joined', room.id)
  } catch {
    // Error is handled by the composable
  }
})
</script>

<template>
  <div class="fixed inset-0 z-50 flex items-end sm:items-center justify-center bg-black/50">
    <div class="w-full max-w-md rounded-t-2xl sm:rounded-2xl bg-slate-900 p-6">
      <div class="mb-6 flex items-center justify-between">
        <h2 class="text-lg font-semibold text-slate-100">Join Room</h2>
        <button
          class="text-slate-400 hover:text-slate-300"
          @click="emit('close')"
        >
          <span class="sr-only">Close</span>
          <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>

      <form class="flex flex-col gap-4" @submit="onSubmit">
        <div>
          <label class="mb-1 block text-sm text-slate-400" for="code">Room Code</label>
          <input
            id="code"
            :value="codeValue"
            type="text"
            placeholder="e.g. TALK42"
            maxlength="6"
            class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-center text-2xl font-bold tracking-[0.5em] uppercase text-slate-100 placeholder:text-sm placeholder:tracking-normal placeholder:font-normal placeholder:text-slate-400 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"
            :disabled="isSubmitting"
            @input="setFieldValue('code', ($event.target as HTMLInputElement).value.toUpperCase())"
          />
          <span v-if="errors.code" class="mt-1 block text-center text-xs text-red-400" role="alert">
            {{ errors.code }}
          </span>
        </div>

        <Button
          type="submit"
          variant="default"
          size="lg"
          class="w-full"
          :loading="isSubmitting"
        >
          Join Room
        </Button>
      </form>
    </div>
  </div>
</template>
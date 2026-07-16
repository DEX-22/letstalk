<script setup lang="ts">
import { useFormValidation } from '~/shared/composables/useFormValidation'
import { createRoomSchema } from '../validators/rooms.validator'
import { useRooms } from '../composables/useRooms'
import type { CreateRoomForm } from '../validators/rooms.validator'

const emit = defineEmits<{
  close: []
  created: [roomId: string]
}>()

const { createRoom, loading } = useRooms()

const { errors, handleSubmit, isSubmitting, setFieldValue, useFieldValue } = useFormValidation(createRoomSchema)

const nameValue = useFieldValue('name')
const languageIdValue = useFieldValue('languageId')
const topicIdValue = useFieldValue('topicId')
const levelIdValue = useFieldValue('levelId')
const turnDurationValue = useFieldValue('turnDuration')
const maxParticipantsValue = useFieldValue('maxParticipants')

const languages = ref<Array<{ id: string; name: string; code: string }>>([])
const topics = ref<Array<{ id: string; name: string; icon: string | null }>>([])
const levels = ref<Array<{ id: string; level: string; name: string }>>([])

const supabase = useSupabaseClient()

onMounted(async () => {
  const [langRes, topicRes, levelRes] = await Promise.all([
    supabase.from('languages').select('id, name, code').eq('is_active', true),
    supabase.from('topics').select('id, name, icon').eq('is_active', true),
    supabase.from('levels').select('id, level, name').order('sort_order'),
  ])

  languages.value = (langRes.data as any) ?? []
  topics.value = (topicRes.data as any) ?? []
  levels.value = (levelRes.data as any) ?? []
})

const onSubmit = handleSubmit(async (values: CreateRoomForm) => {
  try {
    const room = await createRoom({
      name: values.name,
      languageId: values.languageId,
      topicId: values.topicId,
      levelId: values.levelId,
      turnDuration: values.turnDuration,
      maxParticipants: values.maxParticipants,
    })
    emit('created', room.id)
  } catch {
    // Error is handled by the composable
  }
})
</script>

<template>
  <div class="fixed inset-0 z-50 flex items-end sm:items-center justify-center bg-black/50">
    <div class="w-full max-w-md rounded-t-2xl sm:rounded-2xl bg-slate-900 p-6">
      <div class="mb-6 flex items-center justify-between">
        <h2 class="text-lg font-semibold text-slate-100">Create Room</h2>
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
          <label class="mb-1 block text-sm text-slate-400" for="name">Room Name</label>
          <input
            id="name"
            :value="nameValue"
            type="text"
            placeholder="e.g. English Conversation Club"
            class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 placeholder:text-slate-400 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"
            :disabled="isSubmitting"
            @input="setFieldValue('name', ($event.target as HTMLInputElement).value)"
          />
          <span v-if="errors.name" class="mt-1 block text-xs text-red-400" role="alert">
            {{ errors.name }}
          </span>
        </div>

        <div class="grid grid-cols-2 gap-3">
          <div>
            <label class="mb-1 block text-sm text-slate-400" for="languageId">Language</label>
            <select
              id="languageId"
              :value="languageIdValue"
              class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"
              :disabled="isSubmitting"
              @change="setFieldValue('languageId', ($event.target as HTMLSelectElement).value)"
            >
              <option value="" disabled>Select</option>
              <option v-for="lang in languages" :key="lang.id" :value="lang.id">
                {{ lang.name }}
              </option>
            </select>
            <span v-if="errors.languageId" class="mt-1 block text-xs text-red-400" role="alert">
              {{ errors.languageId }}
            </span>
          </div>

          <div>
            <label class="mb-1 block text-sm text-slate-400" for="levelId">Level</label>
            <select
              id="levelId"
              :value="levelIdValue"
              class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"
              :disabled="isSubmitting"
              @change="setFieldValue('levelId', ($event.target as HTMLSelectElement).value)"
            >
              <option value="" disabled>Select</option>
              <option v-for="level in levels" :key="level.id" :value="level.id">
                {{ level.name }}
              </option>
            </select>
            <span v-if="errors.levelId" class="mt-1 block text-xs text-red-400" role="alert">
              {{ errors.levelId }}
            </span>
          </div>
        </div>

        <div>
          <label class="mb-1 block text-sm text-slate-400" for="topicId">Topic</label>
          <select
            id="topicId"
            :value="topicIdValue"
            class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"
            :disabled="isSubmitting"
            @change="setFieldValue('topicId', ($event.target as HTMLSelectElement).value)"
          >
            <option value="" disabled>Select</option>
            <option v-for="topic in topics" :key="topic.id" :value="topic.id">
              {{ topic.icon ?? '' }} {{ topic.name }}
            </option>
          </select>
          <span v-if="errors.topicId" class="mt-1 block text-xs text-red-400" role="alert">
            {{ errors.topicId }}
          </span>
        </div>

        <div class="grid grid-cols-2 gap-3">
          <div>
            <label class="mb-1 block text-sm text-slate-400" for="turnDuration">
              Turn Duration (s)
            </label>
            <input
              id="turnDuration"
              :value="turnDurationValue ?? 60"
              type="number"
              min="30"
              max="300"
              class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"
              :disabled="isSubmitting"
              @input="setFieldValue('turnDuration', Number(($event.target as HTMLInputElement).value))"
            />
          </div>

          <div>
            <label class="mb-1 block text-sm text-slate-400" for="maxParticipants">
              Max Participants
            </label>
            <input
              id="maxParticipants"
              :value="maxParticipantsValue ?? 8"
              type="number"
              min="2"
              max="12"
              class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"
              :disabled="isSubmitting"
              @input="setFieldValue('maxParticipants', Number(($event.target as HTMLInputElement).value))"
            />
          </div>
        </div>

        <Button
          type="submit"
          variant="default"
          size="lg"
          class="mt-2 w-full"
          :loading="isSubmitting"
        >
          Create Room
        </Button>
      </form>
    </div>
  </div>
</template>
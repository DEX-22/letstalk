<script setup lang="ts">
import { useFormValidation } from '~/shared/composables/useFormValidation'
import { guestLoginSchema } from '~/modules/auth/validators/auth.validator'
import { useAuth } from '~/modules/auth/composables/useAuth'

const { loginAsGuest, loginWithGoogle, loading, initialized, isAuthenticated } = useAuth()

const { errors, handleSubmit, isSubmitting, setFieldValue, useFieldValue } = useFormValidation(guestLoginSchema)

const nameValue = useFieldValue('name')

watch([initialized, isAuthenticated], ([authInitialized, authenticated]) => {
  if (authInitialized && authenticated) {
    navigateTo('/rooms')
  }
}, { immediate: true })

const onSubmit = handleSubmit(async (values) => {
  try {
    await loginAsGuest(values.name)
    navigateTo('/rooms')
  } catch (error) {
    console.error('Guest login failed:', error)
  }
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

    <form
      v-if="initialized && !loading"
      class="flex w-full flex-col gap-3"
      @submit="onSubmit"
    >
      <div>
        <input
          :value="nameValue"
          type="text"
          placeholder="Enter your name"
          class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 placeholder:text-slate-400 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"
          :disabled="isSubmitting"
          @input="setFieldValue('name', ($event.target as HTMLInputElement).value)"
        />
        <span
          v-if="errors.name"
          class="mt-1 block text-xs text-red-400"
          role="alert"
        >
          {{ errors.name }}
        </span>
      </div>

      <Button
        type="submit"
        variant="default"
        size="lg"
        class="w-full"
        :loading="isSubmitting"
      >
        Continue as Guest
      </Button>
    </form>

    <div v-else class="flex w-full flex-col gap-3">
      <LoadingSpinner size="lg" />
    </div>

    <Button
      variant="outline"
      size="lg"
      class="w-full"
      :loading="loading"
      @click="loginWithGoogle"
    >
      Sign in with Google
    </Button>
  </div>
</template>

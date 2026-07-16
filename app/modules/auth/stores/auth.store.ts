import { defineStore } from 'pinia'
import type { AuthUser } from '../types'

interface AuthStoreState {
  user: AuthUser | null
  loading: boolean
  initialized: boolean
}

export const useAuthStore = defineStore('auth', {
  state: (): AuthStoreState => ({
    user: null,
    loading: true,
    initialized: false,
  }),

  getters: {
    isAuthenticated: (state) => state.user !== null,
    isGuest: (state) => state.user?.role === 'guest',
    isGoogleUser: (state) => state.user?.role === 'authenticated',
    userName: (state) => state.user?.name ?? null,
    userId: (state) => state.user?.id ?? null,
  },

  actions: {
    setUser(user: AuthUser | null) {
      this.user = user
    },

    setLoading(loading: boolean) {
      this.loading = loading
    },

    setInitialized(initialized: boolean) {
      this.initialized = initialized
    },

    clearUser() {
      this.user = null
    },
  },
})
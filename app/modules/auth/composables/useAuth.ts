import { authService } from '../services/auth.service'
import { useAuthStore } from '../stores/auth.store'
import type { AuthUser } from '../types'

/**
 * useAuth — the single entry point for all authentication operations.
 *
 * This composable:
 * 1. Obtains the Supabase client (must be called in setup context)
 * 2. Delegates business logic to authService
 * 3. Manages state via authStore
 *
 * Usage in components:
 *   const { user, loginAsGuest, loginWithGoogle, logout, loading } = useAuth()
 */
export function useAuth() {
  // Use any type to avoid compatibility issues with @nuxtjs/supabase v1.6.2
  // The repository handles type safety via casts
  const client = useSupabaseClient() as any
  const store = useAuthStore()

  /**
   * Initialize the auth state on app load.
   * Restores existing session (Google OAuth or guest).
   */
  async function initialize(): Promise<void> {
    if (store.initialized) {
      return
    }

    store.setLoading(true)

    try {
      const user = await authService.restoreSession(client)
      store.setUser(user)
    } catch {
      // Session restoration failed silently — user is not authenticated
      store.clearUser()
    } finally {
      store.setLoading(false)
      store.setInitialized(true)
    }
  }

  /**
   * Login as a guest user with a display name.
   */
  async function loginAsGuest(name: string): Promise<AuthUser> {
    store.setLoading(true)

    try {
      const user = await authService.loginAsGuest(client, name)
      store.setUser(user)
      return user
    } catch (error) {
      store.clearUser()
      throw error
    } finally {
      store.setLoading(false)
    }
  }

  /**
   * Initiate Google OAuth sign-in.
   * This will redirect the user to Google's consent screen.
   */
  async function loginWithGoogle(): Promise<void> {
    store.setLoading(true)

    try {
      await authService.loginWithGoogle(client)
    } catch (error) {
      store.setLoading(false)
      throw error
    }
  }

  /**
   * Handle the OAuth callback after Google sign-in.
   * Called on the redirect page.
   */
  async function handleGoogleCallback(): Promise<AuthUser> {
    store.setLoading(true)

    try {
      const user = await authService.handleGoogleCallback(client)
      store.setUser(user)
      return user
    } catch (error) {
      store.clearUser()
      throw error
    } finally {
      store.setLoading(false)
    }
  }

  /**
   * Logout — signs out of Supabase and clears guest data.
   */
  async function logout(): Promise<void> {
    store.setLoading(true)

    try {
      await authService.logout(client)
      store.clearUser()
    } catch (error) {
      throw error
    } finally {
      store.setLoading(false)
    }
  }

  return {
    // State (reactive)
    user: computed(() => store.user),
    loading: computed(() => store.loading),
    initialized: computed(() => store.initialized),
    isAuthenticated: computed(() => store.isAuthenticated),
    isGuest: computed(() => store.isGuest),
    isGoogleUser: computed(() => store.isGoogleUser),
    userName: computed(() => store.userName),

    // Actions
    initialize,
    loginAsGuest,
    loginWithGoogle,
    handleGoogleCallback,
    logout,
  }
}
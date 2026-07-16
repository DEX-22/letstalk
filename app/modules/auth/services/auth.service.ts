import { authRepository } from '../repositories/auth.repository'
import type { AuthUser } from '../types'
import { AuthProvider, AUTH_CONSTANTS } from '~/shared/types/constants'

/**
 * Auth service — contains all authentication business logic.
 *
 * This service is pure: it does NOT call useSupabaseClient() directly.
 * The Supabase client is passed in from the calling composable.
 * This makes the service testable and independent of Nuxt's setup context.
 */
export const authService = {
  getOrCreateGuestId(): string {
    const existing = localStorage.getItem(AUTH_CONSTANTS.GUEST_ID_KEY)
    if (existing) {
      return existing
    }

    // Generate a UUID v4 compatible with all browsers
    const id = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => {
      const r = (Math.random() * 16) | 0
      const v = c === 'x' ? r : (r & 0x3) | 0x8
      return v.toString(16)
    })
    
    localStorage.setItem(AUTH_CONSTANTS.GUEST_ID_KEY, id)
    return id
  },

  getStoredGuestName(): string | null {
    return localStorage.getItem(AUTH_CONSTANTS.GUEST_NAME_KEY)
  },

  persistGuestName(name: string): void {
    localStorage.setItem(AUTH_CONSTANTS.GUEST_NAME_KEY, name)
  },

  clearGuestData(): void {
    localStorage.removeItem(AUTH_CONSTANTS.GUEST_ID_KEY)
    localStorage.removeItem(AUTH_CONSTANTS.GUEST_NAME_KEY)
  },

  async loginAsGuest(
    client: any,
    name: string,
  ): Promise<AuthUser> {
    // First, sign in anonymously to get an auth user
    // signInAnonymously now returns the user directly after session establishment
    const user = await authRepository.signInAnonymously(client)
    
    if (!user) {
      throw new Error('Failed to get anonymous user after sign-in')
    }

    const guestId = this.getOrCreateGuestId()

    // Check if profile exists by guest ID first (returning guest)
    const existingProfile = await authRepository.getProfileById(client, guestId)

    if (existingProfile) {
      // Update name if changed
      if (existingProfile.name !== name) {
        await authRepository.updateProfileName(client, existingProfile.id, name)
      }
      this.persistGuestName(name)
      return this.mapProfileToAuthUser(existingProfile, AuthProvider.GUEST)
    }

    // Check if profile exists by auth_user_id (edge case)
    const profileByAuthId = await authRepository.getProfileByAuthUserId(client, user.id)

    if (profileByAuthId) {
      if (profileByAuthId.name !== name) {
        await authRepository.updateProfileName(client, profileByAuthId.id, name)
      }
      this.persistGuestName(name)
      return this.mapProfileToAuthUser(profileByAuthId, AuthProvider.GUEST)
    }

    // Create new profile with the guest ID from localStorage
    // Guest users don't need auth_user_id - they're identified by their profile ID
    const profile = await authRepository.createProfile(client, {
      id: guestId,
      name,
      role: 'guest',
    })

    this.persistGuestName(name)
    return this.mapProfileToAuthUser(profile, AuthProvider.GUEST)
  },

  async loginWithGoogle(
    client: any,
  ): Promise<void> {
    await authRepository.signInWithGoogle(client)
  },

  async handleGoogleCallback(
    client: any,
  ): Promise<AuthUser> {
    const supabaseUser = await authRepository.getSupabaseUser(client)

    if (!supabaseUser) {
      throw new Error('No user found after Google sign-in')
    }

    const existingProfile = await authRepository.getProfileByAuthUserId(
      client,
      supabaseUser.id,
    )

    if (existingProfile) {
      return this.mapProfileToAuthUser(existingProfile, AuthProvider.GOOGLE)
    }

    const profile = await authRepository.createProfile(client, {
      auth_user_id: supabaseUser.id,
      name: supabaseUser.user_metadata?.full_name ?? 'User',
      role: 'authenticated',
      avatar_url: supabaseUser.user_metadata?.avatar_url ?? null,
    })

    return this.mapProfileToAuthUser(profile, AuthProvider.GOOGLE)
  },

  async restoreSession(
    client: any,
  ): Promise<AuthUser | null> {
    const supabaseUser = await authRepository.getSupabaseUser(client)
    if (supabaseUser) {
      const profile = await authRepository.getProfileByAuthUserId(
        client,
        supabaseUser.id,
      )
      if (profile) {
        return this.mapProfileToAuthUser(profile, AuthProvider.GOOGLE)
      }
    }

    return null
  },

  async logout(
    client: any,
  ): Promise<void> {
    await authRepository.signOut(client)
    this.clearGuestData()
  },

  mapProfileToAuthUser(
    profile: Record<string, unknown>,
    provider: AuthProvider,
  ): AuthUser {
    return {
      id: profile.id as string,
      authUserId: (profile.auth_user_id as string) ?? null,
      name: profile.name as string,
      avatarUrl: (profile.avatar_url as string) ?? null,
      role: profile.role as 'guest' | 'authenticated',
      provider,
    }
  },
}
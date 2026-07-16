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

    const id = crypto.randomUUID()
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
    await authRepository.signInAnonymously(client)

    const supabaseUser = await authRepository.getSupabaseUser(client)
    if (!supabaseUser) {
      throw new Error('Failed to get anonymous user after sign-in')
    }

    const guestId = this.getOrCreateGuestId()

    const existingProfile = await authRepository.getProfileByAuthUserId(client, supabaseUser.id)

    if (existingProfile) {
      if (existingProfile.name !== name) {
        await authRepository.updateProfileName(client, existingProfile.id, name)
        this.persistGuestName(name)
      }
      return this.mapProfileToAuthUser(existingProfile, AuthProvider.GUEST)
    }

    const profile = await authRepository.createProfile(client, {
      id: guestId,
      auth_user_id: supabaseUser.id,
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
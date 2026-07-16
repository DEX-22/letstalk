import type { Database } from '~/shared/types/database'

type Profile = Database['public']['Tables']['profiles']['Row']
type ProfileInsert = Database['public']['Tables']['profiles']['Insert']

/**
 * Auth repository — communicates with Supabase for authentication and profile management.
 *
 * Each method receives the Supabase client as a parameter.
 * The client is obtained via useSupabaseClient() in the calling composable.
 *
 * This design keeps the repository pure (no Nuxt composable calls) and testable.
 * Type safety is enforced at the service layer via the Profile type.
 */
export const authRepository = {
  async signInWithGoogle(client: any): Promise<void> {
    const { error } = await client.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: `${window.location.origin}/`,
      },
    })
    if (error) {
      throw new Error(`Google sign-in failed: ${error.message}`)
    }
  },

  async signInAnonymously(client: any): Promise<any> {
    const { data, error } = await client.auth.signInAnonymously()
    if (error) {
      throw new Error(`Anonymous sign-in failed: ${error.message}`)
    }
    // Wait for session to be fully established and propagated to RLS
    await new Promise(resolve => setTimeout(resolve, 2000))
    // Refresh session to ensure RLS policies recognize the authentication
    await client.auth.refreshSession()
    // Wait a bit more for RLS context to update
    await new Promise(resolve => setTimeout(resolve, 1000))
    // Verify the session is available
    const { data: { session } } = await client.auth.getSession()
    if (!session?.user) {
      throw new Error('Failed to establish anonymous session')
    }
    // Return the user from the verified session
    return session.user
  },

  async getSupabaseUser(client: any) {
    const { data } = await client.auth.getUser()
    return data.user
  },

  async getSession(client: any) {
    const { data } = await client.auth.getSession()
    return data.session
  },

  async signOut(client: any): Promise<void> {
    const { error } = await client.auth.signOut()
    if (error) {
      throw new Error(`Sign out failed: ${error.message}`)
    }
  },

  async createProfile(
    client: any,
    data: ProfileInsert,
  ): Promise<Profile> {
    const { data: profile, error } = await client
      .from('profiles')
      .insert(data as never)
      .select()
      .single()

    if (error) {
      throw new Error(`Failed to create profile: ${error.message}`)
    }

    return profile as unknown as Profile
  },

  async getProfileByAuthUserId(
    client: any,
    authUserId: string,
  ): Promise<Profile | null> {
    const { data } = await client
      .from('profiles')
      .select()
      .eq('auth_user_id', authUserId)
      .maybeSingle()

    return data as unknown as Profile | null
  },

  async getProfileById(
    client: any,
    id: string,
  ): Promise<Profile | null> {
    const { data } = await client
      .from('profiles')
      .select()
      .eq('id', id)
      .maybeSingle()

    return data as unknown as Profile | null
  },

  async updateProfileName(
    client: any,
    id: string,
    name: string,
  ): Promise<void> {
    const { error } = await client
      .from('profiles')
      .update({ name } as never)
      .eq('id', id)

    if (error) {
      throw new Error(`Failed to update profile: ${error.message}`)
    }
  },
}
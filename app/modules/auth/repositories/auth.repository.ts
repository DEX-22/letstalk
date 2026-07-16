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

    // Set the session explicitly for SSR cookie-based client
    // to ensure subsequent Rest API calls are authenticated
    if (data.session) {
      await client.auth.setSession(data.session)
    }

    return data.user
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
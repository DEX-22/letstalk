import { useAuth } from '~/modules/auth/composables/useAuth'

/**
 * Auth middleware — protects routes that require authentication.
 *
 * If the user is not authenticated, redirects to the landing page.
 * It restores the Supabase session before checking the store, so a page
 * refresh keeps a valid session and unauthenticated visitors go to login.
 */
export default defineNuxtRouteMiddleware(async () => {
  const { initialize, isAuthenticated } = useAuth()

  await initialize()

  if (!isAuthenticated.value) {
    return navigateTo('/')
  }
})

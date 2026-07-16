import { useAuthStore } from '~/modules/auth/stores/auth.store'

/**
 * Auth middleware — protects routes that require authentication.
 *
 * If the user is not authenticated, redirects to the landing page.
 * The middleware respects the initialization state: if auth hasn't
 * been initialized yet, it waits for it to complete.
 */
export default defineNuxtRouteMiddleware(async () => {
  const store = useAuthStore()

  if (!store.initialized) {
    await new Promise<void>((resolve) => {
      const unwatch = store.$subscribe(() => {
        if (store.initialized) {
          unwatch()
          resolve()
        }
      })
    })
  }

  if (!store.isAuthenticated) {
    return navigateTo('/')
  }
})
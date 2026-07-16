import type { AuthProvider } from '~/shared/types/constants'

export interface AuthUser {
  id: string
  authUserId: string | null
  name: string
  avatarUrl: string | null
  role: 'guest' | 'authenticated'
  provider: AuthProvider
}

export interface AuthSession {
  user: AuthUser | null
  loading: boolean
}

export interface LoginCredentials {
  name: string
}

export interface AuthError {
  code: string
  message: string
}

export interface AuthState {
  user: AuthUser | null
  loading: boolean
  initialized: boolean
}
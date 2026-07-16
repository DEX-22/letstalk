export interface ApiResponse<T> {
  data: T | null
  error: AppError | null
}

export interface AppError {
  code: string
  message: string
  details?: Record<string, string[]>
}

export interface PaginationParams {
  page: number
  limit: number
}

export interface PaginatedResponse<T> {
  data: T[]
  total: number
  page: number
  limit: number
  hasMore: boolean
}
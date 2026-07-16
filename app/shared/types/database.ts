export type Json = string | number | boolean | null | { [key: string]: Json | undefined } | Json[]

export interface Database {
  public: {
    Tables: {
      profiles: {
        Row: {
          id: string
          auth_user_id: string | null
          role: 'guest' | 'authenticated'
          name: string
          avatar_url: string | null
          created_at: string
          updated_at: string
          metadata: Json
        }
        Insert: {
          id?: string
          auth_user_id?: string | null
          role?: 'guest' | 'authenticated'
          name: string
          avatar_url?: string | null
          created_at?: string
          updated_at?: string
          metadata?: Json
        }
        Update: {
          id?: string
          auth_user_id?: string | null
          role?: 'guest' | 'authenticated'
          name?: string
          avatar_url?: string | null
          created_at?: string
          updated_at?: string
          metadata?: Json
        }
      }
      languages: {
        Row: {
          id: string
          name: string
          code: string
          native_name: string
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          name: string
          code: string
          native_name: string
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          name?: string
          code?: string
          native_name?: string
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
      }
      levels: {
        Row: {
          id: string
          level: string
          name: string
          description: string | null
          sort_order: number
          created_at: string
        }
        Insert: {
          id?: string
          level: string
          name: string
          description?: string | null
          sort_order: number
          created_at?: string
        }
        Update: {
          id?: string
          level?: string
          name?: string
          description?: string | null
          sort_order?: number
          created_at?: string
        }
      }
      topics: {
        Row: {
          id: string
          name: string
          slug: string
          description: string | null
          icon: string | null
          is_active: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          name: string
          slug: string
          description?: string | null
          icon?: string | null
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          name?: string
          slug?: string
          description?: string | null
          icon?: string | null
          is_active?: boolean
          created_at?: string
          updated_at?: string
        }
      }
      cards: {
        Row: {
          id: string
          topic_id: string
          language_id: string
          level_id: string
          question: string
          context: string | null
          is_active: boolean
          usage_count: number
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          topic_id: string
          language_id: string
          level_id: string
          question: string
          context?: string | null
          is_active?: boolean
          usage_count?: number
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          topic_id?: string
          language_id?: string
          level_id?: string
          question?: string
          context?: string | null
          is_active?: boolean
          usage_count?: number
          created_at?: string
          updated_at?: string
        }
      }
      card_vocabulary: {
        Row: {
          id: string
          card_id: string
          word: string
          definition: string | null
          sort_order: number
          created_at: string
        }
        Insert: {
          id?: string
          card_id: string
          word: string
          definition?: string | null
          sort_order?: number
          created_at?: string
        }
        Update: {
          id?: string
          card_id?: string
          word?: string
          definition?: string | null
          sort_order?: number
          created_at?: string
        }
      }
      rooms: {
        Row: {
          id: string
          host_id: string
          language_id: string
          topic_id: string
          level_id: string
          name: string
          code: string
          status: string
          turn_duration: number
          max_participants: number
          settings: Json
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          host_id: string
          language_id: string
          topic_id: string
          level_id: string
          name: string
          code: string
          status?: string
          turn_duration?: number
          max_participants?: number
          settings?: Json
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          host_id?: string
          language_id?: string
          topic_id?: string
          level_id?: string
          name?: string
          code?: string
          status?: string
          turn_duration?: number
          max_participants?: number
          settings?: Json
          created_at?: string
          updated_at?: string
        }
      }
      participants: {
        Row: {
          id: string
          room_id: string
          profile_id: string
          role: string
          status: string
          joined_at: string
          left_at: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          room_id: string
          profile_id: string
          role?: string
          status?: string
          joined_at?: string
          left_at?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          room_id?: string
          profile_id?: string
          role?: string
          status?: string
          joined_at?: string
          left_at?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      sessions: {
        Row: {
          id: string
          room_id: string
          status: string
          started_at: string | null
          ended_at: string | null
          metadata: Json
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          room_id: string
          status?: string
          started_at?: string | null
          ended_at?: string | null
          metadata?: Json
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          room_id?: string
          status?: string
          started_at?: string | null
          ended_at?: string | null
          metadata?: Json
          created_at?: string
          updated_at?: string
        }
      }
      turns: {
        Row: {
          id: string
          session_id: string
          participant_id: string
          card_id: string
          status: string
          turn_order: number
          started_at: string | null
          ended_at: string | null
          duration_ms: number | null
          metadata: Json
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          session_id: string
          participant_id: string
          card_id: string
          status?: string
          turn_order: number
          started_at?: string | null
          ended_at?: string | null
          duration_ms?: number | null
          metadata?: Json
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          session_id?: string
          participant_id?: string
          card_id?: string
          status?: string
          turn_order?: number
          started_at?: string | null
          ended_at?: string | null
          duration_ms?: number | null
          metadata?: Json
          created_at?: string
          updated_at?: string
        }
      }
    }
    Views: {
      active_rooms: {
        Row: Record<string, unknown>
      }
      session_details: {
        Row: Record<string, unknown>
      }
    }
    Functions: Record<string, unknown>
    Enums: Record<string, unknown>
  }
}
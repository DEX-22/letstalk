# Entity-Relationship Diagram

## Let's Talk Database Schema — MVP

```mermaid
erDiagram
    PROFILES {
        uuid id PK
        uuid auth_user_id FK "auth.users (Supabase)"
        user_role role
        string name
        string avatar_url
        timestamptz created_at
        timestamptz updated_at
        jsonb metadata
    }

    LANGUAGES {
        uuid id PK
        string name UK
        string code UK
        string native_name
        boolean is_active
        timestamptz created_at
        timestamptz updated_at
    }

    LEVELS {
        uuid id PK
        language_level level UK
        string name UK
        string description
        smallint sort_order UK
        timestamptz created_at
    }

    TOPICS {
        uuid id PK
        string name
        string slug UK
        string description
        string icon
        boolean is_active
        timestamptz created_at
        timestamptz updated_at
    }

    CARDS {
        uuid id PK
        uuid topic_id FK
        uuid language_id FK
        uuid level_id FK
        string question
        string context
        boolean is_active
        integer usage_count
        timestamptz created_at
        timestamptz updated_at
    }

    CARD_VOCABULARY {
        uuid id PK
        uuid card_id FK
        string word
        string definition
        smallint sort_order
        timestamptz created_at
    }

    ROOMS {
        uuid id PK
        uuid host_id FK
        uuid language_id FK
        uuid topic_id FK
        uuid level_id FK
        string name
        string code UK
        room_status status
        integer turn_duration
        integer max_participants
        jsonb settings
        timestamptz created_at
        timestamptz updated_at
    }

    PARTICIPANTS {
        uuid id PK
        uuid room_id FK
        uuid profile_id FK
        participant_role role
        participant_status status
        timestamptz joined_at
        timestamptz left_at
        timestamptz created_at
        timestamptz updated_at
    }

    SESSIONS {
        uuid id PK
        uuid room_id FK
        session_status status
        timestamptz started_at
        timestamptz ended_at
        jsonb metadata
        timestamptz created_at
        timestamptz updated_at
    }

    TURNS {
        uuid id PK
        uuid session_id FK
        uuid participant_id FK
        uuid card_id FK
        turn_status status
        smallint turn_order
        timestamptz started_at
        timestamptz ended_at
        integer duration_ms
        jsonb metadata
        timestamptz created_at
        timestamptz updated_at
    }

    %% RELATIONSHIPS

    PROFILES ||--o{ ROOMS : "creates as host"
    PROFILES ||--o{ PARTICIPANTS : "joins"
    PROFILES ||--o{ CARDS : "(future: creates)"

    ROOMS ||--o{ PARTICIPANTS : "contains"
    ROOMS ||--o{ SESSIONS : "has"
    ROOMS }o--|| LANGUAGES : "configured with"
    ROOMS }o--|| TOPICS : "configured with"
    ROOMS }o--|| LEVELS : "configured with"

    SESSIONS ||--o{ TURNS : "contains"

    TURNS }o--|| PARTICIPANTS : "assigned to"
    TURNS }o--|| CARDS : "uses"

    CARDS }o--|| TOPICS : "belongs to"
    CARDS }o--|| LANGUAGES : "written in"
    CARDS }o--|| LEVELS : "difficulty"
    CARDS ||--o{ CARD_VOCABULARY : "has vocabulary"

    TOPICS ||--o{ CARDS : "groups"
    LANGUAGES ||--o{ CARDS : "localizes"
    LEVELS ||--o{ CARDS : "levels"
```

---

## Compact Relationship Map

```
┌──────────┐       ┌──────────────┐       ┌──────────┐
│ PROFILES │──1:N──│ PARTICIPANTS │──N:1──│  ROOMS   │
└──────────┘       └──────────────┘       └────┬─────┘
       │                                       │
       │ 1:N                                   │ 1:N
       │                                       │
       ▼                                       ▼
  ┌──────────┐                          ┌──────────┐
  │  ROOMS   │                          │ SESSIONS │
  │ (as host)│                          └────┬─────┘
  └──────────┘                               │ 1:N
                                             │
                                             ▼
                                       ┌──────────┐
                                       │  TURNS   │
                                       └────┬─────┘
                                            │ N:1
                                            ▼
                                      ┌──────────┐
                                      │  CARDS   │
                                      └────┬─────┘
                                           │
                              ┌────────────┼────────────┐
                              │            │            │
                              ▼            ▼            ▼
                        ┌──────────┐ ┌──────────┐ ┌──────────┐
                        │  TOPICS  │ │LANGUAGES │ │  LEVELS  │
                        └──────────┘ └──────────┘ └──────────┘
                              │
                              │ 1:N
                              ▼
                        ┌──────────────────┐
                        │ CARD_VOCABULARY  │
                        └──────────────────┘
```

---

## Entity Counts (Seed Data)

| Entity | MVP Seed Count | Notes |
|---|---|---|
| Languages | 4 | English + 3 future-ready |
| Levels | 6 | A1 through C2 (CEFR) |
| Topics | 6 | All included in MVP |
| Cards | 36 | 6 topics × 6 levels |
| Vocabulary | ~100 | 2-4 words per card |
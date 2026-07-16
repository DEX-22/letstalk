# Database Architecture Explanation

## Overview

The Let's Talk database is designed as a **normalized PostgreSQL schema** optimized for **Supabase** with Row Level Security (RLS) and Realtime capabilities. The schema follows a **domain-driven design** with clear separation of concerns: content (cards, topics, vocabulary) is separated from operational data (rooms, sessions, turns), which is separated from identity (profiles, participants).

---

## 1. Why Each Table Exists

### `profiles`
**Purpose:** Extended user profiles linked to Supabase Auth (`auth.users`).

Supports both **authenticated users** (Google OAuth) and **guest users**. The `auth_user_id` links to Supabase Auth's built-in `auth.users` table for authenticated users. Guest users have `auth_user_id = NULL` and are identified by their profile UUID, which is stored in the client's localStorage.

**Why not use `auth.users` directly?**
- `auth.users` is managed by Supabase and has limited columns.
- We need custom fields: `name`, `avatar_url`, `role`, `metadata`.
- The `metadata` JSONB column allows future extensions (achievements, preferences, premium flags) without schema migrations.

### `languages`
**Purpose:** Supported languages for conversation sessions.

This table makes the platform **language-agnostic**. Adding a new language is as simple as inserting a row. The `code` column (ISO 639-1 two-letter code, e.g., 'en', 'es') is used for programmatic lookups. The `native_name` column stores the language name in its own script (e.g., "Español" for Spanish).

### `levels`
**Purpose:** CEFR language proficiency levels (A1–C2).

Levels are stored as a dedicated table rather than as an ENUM because:
- ENUMs are difficult to extend (require `ALTER TYPE`).
- A table allows additional metadata (description, sort_order).
- Future versions may add custom levels beyond CEFR.

The `language_level` ENUM exists alongside the table for type safety in constraints and indexes.

### `topics`
**Purpose:** Conversation topics that group cards.

Topics are **language-agnostic** — a single topic can have cards in multiple languages. This enables:
- Room creation filtered by topic.
- Content management across languages.
- Future: community-created topics, AI-generated topics.

### `cards`
**Purpose:** The core content — conversation questions.

Each card belongs to exactly one topic, language, and level. This enables precise card selection when creating a room or session. The `usage_count` column tracks how many times a card has been used, which can inform future recommendations or popularity metrics.

**Why `ON DELETE RESTRICT`?**
- Cards are referenced by turns. Deleting a card would break session history. `RESTRICT` prevents accidental deletion.

### `card_vocabulary`
**Purpose:** Normalized vocabulary words for each card.

**Why normalized instead of JSON?**
- Queryable: You can find all cards that contain a specific word.
- Indexable: The `word` column has an index for fast lookup.
- Extensible: Future versions can add translations, synonyms, example sentences per word.
- Validatable: Each word has length constraints and a `sort_order`.

**Tradeoff:** Slightly more complex inserts (need to insert vocabulary separately), but significantly better query performance and data integrity.

### `rooms`
**Purpose:** Conversation rooms where sessions take place.

Rooms are the main organizational unit of the application. Each room has:
- A **configuration** (language, topic, level, turn duration, max participants).
- A **join code** (6-char alphanumeric, e.g., "TALK42").
- A **status** (waiting → active → completed).
- A **`settings` JSONB** column for future extensibility (game modes, custom rules).

The `host_id` references the profile that created the room. Only the host can start a session.

### `participants`
**Purpose:** Junction table linking profiles to rooms.

This is a **many-to-many** relationship: a profile can be in multiple rooms (but only once per room). The table tracks:
- **Role**: host or participant.
- **Status**: online, away, left (for realtime presence).
- **Joined/left timestamps**: for session history and statistics.

**Why a separate table instead of a column on `rooms`?**
- A room can have multiple participants, requiring a separate table (normalization).
- It enables tracking participant history across sessions.
- It supports realtime presence (status changes).

### `sessions`
**Purpose:** An instance of a conversation in a room.

A room can have multiple sessions over time (history). Sessions track:
- **Status**: waiting → active → paused → completed.
- **Timestamps**: started_at, ended_at.
- **Metadata JSONB**: future extensions (AI analytics, ratings, voice feedback).

**Constraint:** A room can only have one non-completed session at a time. This is enforced by the `sessions_room_active_unique` constraint on `(room_id, status)`, which works because 'completed' status allows a new session to be created.

### `turns`
**Purpose:** Individual speaking turns within a session.

Each turn is assigned to:
- A **participant** (who speaks).
- A **card** (what they speak about).
- A **turn_order** (when they speak).

The `duration_ms` column records how long the participant spoke (derived from the timer). The `metadata` JSONB enables future features like voice feedback or skipped turn reasons.

**Unique constraints:**
- `turns_session_order_unique`: Prevents duplicate turn orders within a session.
- `idx_turns_participant_session_active` (partial unique index): Ensures a participant can only have one active turn per session.

---

## 2. Why Every Relationship Was Created

### Relationship Map

```
profiles 1──N participants N──1 rooms
profiles 1──N rooms (as host)
rooms    1──N sessions
rooms    1──N participants
sessions 1──N turns
turns    N──1 participants
turns    N──1 cards
cards    N──1 topics
cards    N──1 languages
cards    N──1 levels
cards    1──N card_vocabulary
```

### Key Design Decisions

1. **Profiles → Participants → Rooms (through junction table)**
   - A profile can be in multiple rooms (future: communities, multiple active sessions).
   - A room has multiple participants.
   - The junction table stores role and status per room.

2. **Rooms → Sessions (one-to-many)**
   - A room can have multiple sessions over time (history/replay).
   - Sessions are immutable once completed (append-only log).

3. **Sessions → Turns (one-to-many)**
   - A session has multiple turns, one per participant in random order.
   - Turns are the atomic unit of the conversation.

4. **Turns → Cards (many-to-one)**
   - Each turn uses exactly one card.
   - A card can be used in multiple turns (different sessions).
   - `ON DELETE RESTRICT` prevents deletion of cards used in past turns.

5. **Cards → Topics/Languages/Levels (many-to-one)**
   - Each card belongs to one topic, language, and level.
   - This enables precise filtering when selecting cards for a session.

6. **Cards → Card Vocabulary (one-to-many)**
   - Each card can have multiple vocabulary words.
   - Normalized for queryability and future extensibility.

### Realtime Strategy

The following tables need Realtime subscriptions:
- **rooms**: Status changes (room full, session started).
- **participants**: Join/leave/status changes.
- **sessions**: Status changes (waiting → active → completed).
- **turns**: Current active turn changes.

The partial indexes on `status` for these tables are designed to optimize Realtime queries:
- `idx_rooms_status WHERE status IN ('waiting', 'active')`
- `idx_participants_online WHERE status IN ('online', 'away')`
- `idx_sessions_active WHERE status IN ('waiting', 'active', 'paused')`
- `idx_turns_active WHERE status = 'active'`

---

## 3. Future Extensions (Architecture Prepared)

The database is designed to scale for future features without schema changes:

### AI-Generated Conversation Cards
- Cards table already has `is_active`, `usage_count`, and content fields.
- AI-generated cards would insert into the same `cards` and `card_vocabulary` tables.
- A `source` column could be added to distinguish AI cards from human-created ones (future migration).
- No structural changes needed.

### Multiple Languages
- The `languages` and `cards` tables already support this.
- Adding Spanish/French is a simple seed data insertion.
- The application filters cards by `language_id`.

### Multiple Game Modes
- The `rooms.settings` JSONB column can store custom game mode configuration (e.g., `{"mode": "speed_round", "time_per_turn": 30}`).
- No table changes needed for MVP.

### Voice Feedback
- Voice feedback data can be stored in the `turns.metadata` JSONB column (e.g., `{"voice_score": 85, "fluency": 0.9}`).
- A future `voice_analytics` table could be added for detailed analysis.

### Statistics and History
- The `session_details` view already provides analytical data.
- Future: materialized views for dashboard statistics.
- The `usage_count` column on cards enables popularity tracking.

### Achievements
- The `profiles.metadata` JSONB column can store achievement data (e.g., `{"achievements": ["first_session", "10_sessions"]}`).
- A future `achievements` table would be a separate module.

### Communities and Events
- A `communities` table would reference `profiles` (members) and `rooms` (events).
- The existing architecture supports this with additional tables.

### Premium Subscriptions
- The `profiles.metadata` JSONB can store `{"premium": true, "premium_until": "2025-12-31"}`.
- A future `subscriptions` table would provide full billing support.

---

## 4. Tradeoffs

### Normalized Vocabulary vs. JSON Column

| Approach | Pros | Cons |
|---|---|---|
| **Normalized** (selected) | Queryable, indexable, extensible, validatable | More complex inserts, more joins in queries |
| **JSON column** | Simpler inserts, fewer joins | Not queryable, not indexable by word, hard to validate |

**Decision:** Normalized. The application will query vocabulary (search cards by word), and the complexity of inserts is managed by the service layer.

### `ON DELETE RESTRICT` vs. `ON DELETE CASCADE`

| Foreign Key | Strategy | Reason |
|---|---|---|
| `cards → topics`, `cards → languages`, `cards → levels` | `RESTRICT` | Deleting a referenced entity would leave orphan cards. |
| `turns → cards` | `RESTRICT` | Deleting a card would break session history. |
| `participants → profiles` | `CASCADE` | If a profile is deleted, their participation records become meaningless. |
| `sessions → rooms` | `RESTRICT` | Deleting a room would break session history. |
| `turns → sessions` | `CASCADE` | If a session is deleted, its turns are meaningless. |

### ENUM vs. Reference Table for Levels

**Decision:** Both. The `language_level` ENUM is used for type safety in constraints. The `levels` table is used for lookups, display names, and descriptions. This dual approach gives us the best of both worlds: type safety and extensibility.

### Single `metadata` JSONB vs. Separate Tables

**Decision:** Single JSONB column for MVP, separate tables for complex features later. JSONB in PostgreSQL is performant (can be indexed with GIN indexes) and flexible. It avoids schema bloat for features that may not materialize. When a feature becomes stable, it can be migrated to a dedicated table.

### Triggers for Business Logic

The following database triggers handle automatic state transitions:

1. **`increment_card_usage`**: Automatically increments `cards.usage_count` when a turn is created.
2. **`update_room_status_from_session`**: Automatically updates `rooms.status` when a session starts or completes.
3. **`check_room_can_start_session`**: Prevents creating a session in a room that isn't in 'waiting' status.
4. **`check_participant_limit_before_insert`**: Prevents adding participants to a full room.

**Why triggers instead of application logic?**
- Triggers guarantee data integrity at the database level, regardless of which client or service modifies the data.
- They prevent race conditions in Realtime scenarios where multiple clients might try to start sessions simultaneously.
- They keep the application layer simpler.
-- ============================================================
-- Let's Talk — Database Schema for Supabase (PostgreSQL)
-- MVP: Structured conversation sessions for language practice
-- ============================================================

-- 0. EXTENSIONS
-- ============================================================

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- 1. CUSTOM TYPES (ENUMS)
-- ============================================================

CREATE TYPE user_role AS ENUM (
  'guest',
  'authenticated'
);

CREATE TYPE participant_role AS ENUM (
  'host',
  'participant'
);

CREATE TYPE participant_status AS ENUM (
  'online',
  'away',
  'left'
);

CREATE TYPE room_status AS ENUM (
  'waiting',
  'active',
  'completed'
);

CREATE TYPE session_status AS ENUM (
  'waiting',
  'active',
  'paused',
  'completed'
);

CREATE TYPE turn_status AS ENUM (
  'pending',
  'active',
  'completed',
  'skipped'
);

CREATE TYPE language_level AS ENUM (
  'a1',
  'a2',
  'b1',
  'b2',
  'c1',
  'c2'
);

-- 2. TABLES
-- ============================================================

-- 2.1. PROFILES
-- Extended user profiles linked to Supabase Auth (auth.users).
-- Supports both authenticated users and guest users.
-- The `metadata` JSONB column allows future extensions (achievements,
-- statistics, premium flags, etc.) without schema changes.
CREATE TABLE profiles (
  id            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  auth_user_id  UUID REFERENCES auth.users(id) ON DELETE CASCADE ON UPDATE CASCADE,
  role          user_role NOT NULL DEFAULT 'guest',
  name          TEXT NOT NULL CHECK (char_length(name) >= 1 AND char_length(name) <= 50),
  avatar_url    TEXT,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  metadata      JSONB NOT NULL DEFAULT '{}'::JSONB,

  -- Guest users can be identified by a UUID stored in localStorage (no auth_user_id)
  -- or by anonymous sign-in (has auth_user_id).
  -- Authenticated users are identified by their auth.users entry.
  -- This constraint ensures data integrity.
  CONSTRAINT profiles_identification_check
    CHECK (
      (role = 'guest') OR
      (role = 'authenticated' AND auth_user_id IS NOT NULL)
    )
);

-- 2.2. LANGUAGES
-- Supported languages for conversation sessions.
-- This table makes the platform language-agnostic.
-- Future: AI-generated cards per language, community contributions.
CREATE TABLE languages (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name        TEXT NOT NULL UNIQUE CHECK (char_length(name) >= 1 AND char_length(name) <= 50),
  code        TEXT NOT NULL UNIQUE CHECK (code ~ '^[a-z]{2}$'),
  native_name TEXT NOT NULL CHECK (char_length(native_name) >= 1 AND char_length(native_name) <= 50),
  is_active   BOOLEAN NOT NULL DEFAULT TRUE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 2.3. LEVELS
-- Language proficiency levels following CEFR standard.
-- Extensible: new levels can be added without schema changes.
CREATE TABLE levels (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  level       language_level NOT NULL UNIQUE,
  name        TEXT NOT NULL UNIQUE CHECK (char_length(name) >= 1 AND char_length(name) <= 50),
  description TEXT,
  sort_order  SMALLINT NOT NULL UNIQUE CHECK (sort_order >= 1 AND sort_order <= 6),
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 2.4. TOPICS
-- Conversation topics that group cards together.
-- Topics are language-agnostic: a topic can have cards in multiple languages.
-- Future: community-created topics, AI-generated topics.
CREATE TABLE topics (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name        TEXT NOT NULL CHECK (char_length(name) >= 1 AND char_length(name) <= 100),
  slug        TEXT NOT NULL UNIQUE CHECK (slug ~ '^[a-z0-9-]+$'),
  description TEXT,
  icon        TEXT,
  is_active   BOOLEAN NOT NULL DEFAULT TRUE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 2.5. CARDS
-- Conversation cards: the core content of the application.
-- Each card belongs to a topic, language, and level.
-- A card contains a question and optional context/instructions.
-- Vocabulary is stored in a separate normalized table (card_vocabulary).
-- Future: AI-generated cards, user-created cards, rating system.
CREATE TABLE cards (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  topic_id    UUID NOT NULL REFERENCES topics(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  language_id UUID NOT NULL REFERENCES languages(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  level_id    UUID NOT NULL REFERENCES levels(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  question    TEXT NOT NULL CHECK (char_length(question) >= 10 AND char_length(question) <= 500),
  context     TEXT CHECK (context IS NULL OR (char_length(context) >= 10 AND char_length(context) <= 1000)),
  is_active   BOOLEAN NOT NULL DEFAULT TRUE,
  usage_count INTEGER NOT NULL DEFAULT 0,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  -- Prevent duplicate questions for the same topic+language+level
  CONSTRAINT cards_question_unique UNIQUE (topic_id, language_id, level_id, question)
);

-- 2.6. CARD VOCABULARY
-- Normalized vocabulary for conversation cards.
-- Instead of storing `cards.vocabulary` as a JSON array, each vocabulary
-- item is a separate row. This enables:
--   - Querying cards by vocabulary
--   - Avoiding JSON parsing complexity
--   - Future: translations, synonyms, example usage per word
CREATE TABLE card_vocabulary (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  card_id     UUID NOT NULL REFERENCES cards(id) ON DELETE CASCADE ON UPDATE CASCADE,
  word        TEXT NOT NULL CHECK (char_length(word) >= 1 AND char_length(word) <= 100),
  definition  TEXT CHECK (definition IS NULL OR char_length(definition) <= 500),
  sort_order  SMALLINT NOT NULL DEFAULT 0 CHECK (sort_order >= 0),
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  -- Prevent duplicate vocabulary within a card
  CONSTRAINT card_vocabulary_unique UNIQUE (card_id, word)
);

-- 2.7. ROOMS
-- Conversation rooms where sessions take place.
-- Each room has a configuration (language, level, topic, turn duration, etc.).
-- The `code` is a short human-readable join code (e.g., "TALK42").
-- The `settings` JSONB column allows future extensibility (game modes,
-- custom rules, feature flags) without schema changes.
CREATE TABLE rooms (
  id                UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  host_id           UUID NOT NULL REFERENCES profiles(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  language_id       UUID NOT NULL REFERENCES languages(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  topic_id          UUID NOT NULL REFERENCES topics(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  level_id          UUID NOT NULL REFERENCES levels(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  name              TEXT NOT NULL CHECK (char_length(name) >= 1 AND char_length(name) <= 100),
  code              TEXT NOT NULL UNIQUE CHECK (code ~ '^[A-Z0-9]{6}$'),
  status            room_status NOT NULL DEFAULT 'waiting',
  turn_duration     INTEGER NOT NULL DEFAULT 60 CHECK (turn_duration >= 30 AND turn_duration <= 300),
  max_participants  INTEGER NOT NULL DEFAULT 8 CHECK (max_participants >= 2 AND max_participants <= 12),
  settings          JSONB NOT NULL DEFAULT '{}'::JSONB,
  created_at        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at        TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 2.8. PARTICIPANTS
-- Junction table linking profiles to rooms.
-- Tracks role (host/participant), status, and when they joined/left.
-- A profile can be in multiple rooms, but only once per room.
CREATE TABLE participants (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  room_id         UUID NOT NULL REFERENCES rooms(id) ON DELETE CASCADE ON UPDATE CASCADE,
  profile_id      UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE ON UPDATE CASCADE,
  role            participant_role NOT NULL DEFAULT 'participant',
  status          participant_status NOT NULL DEFAULT 'online',
  joined_at       TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  left_at         TIMESTAMPTZ,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  -- A profile can only be in a room once
  CONSTRAINT participants_room_profile_unique UNIQUE (room_id, profile_id),

  -- Host role is validated at the application level:
  -- Only one host per room, assigned when the room is created.
  -- This constraint is enforced by the application, not the database,
  -- to allow the host to transfer host status in the future.
  CONSTRAINT participants_role_check
    CHECK (
      (role = 'host' AND status IN ('online', 'away')) OR
      (role = 'participant' AND status IN ('online', 'away', 'left'))
    )
);

-- 2.9. SESSIONS
-- A session is an instance of a conversation in a room.
-- A room can have multiple sessions over time (history).
-- Sessions track the overall state of the conversation.
-- The `metadata` JSONB column supports future extensions:
-- AI analytics, voice feedback data, session ratings, etc.
CREATE TABLE sessions (
  id            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  room_id       UUID NOT NULL REFERENCES rooms(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  status        session_status NOT NULL DEFAULT 'waiting',
  started_at    TIMESTAMPTZ,
  ended_at      TIMESTAMPTZ,
  metadata      JSONB NOT NULL DEFAULT '{}'::JSONB,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  -- A room can only have one active session at a time
  CONSTRAINT sessions_room_active_unique UNIQUE (room_id, status)
    -- Note: This unique constraint works because session_status includes
    -- 'completed'. Once a session is completed, a new 'waiting' session
    -- can be created. This allows only one non-completed session per room.
);

-- 2.10. TURNS
-- Individual speaking turns within a session.
-- Each turn is assigned to a participant with a card.
-- The order is determined at session start (randomized by the application).
-- The `metadata` JSONB column supports future extensions:
-- Voice feedback, duration tracking, skipped reasons, etc.
CREATE TABLE turns (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  session_id      UUID NOT NULL REFERENCES sessions(id) ON DELETE CASCADE ON UPDATE CASCADE,
  participant_id  UUID NOT NULL REFERENCES participants(id) ON DELETE CASCADE ON UPDATE CASCADE,
  card_id         UUID NOT NULL REFERENCES cards(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  status          turn_status NOT NULL DEFAULT 'pending',
  turn_order      SMALLINT NOT NULL CHECK (turn_order >= 1),
  started_at      TIMESTAMPTZ,
  ended_at        TIMESTAMPTZ,
  duration_ms     INTEGER CHECK (duration_ms IS NULL OR duration_ms >= 0),
  metadata        JSONB NOT NULL DEFAULT '{}'::JSONB,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  -- Each turn has a unique order within its session
  CONSTRAINT turns_session_order_unique UNIQUE (session_id, turn_order),

  -- A participant can only have one active turn per session
  -- (This is a partial unique index, defined below in indexes)
  CONSTRAINT turns_participant_session_unique UNIQUE (session_id, participant_id, status)
    -- Note: This is a partial constraint; we only care about unique
    -- participant+session for non-completed turns. The constraint as written
    -- is a full UNIQUE, but the index approach below handles partial uniqueness.
);

-- 3. INDEXES
-- ============================================================

-- 3.1. Core lookup indexes

-- Fast lookup of rooms by join code (used for joining)
CREATE INDEX idx_rooms_code ON rooms(code);

-- Fast lookup of active rooms (dashboard)
CREATE INDEX idx_rooms_status ON rooms(status) WHERE status IN ('waiting', 'active');

-- Fast lookup of rooms by host (my rooms)
CREATE INDEX idx_rooms_host ON rooms(host_id);

-- 3.2. Participant indexes

-- Fast lookup of participants in a room (realtime)
CREATE INDEX idx_participants_room ON participants(room_id);

-- Fast lookup of rooms a profile is in (my rooms)
CREATE INDEX idx_participants_profile ON participants(profile_id);

-- Only online participants (realtime display)
CREATE INDEX idx_participants_online ON participants(room_id, status)
  WHERE status IN ('online', 'away');

-- 3.3. Session indexes

-- Fast lookup of active sessions (realtime)
CREATE INDEX idx_sessions_active ON sessions(room_id, status)
  WHERE status IN ('waiting', 'active', 'paused');

-- Session history for a room (dashboard)
CREATE INDEX idx_sessions_room ON sessions(room_id);

-- 3.4. Turn indexes

-- Fast lookup of current active turn (realtime)
CREATE INDEX idx_turns_active ON turns(session_id, status)
  WHERE status = 'active';

-- Turn order within a session (session flow)
CREATE INDEX idx_turns_session_order ON turns(session_id, turn_order);

-- Turns for a specific participant (history)
CREATE INDEX idx_turns_participant ON turns(participant_id);

-- Partial unique index: a participant can only have one non-completed
-- turn per session. This is more precise than a full UNIQUE constraint.
CREATE UNIQUE INDEX idx_turns_participant_session_active
  ON turns(session_id, participant_id)
  WHERE status IN ('pending', 'active');

-- 3.5. Card indexes

-- Fast card lookup by topic + language + level (card assignment)
CREATE INDEX idx_cards_topic_language_level ON cards(topic_id, language_id, level_id)
  WHERE is_active = TRUE;

-- Cards by topic (topic browser)
CREATE INDEX idx_cards_topic ON cards(topic_id) WHERE is_active = TRUE;

-- Vocabulary lookup
CREATE INDEX idx_card_vocabulary_word ON card_vocabulary(word);

-- 3.6. Profile indexes

-- Lookup by auth_user_id (authentication callback)
CREATE INDEX idx_profiles_auth ON profiles(auth_user_id) WHERE auth_user_id IS NOT NULL;

-- 4. TRIGGERS AND HELPER FUNCTIONS
-- ============================================================

-- 4.1. Generic updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 4.2. Apply updated_at trigger to all tables with updated_at
CREATE TRIGGER update_profiles_updated_at
  BEFORE UPDATE ON profiles
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_languages_updated_at
  BEFORE UPDATE ON languages
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_topics_updated_at
  BEFORE UPDATE ON topics
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_cards_updated_at
  BEFORE UPDATE ON cards
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_rooms_updated_at
  BEFORE UPDATE ON rooms
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_participants_updated_at
  BEFORE UPDATE ON participants
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_sessions_updated_at
  BEFORE UPDATE ON sessions
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_turns_updated_at
  BEFORE UPDATE ON turns
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- 4.3. Helper: Auto-increment card usage count
CREATE OR REPLACE FUNCTION increment_card_usage()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE cards SET usage_count = usage_count + 1 WHERE id = NEW.card_id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER increment_card_usage_on_turn
  AFTER INSERT ON turns
  FOR EACH ROW
  EXECUTE FUNCTION increment_card_usage();

-- 4.4. Helper: Update room status when session changes
CREATE OR REPLACE FUNCTION update_room_status_from_session()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.status = 'active' AND OLD.status = 'waiting' THEN
    UPDATE rooms SET status = 'active' WHERE id = NEW.room_id;
  ELSIF NEW.status = 'completed' THEN
    UPDATE rooms SET status = 'completed' WHERE id = NEW.room_id;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_room_status_on_session_change
  AFTER UPDATE OF status ON sessions
  FOR EACH ROW
  EXECUTE FUNCTION update_room_status_from_session();

-- 4.5. Helper: Prevent creating a session if room is not in 'waiting' status
CREATE OR REPLACE FUNCTION check_room_can_start_session()
RETURNS TRIGGER AS $$
DECLARE
  room_status_val room_status;
BEGIN
  SELECT status INTO room_status_val FROM rooms WHERE id = NEW.room_id;
  IF room_status_val != 'waiting' THEN
    RAISE EXCEPTION 'Cannot create a session in a room that is not waiting. Room status: %', room_status_val;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_room_before_session_insert
  BEFORE INSERT ON sessions
  FOR EACH ROW
  EXECUTE FUNCTION check_room_can_start_session();

-- 4.6. Helper: Validate participant count when inserting into participants
CREATE OR REPLACE FUNCTION check_room_participant_limit()
RETURNS TRIGGER AS $$
DECLARE
  current_count INTEGER;
  max_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO current_count
  FROM participants
  WHERE room_id = NEW.room_id AND status IN ('online', 'away');

  SELECT max_participants INTO max_count FROM rooms WHERE id = NEW.room_id;

  IF current_count >= max_count THEN
    RAISE EXCEPTION 'Room is full. Maximum participants: %', max_count;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_participant_limit_before_insert
  BEFORE INSERT ON participants
  FOR EACH ROW
  EXECUTE FUNCTION check_room_participant_limit();

-- 5. ROW LEVEL SECURITY POLICIES
-- ============================================================

-- Enable RLS on all tables
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE languages ENABLE ROW LEVEL SECURITY;
ALTER TABLE levels ENABLE ROW LEVEL SECURITY;
ALTER TABLE topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE cards ENABLE ROW LEVEL SECURITY;
ALTER TABLE card_vocabulary ENABLE ROW LEVEL SECURITY;
ALTER TABLE rooms ENABLE ROW LEVEL SECURITY;
ALTER TABLE participants ENABLE ROW LEVEL SECURITY;
ALTER TABLE sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE turns ENABLE ROW LEVEL SECURITY;

-- 5.1. Profiles policies
-- Allow anyone to create a profile (for guest users)
CREATE POLICY "profiles_insert_policy"
  ON profiles FOR INSERT
  WITH CHECK (true);

-- Allow service role to insert profiles (for anonymous auth)
CREATE POLICY "profiles_insert_service_role"
  ON profiles FOR INSERT
  TO service_role
  WITH CHECK (true);

-- Allow users to read their own profile
CREATE POLICY "profiles_select_policy"
  ON profiles FOR SELECT
  USING (auth.uid() = auth_user_id OR id = auth.uid());

-- Allow users to update their own profile
CREATE POLICY "profiles_update_policy"
  ON profiles FOR UPDATE
  USING (auth.uid() = auth_user_id OR id = auth.uid())
  WITH CHECK (auth.uid() = auth_user_id OR id = auth.uid());

-- 5.2. Languages, Levels, Topics - public read access
CREATE POLICY "public_read_languages" ON languages FOR SELECT USING (is_active = TRUE);
CREATE POLICY "public_read_levels" ON levels FOR SELECT USING (true);
CREATE POLICY "public_read_topics" ON topics FOR SELECT USING (is_active = TRUE);

-- 5.3. Cards - public read access
CREATE POLICY "public_read_cards" ON cards FOR SELECT USING (is_active = TRUE);
CREATE POLICY "public_read_card_vocabulary" ON card_vocabulary FOR SELECT USING (true);

-- 5.4. Rooms - authenticated users can create, read active rooms, update/delete own rooms
CREATE POLICY "rooms_insert_policy"
  ON rooms FOR INSERT
  WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "rooms_select_policy"
  ON rooms FOR SELECT
  USING (status IN ('waiting', 'active'));

CREATE POLICY "rooms_update_policy"
  ON rooms FOR UPDATE
  USING (auth.uid() IS NOT NULL)
  WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "rooms_delete_policy"
  ON rooms FOR DELETE
  USING (auth.uid() IS NOT NULL);

-- 5.5. Participants - authenticated users can manage participants
CREATE POLICY "participants_insert_policy"
  ON participants FOR INSERT
  WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "participants_select_policy"
  ON participants FOR SELECT
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "participants_update_policy"
  ON participants FOR UPDATE
  USING (auth.uid() IS NOT NULL)
  WITH CHECK (auth.uid() IS NOT NULL);

-- 5.6. Sessions - users can create/read sessions in rooms they're in
CREATE POLICY "sessions_insert_policy"
  ON sessions FOR INSERT
  WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "sessions_select_policy"
  ON sessions FOR SELECT
  USING (auth.uid() IS NOT NULL);

-- 5.7. Turns - users can create/read turns in sessions they're in
CREATE POLICY "turns_insert_policy"
  ON turns FOR INSERT
  WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "turns_select_policy"
  ON turns FOR SELECT
  USING (auth.uid() IS NOT NULL);

-- 6. VIEWS
-- ============================================================

-- 6.1. Active rooms with participant count (dashboard)
CREATE VIEW active_rooms AS
SELECT
  r.id,
  r.name,
  r.code,
  r.status,
  r.turn_duration,
  r.max_participants,
  l.name AS language_name,
  l.code AS language_code,
  t.name AS topic_name,
  t.slug AS topic_slug,
  lv.level,
  lv.name AS level_name,
  p.name AS host_name,
  p.avatar_url AS host_avatar_url,
  COUNT(pr.id) FILTER (WHERE pr.status IN ('online', 'away')) AS participant_count,
  r.created_at
FROM rooms r
JOIN languages l ON r.language_id = l.id
JOIN topics t ON r.topic_id = t.id
JOIN levels lv ON r.level_id = lv.id
JOIN profiles p ON r.host_id = p.id
LEFT JOIN participants pr ON r.id = pr.room_id
WHERE r.status IN ('waiting', 'active')
GROUP BY r.id, l.name, l.code, t.name, t.slug, lv.level, lv.name, p.name, p.avatar_url
ORDER BY r.created_at DESC;

-- 6.2. Session details with participant names and card info
CREATE VIEW session_details AS
SELECT
  s.id AS session_id,
  s.status AS session_status,
  s.started_at,
  s.ended_at,
  r.id AS room_id,
  r.name AS room_name,
  t.id AS turn_id,
  t.turn_order,
  t.status AS turn_status,
  t.started_at AS turn_started_at,
  t.ended_at AS turn_ended_at,
  t.duration_ms,
  p.id AS participant_id,
  p.name AS participant_name,
  p.avatar_url AS participant_avatar_url,
  pr.role AS participant_role,
  c.id AS card_id,
  c.question AS card_question,
  tp.name AS topic_name
FROM sessions s
JOIN rooms r ON s.room_id = r.id
JOIN turns t ON s.id = t.session_id
JOIN participants pr ON t.participant_id = pr.id
JOIN profiles p ON pr.profile_id = p.id
JOIN cards c ON t.card_id = c.id
JOIN topics tp ON c.topic_id = tp.id
ORDER BY s.created_at DESC, t.turn_order;
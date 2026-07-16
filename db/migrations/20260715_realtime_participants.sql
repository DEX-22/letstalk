-- Makes existing Supabase projects show all members of a room in real time.
-- Safe to run once through the Supabase SQL editor or migration runner.

DROP POLICY IF EXISTS "profiles_select_policy" ON profiles;

CREATE POLICY "profiles_select_policy"
  ON profiles FOR SELECT
  USING (auth.uid() IS NOT NULL);

DROP POLICY IF EXISTS "sessions_update_policy" ON sessions;
CREATE POLICY "sessions_update_policy"
  ON sessions FOR UPDATE
  USING (auth.uid() IS NOT NULL)
  WITH CHECK (auth.uid() IS NOT NULL);

DROP POLICY IF EXISTS "turns_update_policy" ON turns;
CREATE POLICY "turns_update_policy"
  ON turns FOR UPDATE
  USING (auth.uid() IS NOT NULL)
  WITH CHECK (auth.uid() IS NOT NULL);

GRANT UPDATE ON sessions, turns TO authenticated;

-- Session state changes update the parent room through a trigger. Run the
-- trigger with its owner privileges so that the internal room update is not
-- rejected by the caller's RLS context.
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
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_publication_tables
    WHERE pubname = 'supabase_realtime'
      AND schemaname = 'public'
      AND tablename = 'rooms'
  ) THEN
    ALTER PUBLICATION supabase_realtime ADD TABLE rooms;
  END IF;

  IF NOT EXISTS (
    SELECT 1
    FROM pg_publication_tables
    WHERE pubname = 'supabase_realtime'
      AND schemaname = 'public'
      AND tablename = 'participants'
  ) THEN
    ALTER PUBLICATION supabase_realtime ADD TABLE participants;
  END IF;

  IF NOT EXISTS (
    SELECT 1
    FROM pg_publication_tables
    WHERE pubname = 'supabase_realtime'
      AND schemaname = 'public'
      AND tablename = 'sessions'
  ) THEN
    ALTER PUBLICATION supabase_realtime ADD TABLE sessions;
  END IF;

  IF NOT EXISTS (
    SELECT 1
    FROM pg_publication_tables
    WHERE pubname = 'supabase_realtime'
      AND schemaname = 'public'
      AND tablename = 'turns'
  ) THEN
    ALTER PUBLICATION supabase_realtime ADD TABLE turns;
  END IF;
END;
$$;

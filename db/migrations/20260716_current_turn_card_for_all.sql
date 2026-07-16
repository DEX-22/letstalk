-- ============================================================
-- Let's Talk — Migration: expose the current turn's card to all
-- participants in the room (not only the active speaker).
-- ============================================================

-- Returns the active turn's card (topic, vocabulary, question) to any
-- authenticated participant that belongs to the room of the given session.
-- This replaces the speaker-only visibility of get_active_turn_card so that
-- every participant can follow the current question.
CREATE OR REPLACE FUNCTION get_current_turn_card(target_session_id UUID)
RETURNS TABLE(topic TEXT, vocabulary TEXT[], question TEXT)
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT
    topic.name,
    COALESCE(array_agg(vocabulary.word ORDER BY vocabulary.sort_order), ARRAY[]::TEXT[]),
    card.question
  FROM turns AS turn
  JOIN sessions AS session ON session.id = turn.session_id
  JOIN participants AS participant ON participant.id = turn.participant_id
  JOIN rooms AS room ON room.id = session.room_id
  JOIN profiles AS viewer ON viewer.id = room.host_id OR viewer.id = participant.profile_id
  JOIN cards AS card ON card.id = turn.card_id
  JOIN topics AS topic ON topic.id = card.topic_id
  LEFT JOIN card_vocabulary AS vocabulary ON vocabulary.card_id = card.id
  WHERE turn.session_id = target_session_id
    AND turn.status = 'active'
    -- The caller must be a participant of the room (host or speaker).
    AND EXISTS (
      SELECT 1
      FROM participants AS p
      JOIN profiles AS pr ON pr.id = p.profile_id
      WHERE p.room_id = room.id
        AND pr.auth_user_id = auth.uid()
        AND p.status IN ('online', 'away')
    )
  GROUP BY topic.name, card.question;
$$;

GRANT EXECUTE ON FUNCTION get_current_turn_card(UUID) TO authenticated;
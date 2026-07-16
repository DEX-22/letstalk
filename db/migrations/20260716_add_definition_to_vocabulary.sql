-- ============================================================
-- Let's Talk — Migration: add definition to vocabulary return fields in RPCs
-- ============================================================

-- Replaces get_active_turn_card to return the card's vocabulary as JSON with definitions
CREATE OR REPLACE FUNCTION get_active_turn_card(target_session_id UUID)
RETURNS TABLE(topic TEXT, vocabulary JSON, question TEXT, context TEXT)
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT
    topic.name,
    COALESCE(
      (
        SELECT json_agg(json_build_object('word', cv.word, 'definition', cv.definition) ORDER BY cv.sort_order)
        FROM card_vocabulary cv
        WHERE cv.card_id = card.id
      ),
      '[]'::json
    ),
    card.question,
    card.context
  FROM turns AS turn
  JOIN participants AS participant ON participant.id = turn.participant_id
  JOIN profiles AS profile ON profile.id = participant.profile_id
  JOIN cards AS card ON card.id = turn.card_id
  JOIN topics AS topic ON topic.id = card.topic_id
  WHERE turn.session_id = target_session_id
    AND turn.status = 'active'
    AND profile.auth_user_id = auth.uid()
  GROUP BY topic.name, card.id, card.question, card.context;
$$;

-- Replaces get_current_turn_card to return the card's vocabulary as JSON with definitions
CREATE OR REPLACE FUNCTION get_current_turn_card(target_session_id UUID)
RETURNS TABLE(topic TEXT, vocabulary JSON, question TEXT, context TEXT)
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT
    topic.name,
    COALESCE(
      (
        SELECT json_agg(json_build_object('word', cv.word, 'definition', cv.definition) ORDER BY cv.sort_order)
        FROM card_vocabulary cv
        WHERE cv.card_id = card.id
      ),
      '[]'::json
    ),
    card.question,
    card.context
  FROM turns AS turn
  JOIN sessions AS session ON session.id = turn.session_id
  JOIN participants AS participant ON participant.id = turn.participant_id
  JOIN rooms AS room ON room.id = session.room_id
  JOIN profiles AS viewer ON viewer.id = room.host_id OR viewer.id = participant.profile_id
  JOIN cards AS card ON card.id = turn.card_id
  JOIN topics AS topic ON topic.id = card.topic_id
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
  GROUP BY topic.name, card.id, card.question, card.context;
$$;

GRANT EXECUTE ON FUNCTION get_active_turn_card(UUID), get_current_turn_card(UUID) TO authenticated;

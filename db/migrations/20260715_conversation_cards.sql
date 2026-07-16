-- Restrict conversation-card content to the participant with the active turn.

DROP POLICY IF EXISTS "public_read_cards" ON cards;
DROP POLICY IF EXISTS "public_read_card_vocabulary" ON card_vocabulary;

CREATE OR REPLACE FUNCTION get_room_card_ids(target_room_id UUID)
RETURNS TABLE(card_id UUID)
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT c.id
  FROM rooms AS r
  JOIN profiles AS host ON host.id = r.host_id
  JOIN cards AS c
    ON c.topic_id = r.topic_id
    AND c.language_id = r.language_id
    AND c.level_id = r.level_id
    AND c.is_active = TRUE
  WHERE r.id = target_room_id
    AND host.auth_user_id = auth.uid();
$$;

CREATE OR REPLACE FUNCTION get_active_turn_card(target_session_id UUID)
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
  JOIN participants AS participant ON participant.id = turn.participant_id
  JOIN profiles AS profile ON profile.id = participant.profile_id
  JOIN cards AS card ON card.id = turn.card_id
  JOIN topics AS topic ON topic.id = card.topic_id
  LEFT JOIN card_vocabulary AS vocabulary ON vocabulary.card_id = card.id
  WHERE turn.session_id = target_session_id
    AND turn.status = 'active'
    AND profile.auth_user_id = auth.uid()
  GROUP BY topic.name, card.question;
$$;

GRANT EXECUTE ON FUNCTION get_room_card_ids(UUID), get_active_turn_card(UUID) TO authenticated;

-- ============================================================
-- Let's Talk — Extended Seed Data — Part 3
-- ============================================================
-- This is the third and final part of the seed extension.
--
-- Run AFTER db/seed.sql, db/seed-extension.sql, and
-- db/seed-extension-part2.sql:
--   psql -f db/seed.sql
--   psql -f db/seed-extension.sql
--   psql -f db/seed-extension-part2.sql
--   psql -f db/seed-extension-part3.sql
--
-- Covers Sports and Business topics.
-- ============================================================

-- ============================================================
-- ID REFERENCE (from db/seed.sql)
-- ============================================================
-- English: a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
-- A1: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
-- A2: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12
-- B1: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13
-- B2: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14
-- C1: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15
-- C2: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16
-- Sports: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15
-- Business: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16
-- ============================================================

-- ============================================================
-- TOPIC: SPORTS (05)
-- ============================================================

-- -----------------------------------------------------------
-- SPORTS — A1 (level 01)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20501001-0000-4000-8000-000501000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What sports do you know? Name three sports and describe them.',
    'Think about sports you have seen on TV or played yourself.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'football', 'A sport played with a round ball between two teams', 1),
  ((SELECT id FROM card), 'basketball', 'A sport where players throw a ball through a hoop', 2),
  ((SELECT id FROM card), 'tennis', 'A sport played with rackets and a ball over a net', 3),
  ((SELECT id FROM card), 'swimming', 'Moving through water using your arms and legs', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20501002-0000-4000-8000-000501000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Do you like to run? Where do you like to run?',
    'Describe where you run and how it makes you feel.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'run', 'To move quickly on foot', 1),
  ((SELECT id FROM card), 'park', 'A green area in a town for exercise', 2),
  ((SELECT id FROM card), 'fast', 'At high speed', 3),
  ((SELECT id FROM card), 'slow', 'At low speed', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20501003-0000-4000-8000-000501000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What color is your favorite sports team? What is their name?',
    'Describe the team colors and uniform.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'team', 'A group of players who play together', 1),
  ((SELECT id FROM card), 'uniform', 'Special clothes worn by a team', 2),
  ((SELECT id FROM card), 'color', 'The appearance of the team''s clothes', 3),
  ((SELECT id FROM card), 'name', 'The word that identifies the team', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20501004-0000-4000-8000-000501000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What do you need to play football? What equipment do you use?',
    'List the items you need for playing football.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'ball', 'A round object used in many sports', 1),
  ((SELECT id FROM card), 'goal', 'The area where you score points', 2),
  ((SELECT id FROM card), 'shoes', 'Footwear for playing sports', 3),
  ((SELECT id FROM card), 'shirt', 'A piece of clothing for the upper body', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20501005-0000-4000-8000-000501000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Do you like to watch sports on TV? What sports do you watch?',
    'Describe the sports you enjoy watching and who you watch with.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'watch', 'To look at something for entertainment', 1),
  ((SELECT id FROM card), 'TV', 'A device for watching programs', 2),
  ((SELECT id FROM card), 'match', 'A game between two teams', 3),
  ((SELECT id FROM card), 'stadium', 'A large place where sports are played', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20501006-0000-4000-8000-000501000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is your favorite sport to play? Why do you like it?',
    'Describe the sport and what you enjoy about playing it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'play', 'To take part in a sport', 1),
  ((SELECT id FROM card), 'fun', 'Enjoyable and entertaining', 2),
  ((SELECT id FROM card), 'exercise', 'Physical activity for fitness', 3),
  ((SELECT id FROM card), 'outside', 'In the open air', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20501007-0000-4000-8000-000501000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'How do you feel after you play a sport? Happy or tired?',
    'Describe your feelings after physical activity.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'happy', 'Feeling good and joyful', 1),
  ((SELECT id FROM card), 'tired', 'Needing rest after activity', 2),
  ((SELECT id FROM card), 'strong', 'Having a lot of physical power', 3),
  ((SELECT id FROM card), 'healthy', 'In good physical condition', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20501008-0000-4000-8000-000501000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What sports do children play at school in your country?',
    'Describe the sports activities in your school.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'school', 'A place where children learn', 1),
  ((SELECT id FROM card), 'teacher', 'A person who instructs students', 2),
  ((SELECT id FROM card), 'class', 'A group of students learning together', 3),
  ((SELECT id FROM card), 'playground', 'An outdoor area for playing at school', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20501009-0000-4000-8000-000501000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Can you ride a bicycle? Where do you like to ride it?',
    'Describe where you cycle and how often you do it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'bicycle', 'A vehicle with two wheels that you pedal', 1),
  ((SELECT id FROM card), 'ride', 'To travel on a bicycle', 2),
  ((SELECT id FROM card), 'helmet', 'A hard hat for protection', 3),
  ((SELECT id FROM card), 'path', 'A way for walking or cycling', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050100a-0000-4000-8000-000501000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is your favorite animal? Can that animal run fast?',
    'Describe an animal and how it moves.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'horse', 'A large animal that people can ride', 1),
  ((SELECT id FROM card), 'jump', 'To push off the ground with your feet', 2),
  ((SELECT id FROM card), 'race', 'A competition to see who is fastest', 3),
  ((SELECT id FROM card), 'win', 'To be first in a competition', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050100b-0000-4000-8000-000501000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What do you wear when you do sports? Describe your sports clothes.',
    'Talk about your favorite sports outfit and shoes.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'shorts', 'Short pants worn for sports', 1),
  ((SELECT id FROM card), 'socks', 'Clothing worn on the feet', 2),
  ((SELECT id FROM card), 'trainers', 'Shoes designed for sports', 3),
  ((SELECT id FROM card), 'tracksuit', 'A matching jacket and pants for sports', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050100c-0000-4000-8000-000501000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'How many players are there in a football team? What do they do?',
    'Describe the positions and roles of players in football.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'player', 'A person who takes part in a sport', 1),
  ((SELECT id FROM card), 'captain', 'The leader of a team', 2),
  ((SELECT id FROM card), 'goalkeeper', 'The player who protects the goal', 3),
  ((SELECT id FROM card), 'referee', 'The person who enforces the rules', 4);

-- -----------------------------------------------------------
-- SPORTS — A2 (level 02)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20502001-0000-4000-8000-000502000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How often do you do sports or exercise each week?',
    'Describe your weekly exercise routine and how long you spend.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'routine', 'A regular set of activities', 1),
  ((SELECT id FROM card), 'hour', 'A unit of time equal to 60 minutes', 2),
  ((SELECT id FROM card), 'week', 'A period of seven days', 3),
  ((SELECT id FROM card), 'regularly', 'At fixed times, often', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20502002-0000-4000-8000-000502000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is your favorite summer sport? What about winter sports?',
    'Compare sports you do in different seasons.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'summer', 'The warm season', 1),
  ((SELECT id FROM card), 'winter', 'The cold season', 2),
  ((SELECT id FROM card), 'ski', 'To travel on snow with long narrow boards', 3),
  ((SELECT id FROM card), 'surf', 'To ride on waves', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20502003-0000-4000-8000-000502000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Do you prefer team sports or individual sports? Why?',
    'Compare playing in a team versus playing alone.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'individual', 'Done by one person alone', 1),
  ((SELECT id FROM card), 'partner', 'A person you do an activity with', 2),
  ((SELECT id FROM card), 'compete', 'To try to win against others', 3),
  ((SELECT id FROM card), 'practice', 'To train to improve your skills', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20502004-0000-4000-8000-000502000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What sports can you do at the beach? Which ones do you like?',
    'Describe beach sports and activities.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'beach', 'A sandy area by the sea', 1),
  ((SELECT id FROM card), 'volleyball', 'A sport where players hit a ball over a net', 2),
  ((SELECT id FROM card), 'swim', 'To move through water', 3),
  ((SELECT id FROM card), 'sun', 'The star that gives light and warmth', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20502005-0000-4000-8000-000502000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is the most popular sport in your country? Why is it popular?',
    'Describe the sport and why many people like it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'popular', 'Liked by many people', 1),
  ((SELECT id FROM card), 'famous', 'Known by many people', 2),
  ((SELECT id FROM card), 'champion', 'The winner of a competition', 3),
  ((SELECT id FROM card), 'trophy', 'A prize for winning', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20502006-0000-4000-8000-000502000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you warm up before doing exercise?',
    'Describe the stretches and exercises you do to prepare.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'stretch', 'To make your muscles longer and looser', 1),
  ((SELECT id FROM card), 'warm up', 'To prepare your body for exercise', 2),
  ((SELECT id FROM card), 'muscle', 'A part of the body that helps you move', 3),
  ((SELECT id FROM card), 'injury', 'Damage to the body', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20502007-0000-4000-8000-000502000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What sports do you like to watch at the Olympic Games?',
    'Describe the Olympic sports you enjoy watching the most.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'Olympics', 'An international sports competition every four years', 1),
  ((SELECT id FROM card), 'gold medal', 'The prize for first place', 2),
  ((SELECT id FROM card), 'athlete', 'A person who competes in sports', 3),
  ((SELECT id FROM card), 'record', 'The best performance ever achieved', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20502008-0000-4000-8000-000502000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Do you like to dance? What kind of dancing do you enjoy?',
    'Describe the type of dance you like and where you do it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'dance', 'To move your body to music', 1),
  ((SELECT id FROM card), 'music', 'Sounds arranged in a pleasant way', 2),
  ((SELECT id FROM card), 'rhythm', 'A regular pattern of sounds', 3),
  ((SELECT id FROM card), 'move', 'To change position', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20502009-0000-4000-8000-000502000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is a sport that is easy to learn? Why is it easy?',
    'Describe a sport that beginners can learn quickly.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'easy', 'Not difficult', 1),
  ((SELECT id FROM card), 'beginner', 'A person who is new to an activity', 2),
  ((SELECT id FROM card), 'learn', 'To gain knowledge or skill', 3),
  ((SELECT id FROM card), 'simple', 'Easy to understand or do', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050200a-0000-4000-8000-000502000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What do you do when your team loses a game? How do you feel?',
    'Describe your feelings after a loss and how you handle it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'lose', 'To not win', 1),
  ((SELECT id FROM card), 'score', 'The number of points in a game', 2),
  ((SELECT id FROM card), 'draw', 'A game that ends with equal scores', 3),
  ((SELECT id FROM card), 'support', 'To encourage a team', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050200b-0000-4000-8000-000502000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What sports equipment do you have at home?',
    'List the sports items you own and how you use them.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'racket', 'A tool used in tennis and similar sports', 1),
  ((SELECT id FROM card), 'bat', 'A tool used to hit a ball in baseball', 2),
  ((SELECT id FROM card), 'net', 'A mesh used to divide a court', 3),
  ((SELECT id FROM card), 'glove', 'A covering for the hand', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050200c-0000-4000-8000-000502000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is a sport you would like to try? Why does it interest you?',
    'Describe a sport you have never played but want to learn.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'try', 'To attempt something new', 1),
  ((SELECT id FROM card), 'interesting', 'Attracting your attention', 2),
  ((SELECT id FROM card), 'difficult', 'Not easy, requiring effort', 3),
  ((SELECT id FROM card), 'challenge', 'A difficult but exciting task', 4);

-- -----------------------------------------------------------
-- SPORTS — B1 (level 03)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20503001-0000-4000-8000-000503000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How does playing sports help people make friends?',
    'Discuss how sports bring people together and build relationships.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'socialize', 'To interact with others', 1),
  ((SELECT id FROM card), 'bond', 'A connection between people', 2),
  ((SELECT id FROM card), 'team spirit', 'A feeling of unity among team members', 3),
  ((SELECT id FROM card), 'trust', 'Confidence in someone', 4),
  ((SELECT id FROM card), 'communication', 'Sharing information with others', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20503002-0000-4000-8000-000503000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What are the benefits of doing sports outdoors instead of indoors?',
    'Compare outdoor and indoor sports and their advantages.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'outdoor', 'Done outside in the open air', 1),
  ((SELECT id FROM card), 'indoor', 'Done inside a building', 2),
  ((SELECT id FROM card), 'fresh air', 'Clean air outside', 3),
  ((SELECT id FROM card), 'nature', 'The natural world', 4),
  ((SELECT id FROM card), 'weather', 'The conditions outside', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20503003-0000-4000-8000-000503000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do professional athletes inspire young people?',
    'Discuss role models, dedication, and the influence of sports stars.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'professional', 'Doing something as a paid job', 1),
  ((SELECT id FROM card), 'role model', 'A person others look up to', 2),
  ((SELECT id FROM card), 'dedication', 'Commitment to a goal', 3),
  ((SELECT id FROM card), 'inspire', 'To motivate someone', 4),
  ((SELECT id FROM card), 'achievement', 'Something accomplished successfully', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20503004-0000-4000-8000-000503000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is the importance of fair play in sports?',
    'Discuss rules, respect, honesty, and sportsmanship.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'fair play', 'Playing according to the rules with respect', 1),
  ((SELECT id FROM card), 'sportsmanship', 'Fair and generous behavior in sports', 2),
  ((SELECT id FROM card), 'respect', 'Admiration for others', 3),
  ((SELECT id FROM card), 'cheating', 'Breaking rules to gain an advantage', 4),
  ((SELECT id FROM card), 'penalty', 'A punishment for breaking rules', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20503005-0000-4000-8000-000503000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you stay motivated to exercise regularly?',
    'Discuss goals, routines, music, and workout partners.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'motivation', 'The desire to do something', 1),
  ((SELECT id FROM card), 'goal', 'Something you want to achieve', 2),
  ((SELECT id FROM card), 'progress', 'Forward movement toward a goal', 3),
  ((SELECT id FROM card), 'habit', 'A regular practice', 4),
  ((SELECT id FROM card), 'reward', 'Something given for achievement', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20503006-0000-4000-8000-000503000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is the difference between watching a live match and watching it on TV?',
    'Compare the atmosphere, experience, and cost of both.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'live', 'Happening in real time', 1),
  ((SELECT id FROM card), 'crowd', 'A large group of spectators', 2),
  ((SELECT id FROM card), 'atmosphere', 'The mood of an event', 3),
  ((SELECT id FROM card), 'ticket', 'A pass to enter an event', 4),
  ((SELECT id FROM card), 'broadcast', 'A TV or radio transmission', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20503007-0000-4000-8000-000503000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How has technology changed the way sports are played and watched?',
    'Discuss VAR, instant replay, wearable tech, and streaming.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'VAR', 'Video assistant referee technology', 1),
  ((SELECT id FROM card), 'instant replay', 'Watching a play again on video', 2),
  ((SELECT id FROM card), 'wearable', 'Technology worn on the body', 3),
  ((SELECT id FROM card), 'analytics', 'Data analysis for performance', 4),
  ((SELECT id FROM card), 'streaming', 'Watching live video online', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20503008-0000-4000-8000-000503000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What are the most popular sports for women in your country?',
    'Discuss women''s sports and their popularity.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'women''s sports', 'Sports competitions for female athletes', 1),
  ((SELECT id FROM card), 'gender equality', 'Equal treatment of all genders', 2),
  ((SELECT id FROM card), 'participation', 'Taking part in an activity', 3),
  ((SELECT id FROM card), 'league', 'A group of teams that compete', 4),
  ((SELECT id FROM card), 'visibility', 'The state of being seen or noticed', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20503009-0000-4000-8000-000503000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is a sport that is popular in your country but not in others?',
    'Describe a unique sport from your culture.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'traditional', 'Based on long-established customs', 1),
  ((SELECT id FROM card), 'unique', 'Being the only one of its kind', 2),
  ((SELECT id FROM card), 'local', 'Relating to a particular area', 3),
  ((SELECT id FROM card), 'origin', 'The beginning or source of something', 4),
  ((SELECT id FROM card), 'cultural', 'Relating to the customs of a group', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050300a-0000-4000-8000-000503000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you balance watching sports with actually being active?',
    'Discuss screen time versus physical activity.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'balance', 'A healthy mix of activities', 1),
  ((SELECT id FROM card), 'active', 'Engaging in physical movement', 2),
  ((SELECT id FROM card), 'sedentary', 'Sitting for long periods', 3),
  ((SELECT id FROM card), 'lifestyle', 'The way a person lives', 4),
  ((SELECT id FROM card), 'moderation', 'Not too much or too little', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050300b-0000-4000-8000-000503000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is the most exciting sports event you have ever seen?',
    'Describe a memorable match or competition you watched.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'exciting', 'Causing great enthusiasm', 1),
  ((SELECT id FROM card), 'final', 'The last and most important match', 2),
  ((SELECT id FROM card), 'comeback', 'Recovering from a losing position', 3),
  ((SELECT id FROM card), 'overtime', 'Extra time added to a game', 4),
  ((SELECT id FROM card), 'upset', 'An unexpected result', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050300c-0000-4000-8000-000503000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How does exercise affect your mood and mental health?',
    'Discuss the connection between physical activity and well-being.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'mental health', 'The state of your emotional well-being', 1),
  ((SELECT id FROM card), 'stress', 'A feeling of worry or pressure', 2),
  ((SELECT id FROM card), 'endorphin', 'A chemical in the brain that makes you feel good', 3),
  ((SELECT id FROM card), 'relax', 'To rest and reduce tension', 4),
  ((SELECT id FROM card), 'energy', 'The ability to be active', 5);

-- -----------------------------------------------------------
-- SPORTS — B2 (level 04)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20504001-0000-4000-8000-000504000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the ethical issues surrounding the use of performance-enhancing drugs in sports?',
    'Discuss health risks, fairness, enforcement, and the pressure to win.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'doping', 'The use of banned substances in sports', 1),
  ((SELECT id FROM card), 'performance-enhancing', 'Improving athletic ability artificially', 2),
  ((SELECT id FROM card), 'testing', 'Checking athletes for banned substances', 3),
  ((SELECT id FROM card), 'sanction', 'A penalty for breaking rules', 4),
  ((SELECT id FROM card), 'integrity', 'The quality of being honest and fair', 5),
  ((SELECT id FROM card), 'WADA', 'The World Anti-Doping Agency', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20504002-0000-4000-8000-000504000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How does the commercialization of sports affect the experience of fans?',
    'Discuss ticket prices, merchandise, advertising, and corporate ownership.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'commercialization', 'Managing something for profit', 1),
  ((SELECT id FROM card), 'sponsorship', 'Financial support from companies', 2),
  ((SELECT id FROM card), 'broadcasting rights', 'Payment for the right to show events', 3),
  ((SELECT id FROM card), 'merchandise', 'Branded products for fans', 4),
  ((SELECT id FROM card), 'corporate', 'Relating to large companies', 5),
  ((SELECT id FROM card), 'grassroots', 'The most basic level of a sport', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20504003-0000-4000-8000-000504000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the arguments for and against paying college athletes?',
    'Discuss education, revenue, exploitation, and amateurism.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'amateur', 'Not paid for participation', 1),
  ((SELECT id FROM card), 'scholarship', 'Financial aid for education', 2),
  ((SELECT id FROM card), 'revenue', 'Income generated by sports programs', 3),
  ((SELECT id FROM card), 'exploitation', 'Taking unfair advantage', 4),
  ((SELECT id FROM card), 'compensation', 'Payment for services', 5),
  ((SELECT id FROM card), 'eligibility', 'The right to participate', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20504004-0000-4000-8000-000504000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do major sporting events like the World Cup impact the host country?',
    'Discuss economic benefits, infrastructure, tourism, and social impact.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'World Cup', 'An international football championship', 1),
  ((SELECT id FROM card), 'infrastructure', 'Facilities like stadiums and transport', 2),
  ((SELECT id FROM card), 'legacy', 'What remains after the event', 3),
  ((SELECT id FROM card), 'tourism', 'Visitors traveling for the event', 4),
  ((SELECT id FROM card), 'investment', 'Money spent on development', 5),
  ((SELECT id FROM card), 'displacement', 'Moving people for construction', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20504005-0000-4000-8000-000504000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What is the role of sports in promoting social inclusion and breaking down barriers?',
    'Discuss disability sports, racial integration, and community programs.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'inclusion', 'Involving all groups of people', 1),
  ((SELECT id FROM card), 'Paralympics', 'An international sports event for disabled athletes', 2),
  ((SELECT id FROM card), 'integration', 'Bringing different groups together', 3),
  ((SELECT id FROM card), 'discrimination', 'Unfair treatment of groups', 4),
  ((SELECT id FROM card), 'diversity', 'A range of different people', 5),
  ((SELECT id FROM card), 'accessibility', 'Ease of access for all people', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20504006-0000-4000-8000-000504000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do sports psychologists help athletes improve their performance?',
    'Discuss mental preparation, focus, confidence, and handling pressure.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'psychology', 'The study of the mind and behavior', 1),
  ((SELECT id FROM card), 'visualization', 'Imagining success to improve performance', 2),
  ((SELECT id FROM card), 'concentration', 'The ability to focus', 3),
  ((SELECT id FROM card), 'resilience', 'The ability to recover from setbacks', 4),
  ((SELECT id FROM card), 'anxiety', 'A feeling of worry about performance', 5),
  ((SELECT id FROM card), 'mindset', 'A set of attitudes and beliefs', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20504007-0000-4000-8000-000504000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the pros and cons of youth participating in competitive sports?',
    'Discuss physical development, pressure, social skills, and injuries.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'youth', 'Young people', 1),
  ((SELECT id FROM card), 'competitive', 'Involving strong competition', 2),
  ((SELECT id FROM card), 'burnout', 'Physical or mental exhaustion', 3),
  ((SELECT id FROM card), 'specialization', 'Focusing on one sport exclusively', 4),
  ((SELECT id FROM card), 'overuse injury', 'An injury from repeated activity', 5),
  ((SELECT id FROM card), 'development', 'The process of growing and improving', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20504008-0000-4000-8000-000504000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How has the rise of e-sports challenged traditional definitions of sports?',
    'Discuss competition, skill, physical activity, and recognition.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'e-sports', 'Competitive video gaming', 1),
  ((SELECT id FROM card), 'gamer', 'A person who plays video games', 2),
  ((SELECT id FROM card), 'tournament', 'A series of competitions', 3),
  ((SELECT id FROM card), 'spectator', 'A person who watches an event', 4),
  ((SELECT id FROM card), 'recognition', 'Acceptance as legitimate', 5),
  ((SELECT id FROM card), 'athleticism', 'Physical skill and ability', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20504009-0000-4000-8000-000504000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do sports betting and gambling affect the integrity of sports?',
    'Discuss match-fixing, addiction, regulation, and athlete vulnerability.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'betting', 'Risking money on the outcome of events', 1),
  ((SELECT id FROM card), 'match-fixing', 'Arranging the result of a game illegally', 2),
  ((SELECT id FROM card), 'addiction', 'A strong dependency on gambling', 3),
  ((SELECT id FROM card), 'regulation', 'Government rules and oversight', 4),
  ((SELECT id FROM card), 'corruption', 'Dishonest or illegal behavior', 5),
  ((SELECT id FROM card), 'integrity', 'Honesty and moral principles', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050400a-0000-4000-8000-000504000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What is the impact of social media on athletes'' mental health and public image?',
    'Discuss online criticism, pressure, brand building, and support.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'public image', 'How someone is perceived by the public', 1),
  ((SELECT id FROM card), 'trolling', 'Deliberately provoking others online', 2),
  ((SELECT id FROM card), 'brand', 'An athlete''s personal image and identity', 3),
  ((SELECT id FROM card), 'scrutiny', 'Close and critical examination', 4),
  ((SELECT id FROM card), 'endorsement', 'Promoting products for payment', 5),
  ((SELECT id FROM card), 'cyberbullying', 'Online harassment', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050400b-0000-4000-8000-000504000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do different countries invest in developing elite athletes?',
    'Compare funding models, training facilities, and talent identification.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'elite', 'The highest level of performance', 1),
  ((SELECT id FROM card), 'talent identification', 'Finding promising young athletes', 2),
  ((SELECT id FROM card), 'funding', 'Money provided for development', 3),
  ((SELECT id FROM card), 'academy', 'A training institution for young athletes', 4),
  ((SELECT id FROM card), 'scouting', 'Searching for talented players', 5),
  ((SELECT id FROM card), 'pipeline', 'A system for developing talent', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050400c-0000-4000-8000-000504000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the long-term health consequences of contact sports like boxing and rugby?',
    'Discuss concussions, CTE, safety measures, and rule changes.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'concussion', 'A brain injury from a blow to the head', 1),
  ((SELECT id FROM card), 'CTE', 'A brain disease from repeated head impacts', 2),
  ((SELECT id FROM card), 'protective gear', 'Equipment that prevents injury', 3),
  ((SELECT id FROM card), 'protocol', 'A set of safety procedures', 4),
  ((SELECT id FROM card), 'retirement', 'Ending a professional career', 5),
  ((SELECT id FROM card), 'aftercare', 'Support after a sports career ends', 6);

-- -----------------------------------------------------------
-- SPORTS — C1 (level 05)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20505001-0000-4000-8000-000505000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the political use of sports for soft power and national branding affect international relations?',
    'Analyze sports diplomacy, boycotts, hosting events, and propaganda.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'soft power', 'Influence through culture and values', 1),
  ((SELECT id FROM card), 'sports diplomacy', 'Using sports to improve international relations', 2),
  ((SELECT id FROM card), 'boycott', 'Refusing to participate as a protest', 3),
  ((SELECT id FROM card), 'propaganda', 'Information used to promote a political cause', 4),
  ((SELECT id FROM card), 'nationalism', 'Patriotic feeling for one''s country', 5),
  ((SELECT id FROM card), 'image laundering', 'Using events to improve a country''s reputation', 6),
  ((SELECT id FROM card), 'mega-event', 'A large-scale international sports event', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20505002-0000-4000-8000-000505000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What are the implications of genetic engineering and biotechnology for the future of sports?',
    'Discuss gene doping, designer athletes, fairness, and regulation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'gene doping', 'Using genetic modification to enhance performance', 1),
  ((SELECT id FROM card), 'biotechnology', 'Technology using biological systems', 2),
  ((SELECT id FROM card), 'designer athlete', 'An athlete genetically engineered for sports', 3),
  ((SELECT id FROM card), 'enhancement', 'Improvement of natural abilities', 4),
  ((SELECT id FROM card), 'eugenics', 'The controversial practice of genetic selection', 5),
  ((SELECT id FROM card), 'regulatory framework', 'Rules governing new technologies', 6),
  ((SELECT id FROM card), 'slippery slope', 'A course of action leading to undesirable outcomes', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20505003-0000-4000-8000-000505000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the structure of professional sports leagues reflect broader economic inequality?',
    'Examine salary caps, revenue sharing, player markets, and competitive balance.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'salary cap', 'A limit on total player salaries', 1),
  ((SELECT id FROM card), 'revenue sharing', 'Distributing income among teams', 2),
  ((SELECT id FROM card), 'competitive balance', 'Fairness in competition between teams', 3),
  ((SELECT id FROM card), 'free agency', 'Players moving between teams freely', 4),
  ((SELECT id FROM card), 'parity', 'Equality among competing teams', 5),
  ((SELECT id FROM card), 'monopsony', 'A market with only one buyer of talent', 6),
  ((SELECT id FROM card), 'collective bargaining', 'Negotiation between league and players', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20505004-0000-4000-8000-000505000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How should sports governing bodies address the issue of transgender athlete participation?',
    'Discuss fairness, inclusion, scientific evidence, and policy development.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'transgender', 'Having a gender identity different from birth sex', 1),
  ((SELECT id FROM card), 'inclusion', 'Ensuring everyone can participate', 2),
  ((SELECT id FROM card), 'testosterone', 'A hormone affecting athletic performance', 3),
  ((SELECT id FROM card), 'eligibility criteria', 'Rules determining who can compete', 4),
  ((SELECT id FROM card), 'level playing field', 'Fair competition for all', 5),
  ((SELECT id FROM card), 'evidence-based', 'Based on scientific research', 6),
  ((SELECT id FROM card), 'human rights', 'Basic rights and freedoms', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20505005-0000-4000-8000-000505000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What is the relationship between sports media coverage and the gender pay gap in athletics?',
    'Analyze TV deals, sponsorship, viewership, and investment in women''s sports.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'pay gap', 'The difference in earnings between groups', 1),
  ((SELECT id FROM card), 'media coverage', 'The amount of attention from news outlets', 2),
  ((SELECT id FROM card), 'viewership', 'The number of people watching', 3),
  ((SELECT id FROM card), 'sponsorship', 'Corporate financial support', 4),
  ((SELECT id FROM card), 'parity', 'Equality in pay and treatment', 5),
  ((SELECT id FROM card), 'disparity', 'A significant difference', 6),
  ((SELECT id FROM card), 'advocacy', 'Public support for change', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20505006-0000-4000-8000-000505000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How might climate change affect the future of outdoor sports and major events?',
    'Discuss extreme heat, rising sea levels, winter sports, and adaptation strategies.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'extreme heat', 'Dangerously high temperatures', 1),
  ((SELECT id FROM card), 'adaptation', 'Adjusting to new conditions', 2),
  ((SELECT id FROM card), 'artificial snow', 'Man-made snow for skiing', 3),
  ((SELECT id FROM card), 'carbon footprint', 'Emissions from sports events', 4),
  ((SELECT id FROM card), 'sustainability', 'Environmental responsibility', 5),
  ((SELECT id FROM card), 'disruption', 'Interruption of normal activities', 6),
  ((SELECT id FROM card), 'resilience', 'The ability to withstand challenges', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20505007-0000-4000-8000-000505000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How do data analytics and machine learning transform team strategy and player recruitment?',
    'Examine performance metrics, scouting algorithms, and in-game decision-making.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'analytics', 'Data analysis for insights', 1),
  ((SELECT id FROM card), 'metric', 'A measurable indicator of performance', 2),
  ((SELECT id FROM card), 'recruitment', 'The process of signing players', 3),
  ((SELECT id FROM card), 'scouting', 'Evaluating potential players', 4),
  ((SELECT id FROM card), 'predictive modeling', 'Using data to forecast outcomes', 5),
  ((SELECT id FROM card), 'optimization', 'Making the best use of resources', 6),
  ((SELECT id FROM card), 'moneyball', 'Using analytics to build a team on a budget', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20505008-0000-4000-8000-000505000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What are the ethical boundaries of using technology to enhance human physical performance?',
    'Discuss prosthetics, exoskeletons, supplements, and the definition of natural ability.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'prosthetic', 'An artificial body part', 1),
  ((SELECT id FROM card), 'exoskeleton', 'A wearable robotic device', 2),
  ((SELECT id FROM card), 'supplement', 'A product taken to enhance performance', 3),
  ((SELECT id FROM card), 'technological doping', 'Using technology for unfair advantage', 4),
  ((SELECT id FROM card), 'ableism', 'Discrimination in favor of able-bodied people', 5),
  ((SELECT id FROM card), 'transhumanism', 'Enhancing humans through technology', 6),
  ((SELECT id FROM card), 'leveling the field', 'Making competition fairer', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20505009-0000-4000-8000-000505000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the concept of "sportswashing" affect the governance and credibility of international sports?',
    'Analyze human rights concerns, hosting decisions, and athlete activism.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'sportswashing', 'Using sports to distract from controversies', 1),
  ((SELECT id FROM card), 'governance', 'The system of rules and control', 2),
  ((SELECT id FROM card), 'credibility', 'The quality of being trusted', 3),
  ((SELECT id FROM card), 'activism', 'Using influence to promote change', 4),
  ((SELECT id FROM card), 'accountability', 'Responsibility for actions', 5),
  ((SELECT id FROM card), 'transparency', 'Openness in decision-making', 6),
  ((SELECT id FROM card), 'legitimacy', 'Acceptance as valid and proper', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050500a-0000-4000-8000-000505000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How should professional sports address the issue of athlete activism and political expression?',
    'Discuss protests, anthems, free speech, and league policies.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'activism', 'Taking action for social change', 1),
  ((SELECT id FROM card), 'protest', 'A public expression of objection', 2),
  ((SELECT id FROM card), 'anthem', 'A national song played at events', 3),
  ((SELECT id FROM card), 'free speech', 'The right to express opinions', 4),
  ((SELECT id FROM card), 'sanction', 'A penalty for breaking rules', 5),
  ((SELECT id FROM card), 'platform', 'An opportunity to be heard', 6),
  ((SELECT id FROM card), 'solidarity', 'Unity and mutual support', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050500b-0000-4000-8000-000505000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What is the impact of sports gambling legalization on the integrity of competitions?',
    'Examine regulation, addiction, insider information, and game manipulation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'legalization', 'Making something legal', 1),
  ((SELECT id FROM card), 'insider trading', 'Using non-public information for betting', 2),
  ((SELECT id FROM card), 'integrity monitoring', 'Systems to detect match manipulation', 3),
  ((SELECT id FROM card), 'addiction', 'Compulsive gambling behavior', 4),
  ((SELECT id FROM card), 'regulatory oversight', 'Government supervision of gambling', 5),
  ((SELECT id FROM card), 'conflict of interest', 'A situation compromising impartiality', 6),
  ((SELECT id FROM card), 'whistleblower', 'A person who exposes wrongdoing', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050500c-0000-4000-8000-000505000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the globalization of sports talent affect national team identity and development?',
    'Discuss naturalization, diaspora players, youth academies, and cultural exchange.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'globalization', 'The worldwide movement of talent', 1),
  ((SELECT id FROM card), 'naturalization', 'Becoming a citizen to play for a country', 2),
  ((SELECT id FROM card), 'diaspora', 'Players from a country living abroad', 3),
  ((SELECT id FROM card), 'national identity', 'The sense of belonging to a nation', 4),
  ((SELECT id FROM card), 'talent drain', 'Loss of players to other countries', 5),
  ((SELECT id FROM card), 'dual nationality', 'Having citizenship of two countries', 6),
  ((SELECT id FROM card), 'cultural exchange', 'Sharing traditions between cultures', 7);

-- -----------------------------------------------------------
-- SPORTS — C2 (level 06)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20506001-0000-4000-8000-000506000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically evaluate the proposition that modern sports have become a secular religion in contemporary society.',
    'Examine ritual, devotion, community, symbolism, and the quasi-religious nature of fandom.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'secular religion', 'A non-religious system of belief and devotion', 1),
  ((SELECT id FROM card), 'ritual', 'A repeated ceremonial practice', 2),
  ((SELECT id FROM card), 'fandom', 'The community of devoted fans', 3),
  ((SELECT id FROM card), 'totem', 'A symbolic object of devotion', 4),
  ((SELECT id FROM card), 'pilgrimage', 'A journey to a sacred place', 5),
  ((SELECT id FROM card), 'iconography', 'Visual symbols and imagery', 6),
  ((SELECT id FROM card), 'collective effervescence', 'A shared emotional excitement', 7),
  ((SELECT id FROM card), 'civil religion', 'The religious dimension of public life', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20506002-0000-4000-8000-000506000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Analyze the philosophical tension between the pursuit of excellence and the principle of fair competition in elite sports.',
    'Examine meritocracy, equality of opportunity, and the paradox of performance enhancement.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'meritocracy', 'A system based on ability and achievement', 1),
  ((SELECT id FROM card), 'excellence', 'The quality of being outstanding', 2),
  ((SELECT id FROM card), 'egalitarianism', 'The principle of equal opportunity', 3),
  ((SELECT id FROM card), 'paradox', 'A seemingly contradictory situation', 4),
  ((SELECT id FROM card), 'teleology', 'The study of purpose and goals', 5),
  ((SELECT id FROM card), 'deontology', 'An ethical approach based on duties', 6),
  ((SELECT id FROM card), 'consequentialism', 'An ethical approach based on outcomes', 7),
  ((SELECT id FROM card), 'virtue ethics', 'An ethical approach based on character', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20506003-0000-4000-8000-000506000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How does the political economy of global sports governance perpetuate power imbalances between nations?',
    'Examine FIFA, IOC, voting structures, resource distribution, and reform efforts.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'political economy', 'The study of power and resource distribution', 1),
  ((SELECT id FROM card), 'governance', 'The system of rules and decision-making', 2),
  ((SELECT id FROM card), 'hegemony', 'Dominance of one group over others', 3),
  ((SELECT id FROM card), 'neocolonialism', 'Indirect control through economic means', 4),
  ((SELECT id FROM card), 'patronage', 'The power to appoint and reward', 5),
  ((SELECT id FROM card), 'reform', 'Changes to improve the system', 6),
  ((SELECT id FROM card), 'democratization', 'Making governance more inclusive', 7),
  ((SELECT id FROM card), 'accountability deficit', 'Lack of responsibility to stakeholders', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20506004-0000-4000-8000-000506000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'To what extent does the concept of "muscular Christianity" still influence modern sports culture?',
    'Analyze the historical relationship between religion, character building, and athletic competition.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'muscular Christianity', 'A movement linking physical strength with Christian values', 1),
  ((SELECT id FROM card), 'character building', 'Developing moral qualities through sport', 2),
  ((SELECT id FROM card), 'amateurism', 'The ideal of playing for love not money', 3),
  ((SELECT id FROM card), 'protestant ethic', 'The value placed on hard work and discipline', 4),
  ((SELECT id FROM card), 'moral development', 'The growth of ethical understanding', 5),
  ((SELECT id FROM card), 'sports evangelism', 'Using sports to spread religious messages', 6),
  ((SELECT id FROM card), 'secularization', 'The decline of religious influence', 7),
  ((SELECT id FROM card), 'muscular atheism', 'A secular version of sports as moral training', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20506005-0000-4000-8000-000506000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Evaluate the claim that the Olympic ideal of international unity is fundamentally incompatible with national competition.',
    'Examine the paradox of nationalism within a supposedly universal movement.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'Olympic ideal', 'The philosophy of peace and unity through sport', 1),
  ((SELECT id FROM card), 'universalism', 'The principle of applying to all humanity', 2),
  ((SELECT id FROM card), 'nationalism', 'Loyalty and devotion to one''s nation', 3),
  ((SELECT id FROM card), 'cosmopolitanism', 'The idea of global citizenship', 4),
  ((SELECT id FROM card), 'particularism', 'Focusing on one''s own group', 5),
  ((SELECT id FROM card), 'antithesis', 'A direct opposite', 6),
  ((SELECT id FROM card), 'synthesis', 'A combination of opposing ideas', 7),
  ((SELECT id FROM card), 'Olympic truce', 'An ancient tradition of peace during games', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20506006-0000-4000-8000-000506000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How does the phenomenology of athletic experience challenge Cartesian dualism of mind and body?',
    'Explore embodied cognition, flow states, and the unity of physical and mental experience.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'phenomenology', 'The study of subjective experience', 1),
  ((SELECT id FROM card), 'Cartesian dualism', 'The separation of mind and body', 2),
  ((SELECT id FROM card), 'embodied cognition', 'The idea that the body shapes the mind', 3),
  ((SELECT id FROM card), 'flow state', 'Complete absorption in an activity', 4),
  ((SELECT id FROM card), 'kinesthetic', 'Relating to the sensation of movement', 5),
  ((SELECT id FROM card), 'proprioception', 'Awareness of body position', 6),
  ((SELECT id FROM card), 'mindfulness', 'Focused awareness of the present moment', 7),
  ((SELECT id FROM card), 'somatic', 'Relating to the body as distinct from the mind', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20506007-0000-4000-8000-000506000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically assess the argument that sports fandom provides a healthy outlet for tribal instincts in modern societies.',
    'Examine group identity, aggression, catharsis, and the psychology of belonging.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'tribalism', 'Strong loyalty to a group', 1),
  ((SELECT id FROM card), 'catharsis', 'The release of strong emotions', 2),
  ((SELECT id FROM card), 'ingroup bias', 'Favoring one''s own group', 3),
  ((SELECT id FROM card), 'outgroup hostility', 'Negative feelings toward other groups', 4),
  ((SELECT id FROM card), 'social identity theory', 'How group membership shapes self-concept', 5),
  ((SELECT id FROM card), 'vicarious achievement', 'Feeling success through others', 6),
  ((SELECT id FROM card), 'basking in reflected glory', 'Sharing in the success of one''s team', 7),
  ((SELECT id FROM card), 'cutting off reflected failure', 'Distancing from a losing team', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20506008-0000-4000-8000-000506000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How might the increasing use of AI referees and automated officiating transform the nature of sports?',
    'Analyze objectivity, human judgment, the role of controversy, and the essence of sport.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'automated officiating', 'AI systems making referee decisions', 1),
  ((SELECT id FROM card), 'objectivity', 'Lack of bias in decision-making', 2),
  ((SELECT id FROM card), 'human judgment', 'Decisions based on human interpretation', 3),
  ((SELECT id FROM card), 'controversy', 'Disagreement and debate', 4),
  ((SELECT id FROM card), 'essence of sport', 'The fundamental nature of athletic competition', 5),
  ((SELECT id FROM card), 'dehumanization', 'Removing human elements from sport', 6),
  ((SELECT id FROM card), 'algorithmic authority', 'Trust in machine decisions', 7),
  ((SELECT id FROM card), 'fallibility', 'The tendency to make errors', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20506009-0000-4000-8000-000506000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'What are the ontological implications of considering e-sports as "real sports" for our definition of athleticism?',
    'Examine the nature of physicality, skill, competition, and the boundaries of sport.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'ontology', 'The nature of being and reality', 1),
  ((SELECT id FROM card), 'physicality', 'The quality of involving the body', 2),
  ((SELECT id FROM card), 'dexterity', 'Skill in using one''s hands', 3),
  ((SELECT id FROM card), 'reflex', 'An involuntary response to stimuli', 4),
  ((SELECT id FROM card), 'categorization', 'Classifying into groups', 5),
  ((SELECT id FROM card), 'essentialism', 'The belief in fixed defining characteristics', 6),
  ((SELECT id FROM card), 'social construction', 'An idea created by society', 7),
  ((SELECT id FROM card), 'boundary work', 'Defining the limits of a category', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050600a-0000-4000-8000-000506000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How should societies reconcile the tension between athlete welfare and the entertainment value of contact sports?',
    'Examine duty of care, informed consent, regulation, and the ethics of risk.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'duty of care', 'A legal obligation to protect others', 1),
  ((SELECT id FROM card), 'informed consent', 'Agreement with full knowledge of risks', 2),
  ((SELECT id FROM card), 'risk acceptance', 'Willingness to accept potential harm', 3),
  ((SELECT id FROM card), 'paternalism', 'Limiting choices for someone''s own good', 4),
  ((SELECT id FROM card), 'utilitarianism', 'An ethics based on the greatest good', 5),
  ((SELECT id FROM card), 'gladiatorial', 'Relating to violent public entertainment', 6),
  ((SELECT id FROM card), 'spectacle', 'A visually impressive event', 7),
  ((SELECT id FROM card), 'commodification of risk', 'Turning danger into a marketable product', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050600b-0000-4000-8000-000506000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Analyze the epistemological challenges of measuring and comparing athletic performance across different eras.',
    'Consider technological advances, training methods, records, and contextual factors.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'epistemological', 'Relating to the nature of knowledge', 1),
  ((SELECT id FROM card), 'longitudinal', 'Studying something over a long period', 2),
  ((SELECT id FROM card), 'contextualization', 'Placing in proper context', 3),
  ((SELECT id FROM card), 'commensurability', 'The ability to be measured on a common scale', 4),
  ((SELECT id FROM card), 'nostalgia bias', 'Tendency to view the past more favorably', 5),
  ((SELECT id FROM card), 'recency bias', 'Overvaluing recent events', 6),
  ((SELECT id FROM card), 'statistical significance', 'The likelihood that a result is not due to chance', 7),
  ((SELECT id FROM card), 'apples to oranges', 'Comparing things that are fundamentally different', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2050600c-0000-4000-8000-000506000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically evaluate the proposition that the commercialization of youth sports has corrupted their developmental purpose.',
    'Examine parental pressure, travel teams, specialization, and the economics of youth athletics.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'commercialization', 'The process of making profit from an activity', 1),
  ((SELECT id FROM card), 'developmental purpose', 'The goal of fostering growth and learning', 2),
  ((SELECT id FROM card), 'specialization', 'Focusing on a single sport year-round', 3),
  ((SELECT id FROM card), 'pay-to-play', 'Requiring payment for participation', 4),
  ((SELECT id FROM card), 'attrition', 'The gradual loss of participants', 5),
  ((SELECT id FROM card), 'instrumentalism', 'Treating sports as a means to an end', 6),
  ((SELECT id FROM card), 'intrinsic value', 'The inherent worth of an activity', 7),
  ((SELECT id FROM card), 'commodification', 'Turning a human activity into a product', 8);

-- ============================================================
-- TOPIC: BUSINESS (06)
-- ============================================================

-- -----------------------------------------------------------
-- BUSINESS — A1 (level 01)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20601001-0000-4000-8000-000601000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is your job? What do you like about it?',
    'Describe your work and what makes it enjoyable.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'job', 'Work that you do to earn money', 1),
  ((SELECT id FROM card), 'work', 'Activity involving effort for a purpose', 2),
  ((SELECT id FROM card), 'boss', 'A person who manages workers', 3),
  ((SELECT id FROM card), 'salary', 'Money you earn for your work', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20601002-0000-4000-8000-000601000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What time do you start and finish work?',
    'Describe your daily work schedule.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'morning', 'The early part of the day', 1),
  ((SELECT id FROM card), 'afternoon', 'The time after midday', 2),
  ((SELECT id FROM card), 'clock', 'A device that shows the time', 3),
  ((SELECT id FROM card), 'break', 'A short rest from work', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20601003-0000-4000-8000-000601000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What do you wear to work? Do you wear a uniform?',
    'Describe your work clothes and what they look like.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'suit', 'A set of matching formal clothes', 1),
  ((SELECT id FROM card), 'tie', 'A long piece of cloth worn around the neck', 2),
  ((SELECT id FROM card), 'uniform', 'Special clothes for a job', 3),
  ((SELECT id FROM card), 'comfortable', 'Pleasant to wear', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20601004-0000-4000-8000-000601000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is a shop? What can you buy in a shop?',
    'Describe different types of shops and what they sell.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'shop', 'A place where you buy things', 1),
  ((SELECT id FROM card), 'customer', 'A person who buys something', 2),
  ((SELECT id FROM card), 'price', 'The amount of money for something', 3),
  ((SELECT id FROM card), 'money', 'Coins and notes used to pay', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20601005-0000-4000-8000-000601000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What do you want to be when you grow up? Why?',
    'Describe a job you would like to have in the future.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'doctor', 'A person who treats sick people', 1),
  ((SELECT id FROM card), 'teacher', 'A person who helps students learn', 2),
  ((SELECT id FROM card), 'engineer', 'A person who designs and builds things', 3),
  ((SELECT id FROM card), 'nurse', 'A person who cares for patients', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20601006-0000-4000-8000-000601000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Where do people work in your town? Name some places.',
    'List different workplaces like offices, factories, and shops.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'office', 'A room or building for work', 1),
  ((SELECT id FROM card), 'factory', 'A building where things are made', 2),
  ((SELECT id FROM card), 'hospital', 'A place where sick people are treated', 3),
  ((SELECT id FROM card), 'bank', 'A place where money is kept', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20601007-0000-4000-8000-000601000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'How do you go to work? How long does it take?',
    'Describe your commute to work and how long it takes.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'car', 'A vehicle for traveling on roads', 1),
  ((SELECT id FROM card), 'bus', 'A large vehicle for public transport', 2),
  ((SELECT id FROM card), 'walk', 'To travel on foot', 3),
  ((SELECT id FROM card), 'minute', 'A unit of time', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20601008-0000-4000-8000-000601000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What do you do on your days off from work?',
    'Describe your activities when you are not working.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'holiday', 'A day or period of rest from work', 1),
  ((SELECT id FROM card), 'weekend', 'Saturday and Sunday', 2),
  ((SELECT id FROM card), 'rest', 'To stop working and relax', 3),
  ((SELECT id FROM card), 'free time', 'Time when you are not working', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20601009-0000-4000-8000-000601000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What things do you use at work? Name some tools or equipment.',
    'List the items you need to do your job.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'computer', 'An electronic device for work', 1),
  ((SELECT id FROM card), 'phone', 'A device for calling people', 2),
  ((SELECT id FROM card), 'paper', 'Material for writing on', 3),
  ((SELECT id FROM card), 'pen', 'A tool for writing', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060100a-0000-4000-8000-000601000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Do you like to work alone or with other people? Why?',
    'Compare working by yourself and working in a team.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'alone', 'By yourself', 1),
  ((SELECT id FROM card), 'team', 'A group of people working together', 2),
  ((SELECT id FROM card), 'help', 'To assist someone', 3),
  ((SELECT id FROM card), 'talk', 'To speak with others', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060100b-0000-4000-8000-000601000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is a market? What can you find there?',
    'Describe a market and the things people sell there.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'market', 'A place where people buy and sell goods', 1),
  ((SELECT id FROM card), 'seller', 'A person who sells things', 2),
  ((SELECT id FROM card), 'buy', 'To get something by paying money', 3),
  ((SELECT id FROM card), 'product', 'Something that is made to be sold', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060100c-0000-4000-8000-000601000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What numbers and counting do you use at work or when shopping?',
    'Talk about prices, quantities, and numbers in daily business.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'number', 'A word or symbol for counting', 1),
  ((SELECT id FROM card), 'count', 'To say numbers in order', 2),
  ((SELECT id FROM card), 'total', 'The complete amount', 3),
  ((SELECT id FROM card), 'change', 'Money returned after payment', 4);

-- -----------------------------------------------------------
-- BUSINESS — A2 (level 02)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20602001-0000-4000-8000-000602000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is your dream job? Why would you like to do it?',
    'Describe the job you want and the skills you need for it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'dream job', 'The perfect job for you', 1),
  ((SELECT id FROM card), 'skill', 'An ability to do something well', 2),
  ((SELECT id FROM card), 'career', 'A job that you do for a long time', 3),
  ((SELECT id FROM card), 'experience', 'Knowledge gained from doing something', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20602002-0000-4000-8000-000602000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you write a professional email? What do you include?',
    'Describe the parts of a good email for work.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'subject', 'The title of an email', 1),
  ((SELECT id FROM card), 'greeting', 'A polite opening phrase', 2),
  ((SELECT id FROM card), 'signature', 'Your name and contact at the end', 3),
  ((SELECT id FROM card), 'attachment', 'A file sent with an email', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20602003-0000-4000-8000-000602000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is a small business? Can you name some examples?',
    'Describe small businesses in your area and what they do.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'business', 'An organization that sells goods or services', 1),
  ((SELECT id FROM card), 'owner', 'A person who runs a business', 2),
  ((SELECT id FROM card), 'service', 'Work done for customers', 3),
  ((SELECT id FROM card), 'profit', 'Money earned after costs', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20602004-0000-4000-8000-000602000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you greet a customer in a shop or office?',
    'Describe polite phrases you use with customers.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'welcome', 'A friendly greeting to someone', 1),
  ((SELECT id FROM card), 'polite', 'Showing good manners', 2),
  ((SELECT id FROM card), 'help', 'To assist a customer', 3),
  ((SELECT id FROM card), 'thank you', 'An expression of gratitude', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20602005-0000-4000-8000-000602000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What do you do in a typical meeting at work?',
    'Describe what happens in a work meeting.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'meeting', 'A gathering for discussion', 1),
  ((SELECT id FROM card), 'agenda', 'A list of topics to discuss', 2),
  ((SELECT id FROM card), 'discuss', 'To talk about something', 3),
  ((SELECT id FROM card), 'decision', 'A choice made after discussion', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20602006-0000-4000-8000-000602000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you save money? Why is saving money important?',
    'Talk about ways to save money and why it matters.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'save', 'To keep money for later', 1),
  ((SELECT id FROM card), 'budget', 'A plan for spending money', 2),
  ((SELECT id FROM card), 'spend', 'To use money to buy things', 3),
  ((SELECT id FROM card), 'account', 'A place to keep money in a bank', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20602007-0000-4000-8000-000602000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is a receipt? Why is it important to keep it?',
    'Describe what a receipt shows and why you need it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'receipt', 'A document showing what you paid', 1),
  ((SELECT id FROM card), 'invoice', 'A bill for goods or services', 2),
  ((SELECT id FROM card), 'tax', 'Money paid to the government', 3),
  ((SELECT id FROM card), 'refund', 'Money returned for a returned item', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20602008-0000-4000-8000-000602000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is the difference between a boss and an employee?',
    'Describe the roles of managers and workers in a company.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'manager', 'A person who directs a team', 1),
  ((SELECT id FROM card), 'employee', 'A person who works for a company', 2),
  ((SELECT id FROM card), 'colleague', 'A person you work with', 3),
  ((SELECT id FROM card), 'company', 'An organization that does business', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20602009-0000-4000-8000-000602000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you answer the phone at work? What do you say?',
    'Describe professional phone etiquette.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'call', 'A telephone conversation', 1),
  ((SELECT id FROM card), 'message', 'Information left for someone', 2),
  ((SELECT id FROM card), 'transfer', 'To pass a call to someone else', 3),
  ((SELECT id FROM card), 'hold', 'To wait on the phone', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060200a-0000-4000-8000-000602000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is an interview? How do you prepare for one?',
    'Describe what happens in a job interview and how to get ready.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'interview', 'A formal meeting for a job', 1),
  ((SELECT id FROM card), 'CV', 'A document listing your experience', 2),
  ((SELECT id FROM card), 'question', 'Something asked to learn information', 3),
  ((SELECT id FROM card), 'apply', 'To formally request a job', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060200b-0000-4000-8000-000602000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is a store or restaurant you like to visit? Why?',
    'Describe a business you enjoy and what makes it good.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'quality', 'How good something is', 1),
  ((SELECT id FROM card), 'service', 'The help provided to customers', 2),
  ((SELECT id FROM card), 'price', 'The cost of something', 3),
  ((SELECT id FROM card), 'location', 'Where a business is situated', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060200c-0000-4000-8000-000602000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What are the busiest times of year for shops and businesses?',
    'Describe seasonal business patterns and holidays.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'season', 'A period of the year', 1),
  ((SELECT id FROM card), 'holiday', 'A special day when businesses are busy', 2),
  ((SELECT id FROM card), 'sale', 'A period of reduced prices', 3),
  ((SELECT id FROM card), 'stock', 'Goods available for sale', 4);

-- -----------------------------------------------------------
-- BUSINESS — B1 (level 03)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20603001-0000-4000-8000-000603000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What skills are important for success in the workplace?',
    'Discuss communication, teamwork, problem-solving, and time management.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'communication', 'Sharing information effectively', 1),
  ((SELECT id FROM card), 'problem-solving', 'Finding solutions to challenges', 2),
  ((SELECT id FROM card), 'time management', 'Organizing time efficiently', 3),
  ((SELECT id FROM card), 'teamwork', 'Working well with others', 4),
  ((SELECT id FROM card), 'leadership', 'Guiding and directing a team', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20603002-0000-4000-8000-000603000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you handle a difficult customer or client?',
    'Discuss patience, listening, and finding solutions.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'complaint', 'An expression of dissatisfaction', 1),
  ((SELECT id FROM card), 'resolve', 'To find a solution', 2),
  ((SELECT id FROM card), 'apologize', 'To express regret', 3),
  ((SELECT id FROM card), 'compromise', 'An agreement through mutual concession', 4),
  ((SELECT id FROM card), 'satisfaction', 'The state of being pleased', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20603003-0000-4000-8000-000603000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is the difference between working for a company and being self-employed?',
    'Compare the advantages and disadvantages of each.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'self-employed', 'Working for yourself', 1),
  ((SELECT id FROM card), 'freelance', 'Working independently for different clients', 2),
  ((SELECT id FROM card), 'contract', 'A formal work agreement', 3),
  ((SELECT id FROM card), 'income', 'Money received from work', 4),
  ((SELECT id FROM card), 'security', 'Stability and certainty', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20603004-0000-4000-8000-000603000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you plan a project at work? What steps do you follow?',
    'Describe the process of planning, executing, and reviewing a project.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'project', 'A planned piece of work', 1),
  ((SELECT id FROM card), 'deadline', 'A time by which work must be finished', 2),
  ((SELECT id FROM card), 'task', 'A piece of work to be done', 3),
  ((SELECT id FROM card), 'milestone', 'An important stage in a project', 4),
  ((SELECT id FROM card), 'deliverable', 'A product or result to be provided', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20603005-0000-4000-8000-000603000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do companies use advertising to attract customers?',
    'Discuss TV ads, social media, billboards, and online marketing.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'advertising', 'Promoting products to customers', 1),
  ((SELECT id FROM card), 'target audience', 'The intended group of customers', 2),
  ((SELECT id FROM card), 'brand', 'A company''s identity and image', 3),
  ((SELECT id FROM card), 'campaign', 'A series of promotional activities', 4),
  ((SELECT id FROM card), 'marketing', 'The process of promoting and selling', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20603006-0000-4000-8000-000603000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is the importance of customer service in business?',
    'Discuss how good service affects reputation and sales.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'customer service', 'Help and support provided to customers', 1),
  ((SELECT id FROM card), 'reputation', 'The general opinion about a business', 2),
  ((SELECT id FROM card), 'loyalty', 'Continued support from customers', 3),
  ((SELECT id FROM card), 'feedback', 'Opinions from customers', 4),
  ((SELECT id FROM card), 'retention', 'Keeping customers over time', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20603007-0000-4000-8000-000603000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you negotiate a better price or deal?',
    'Discuss negotiation strategies and communication techniques.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'negotiate', 'To discuss terms to reach an agreement', 1),
  ((SELECT id FROM card), 'offer', 'A proposal to do something', 2),
  ((SELECT id FROM card), 'discount', 'A reduction in price', 3),
  ((SELECT id FROM card), 'deal', 'An agreement between parties', 4),
  ((SELECT id FROM card), 'terms', 'The conditions of an agreement', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20603008-0000-4000-8000-000603000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is the role of money in motivating people at work?',
    'Discuss salary, bonuses, benefits, and non-financial motivation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'bonus', 'Extra payment for good performance', 1),
  ((SELECT id FROM card), 'benefit', 'A non-wage advantage of a job', 2),
  ((SELECT id FROM card), 'incentive', 'Something that motivates action', 3),
  ((SELECT id FROM card), 'promotion', 'Moving to a higher position', 4),
  ((SELECT id FROM card), 'recognition', 'Acknowledgment of good work', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20603009-0000-4000-8000-000603000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you stay organized when you have many tasks to complete?',
    'Discuss to-do lists, prioritization, and productivity methods.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'prioritize', 'To arrange tasks by importance', 1),
  ((SELECT id FROM card), 'organize', 'To arrange things systematically', 2),
  ((SELECT id FROM card), 'efficient', 'Working in a well-organized way', 3),
  ((SELECT id FROM card), 'multitask', 'To do several things at once', 4),
  ((SELECT id FROM card), 'delegate', 'To give tasks to others', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060300a-0000-4000-8000-000603000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is the difference between a product and a service?',
    'Give examples of each and explain the difference.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'product', 'A physical item for sale', 1),
  ((SELECT id FROM card), 'service', 'Work done for customers', 2),
  ((SELECT id FROM card), 'tangible', 'Something you can touch', 3),
  ((SELECT id FROM card), 'intangible', 'Something not physical', 4);

-- BUSINESS — B1 (card 11)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060300b-0000-4000-8000-000603000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you handle stress and pressure at work?',
    'Discuss coping strategies, time management, and maintaining work-life balance.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'stress', 'A feeling of worry or tension', 1),
  ((SELECT id FROM card), 'deadline', 'A time by which work must be finished', 2),
  ((SELECT id FROM card), 'priority', 'Something regarded as more important', 3),
  ((SELECT id FROM card), 'workload', 'The amount of work assigned', 4);

-- BUSINESS — B1 (card 12)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060300c-0000-4000-8000-000603000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'Why is it important to have good communication skills in business?',
    'Discuss speaking, listening, writing, and non-verbal communication.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'active listening', 'Fully concentrating on what is being said', 1),
  ((SELECT id FROM card), 'feedback', 'Information about performance', 2),
  ((SELECT id FROM card), 'clarity', 'The quality of being clear and understandable', 3),
  ((SELECT id FROM card), 'tone', 'The attitude expressed in communication', 4);

-- ============================================================
-- NOTE: B2, C1, C2 levels for Business are provided in
-- db/seed-extension-part3b.sql.
-- ============================================================

-- ============================================================
-- STATISTICS (for this extension file — Part 3)
-- ============================================================
-- Languages: 1 (English)
-- Levels: 6 (A1, A2, B1, B2, C1, C2)
-- Topics: 2 (Sports, Business)
-- Cards Added: 144 (12 per combination × 6 levels × 2 topics)
-- Vocabulary Words Added: ~864 (6 avg per card × 144 cards)
-- Card-Vocabulary Relations: ~864
-- ============================================================

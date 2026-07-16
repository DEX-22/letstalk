-- ============================================================
-- Let's Talk — Seed Data
-- MVP: English conversation cards for 6 CEFR levels and 6 topics
-- ============================================================

-- 1. LANGUAGES
-- ============================================================

INSERT INTO languages (id, name, code, native_name) VALUES
  ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'English', 'en', 'English'),
  ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Spanish', 'es', 'Español'),
  ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'French', 'fr', 'Français'),
  ('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Portuguese', 'pt', 'Português')
ON CONFLICT (code) DO NOTHING;

-- 2. LEVELS (CEFR)
-- ============================================================

INSERT INTO levels (id, level, name, description, sort_order) VALUES
  ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a1', 'Beginner', 'Can understand and use familiar everyday expressions and very basic phrases.', 1),
  ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'a2', 'Elementary', 'Can understand sentences and frequently used expressions related to areas of most immediate relevance.', 2),
  ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'b1', 'Intermediate', 'Can deal with most situations likely to arise while travelling. Can describe experiences and events.', 3),
  ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'b2', 'Upper Intermediate', 'Can interact with a degree of fluency and spontaneity. Can produce clear, detailed text.', 4),
  ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'c1', 'Advanced', 'Can express ideas fluently and spontaneously without much obvious searching for expressions.', 5),
  ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'c2', 'Proficient', 'Can understand with ease virtually everything heard or read. Can summarize information.', 6)
ON CONFLICT (level) DO NOTHING;

-- 3. TOPICS
-- ============================================================

INSERT INTO topics (id, name, slug, description, icon) VALUES
  ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Travel', 'travel', 'Conversations about traveling, destinations, and cultural experiences', '✈️'),
  ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Food', 'food', 'Discussions about cooking, cuisine, restaurants, and eating habits', '🍽️'),
  ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Technology', 'technology', 'Talks about gadgets, software, internet, and digital life', '💻'),
  ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Movies', 'movies', 'Conversations about films, series, actors, and cinema experiences', '🎬'),
  ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Sports', 'sports', 'Discussions about sports, fitness, teams, and athletic events', '⚽'),
  ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Business', 'business', 'Talks about work, entrepreneurship, careers, and professional life', '💼')
ON CONFLICT (slug) DO NOTHING;

-- 4. CARDS AND VOCABULARY
-- ============================================================
-- English cards for 6 levels × 6 topics = 36 cards minimum
-- Each card has 2-4 vocabulary words

-- Level IDs reference
-- A1: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
-- A2: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12
-- B1: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13
-- B2: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14
-- C1: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15
-- C2: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16

-- Language ID
-- English: a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11

-- Topic IDs
-- Travel: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
-- Food: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12
-- Technology: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13
-- Movies: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14
-- Sports: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15
-- Business: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16

-- ============================================================
-- TOPIC: TRAVEL - English
-- ============================================================

-- A1 - Travel
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0001-4000-8000-000000000001', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is your favorite place to visit?',
    'Talk about a city or country you like. Say where it is and why you like it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'visit', 'To go to a place', 1),
  ((SELECT id FROM card), 'favorite', 'Liked the most', 2),
  ((SELECT id FROM card), 'city', 'A large town', 3);

-- A2 - Travel
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0002-4000-8000-000000000002', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Describe your last trip. Where did you go and what did you do?',
    'Talk about transportation, accommodation, and activities.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'trip', 'A journey to a place and back', 1),
  ((SELECT id FROM card), 'accommodation', 'A place to stay', 2),
  ((SELECT id FROM card), 'transportation', 'A way to travel from one place to another', 3);

-- B1 - Travel
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0003-4000-8000-000000000003', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What are the advantages and disadvantages of traveling alone versus traveling in a group?',
    'Compare both experiences and give examples from your own life.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'advantage', 'A benefit or positive aspect', 1),
  ((SELECT id FROM card), 'disadvantage', 'A downside or negative aspect', 2),
  ((SELECT id FROM card), 'alone', 'Without other people', 3);

-- B2 - Travel
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0004-4000-8000-000000000004', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How has technology changed the way people travel? Discuss both positive and negative impacts.',
    'Think about apps, online bookings, navigation, and social media.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'impact', 'The effect or influence of something', 1),
  ((SELECT id FROM card), 'navigation', 'Finding your way to a destination', 2),
  ((SELECT id FROM card), 'booking', 'Reserving a service in advance', 3),
  ((SELECT id FROM card), 'digital nomad', 'Someone who works remotely while traveling', 4);

-- C1 - Travel
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0005-4000-8000-000000000005', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What is your perspective on the concept of "overtourism"? How can destinations balance tourism with local community needs?',
    'Discuss sustainability, cultural preservation, and economic factors.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'overtourism', 'Excessive tourism that harms local communities', 1),
  ((SELECT id FROM card), 'sustainability', 'Avoiding depletion of natural resources', 2),
  ((SELECT id FROM card), 'preservation', 'Maintaining something in its original state', 3);

-- C2 - Travel
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0006-4000-8000-000000000006', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Analyze how globalization has transformed the travel industry. What will travel look like in 50 years?',
    'Consider geopolitical, environmental, and technological trends.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'globalization', 'The process of increasing interconnection between countries', 1),
  ((SELECT id FROM card), 'transformed', 'Completely changed', 2),
  ((SELECT id FROM card), 'geopolitical', 'Relating to politics and geography', 3);

-- ============================================================
-- TOPIC: FOOD - English
-- ============================================================

-- A1 - Food
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0011-4000-8000-000000000011', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is your favorite food? When do you usually eat it?',
    'Describe the taste and when you like to have this food.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'delicious', 'Very tasty', 1),
  ((SELECT id FROM card), 'breakfast', 'The first meal of the day', 2),
  ((SELECT id FROM card), 'recipe', 'Instructions for cooking a dish', 3);

-- A2 - Food
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0012-4000-8000-000000000012', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Can you describe how to prepare your favorite dish? What ingredients do you need?',
    'Give step-by-step instructions for a simple recipe.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'ingredient', 'An item used in cooking', 1),
  ((SELECT id FROM card), 'prepare', 'To make or get something ready', 2),
  ((SELECT id FROM card), 'boil', 'To cook in hot water', 3);

-- B1 - Food
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0013-4000-8000-000000000013', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How does food reflect a country''s culture? Compare the cuisine of two different countries.',
    'Think about ingredients, cooking methods, and eating traditions.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'cuisine', 'A style of cooking from a particular country', 1),
  ((SELECT id FROM card), 'tradition', 'A custom passed down through generations', 2),
  ((SELECT id FROM card), 'reflect', 'To show or represent something', 3);

-- B2 - Food
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0014-4000-8000-000000000014', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What is your opinion on the rise of plant-based diets? Are they a trend or a long-term shift?',
    'Discuss health, environmental, and ethical perspectives.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'plant-based', 'Consisting mainly of foods derived from plants', 1),
  ((SELECT id FROM card), 'trend', 'A general direction in which something is developing', 2),
  ((SELECT id FROM card), 'ethical', 'Relating to moral principles', 3);

-- C1 - Food
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0015-4000-8000-000000000015', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'Analyze the impact of fast food on global eating habits and public health. What solutions would you propose?',
    'Consider economic factors, marketing, and government regulation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'obesity', 'The condition of being overweight', 1),
  ((SELECT id FROM card), 'nutrition', 'The process of providing food for health and growth', 2),
  ((SELECT id FROM card), 'regulation', 'A rule enforced by an authority', 3);

-- C2 - Food
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0016-4000-8000-000000000016', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically evaluate the concept of "food sovereignty" and its implications for global trade policy.',
    'Discuss self-sufficiency, cultural identity, and international economics.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'sovereignty', 'The authority of a state to govern itself', 1),
  ((SELECT id FROM card), 'self-sufficiency', 'The ability to fulfill one''s own needs without external help', 2),
  ((SELECT id FROM card), 'commodity', 'A raw material or agricultural product that can be traded', 3);

-- ============================================================
-- TOPIC: TECHNOLOGY - English
-- ============================================================

-- A1 - Technology
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0021-4000-8000-000000000021', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What electronic devices do you use every day? How do you use them?',
    'Name 3 devices and explain what you do with each one.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'device', 'An electronic tool or machine', 1),
  ((SELECT id FROM card), 'smartphone', 'A mobile phone with advanced features', 2),
  ((SELECT id FROM card), 'keyboard', 'A set of keys for typing', 3);

-- A2 - Technology
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0022-4000-8000-000000000022', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you use the internet in your daily life? What websites do you visit most?',
    'Talk about social media, news, shopping, or learning.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'website', 'A page on the internet', 1),
  ((SELECT id FROM card), 'download', 'To transfer data to your device', 2),
  ((SELECT id FROM card), 'social media', 'Websites for social interaction', 3);

-- B1 - Technology
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0023-4000-8000-000000000023', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How has social media changed the way we communicate with each other?',
    'Compare communication before and after social media.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'privacy', 'The right to keep personal information secret', 1),
  ((SELECT id FROM card), 'connection', 'A relationship or link', 2),
  ((SELECT id FROM card), 'algorithm', 'A process or set of rules used by computers', 3);

-- B2 - Technology
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0024-4000-8000-000000000024', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the potential risks and benefits of artificial intelligence in everyday life?',
    'Think about jobs, healthcare, entertainment, and ethics.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'artificial intelligence', 'The simulation of human intelligence by computers', 1),
  ((SELECT id FROM card), 'automation', 'The use of machines to do work without human effort', 2),
  ((SELECT id FROM card), 'bias', 'Prejudice in favor or against one thing', 3);

-- C1 - Technology
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0025-4000-8000-000000000025', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'Discuss the ethical implications of data collection by technology companies. Where should we draw the line?',
    'Consider surveillance, targeted advertising, and user consent.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'surveillance', 'Close monitoring of behavior', 1),
  ((SELECT id FROM card), 'consent', 'Permission for something to happen', 2),
  ((SELECT id FROM card), 'exploitation', 'Taking advantage of something or someone', 3);

-- C2 - Technology
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0026-4000-8000-000000000026', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Evaluate the argument that technological progress inevitably leads to greater inequality. Do you agree?',
    'Discuss the digital divide, access to education, and economic displacement.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'inequality', 'An unequal distribution of resources or opportunities', 1),
  ((SELECT id FROM card), 'displacement', 'The forced movement of people from their jobs', 2),
  ((SELECT id FROM card), 'digital divide', 'The gap between those with and without technology access', 3);

-- ============================================================
-- TOPIC: MOVIES - English
-- ============================================================

-- A1 - Movies
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0031-4000-8000-000000000031', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is your favorite movie? Who is the main character?',
    'Describe the movie in 3 sentences.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'actor', 'A person who performs in movies', 1),
  ((SELECT id FROM card), 'character', 'A person in a story or movie', 2),
  ((SELECT id FROM card), 'scene', 'A part of a movie', 3);

-- A2 - Movies
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0032-4000-8000-000000000032', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Do you prefer watching movies at home or at the cinema? Why?',
    'Compare the two experiences and explain your preference.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'cinema', 'A place where movies are shown', 1),
  ((SELECT id FROM card), 'streaming', 'Watching video content online', 2),
  ((SELECT id FROM card), 'audience', 'The people watching a movie', 3);

-- B1 - Movies
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0033-4000-8000-000000000033', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What makes a movie good in your opinion? Give examples of movies you consider excellent.',
    'Think about plot, acting, directing, music, and visual effects.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'plot', 'The main story of a movie', 1),
  ((SELECT id FROM card), 'soundtrack', 'The music of a movie', 2),
  ((SELECT id FROM card), 'screenplay', 'The script written for a movie', 3);

-- B2 - Movies
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0034-4000-8000-000000000034', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How has the rise of streaming services like Netflix changed the movie industry?',
    'Discuss production, distribution, and viewing habits.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'distribution', 'The process of making movies available to audiences', 1),
  ((SELECT id FROM card), 'subscription', 'A regular payment for a service', 2),
  ((SELECT id FROM card), 'binge-watch', 'To watch multiple episodes in one sitting', 3);

-- C1 - Movies
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0035-4000-8000-000000000035', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'Analyze how cinema reflects and shapes societal values. Use specific examples from different decades.',
    'Consider representation, social issues, and cultural impact.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'representation', 'The depiction of people or groups in media', 1),
  ((SELECT id FROM card), 'censorship', 'The suppression of content considered harmful', 2),
  ((SELECT id FROM card), 'propaganda', 'Information used to influence public opinion', 3);

-- C2 - Movies
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0036-4000-8000-000000000036', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically assess the influence of Hollywood on global cinema. Is it cultural imperialism or cultural exchange?',
    'Discuss economic dominance, local film industries, and cultural identity.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'imperialism', 'Extending a country''s influence over others', 1),
  ((SELECT id FROM card), 'hegemony', 'Leadership or dominance by one group', 2),
  ((SELECT id FROM card), 'indigenous', 'Originating naturally in a particular place', 3);

-- ============================================================
-- TOPIC: SPORTS - English
-- ============================================================

-- A1 - Sports
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0041-4000-8000-000000000041', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What sports do you like? Do you prefer playing or watching?',
    'Name 2 sports and say why you like them.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'team', 'A group of players', 1),
  ((SELECT id FROM card), 'score', 'To get points in a game', 2),
  ((SELECT id FROM card), 'player', 'A person who plays a sport', 3);

-- A2 - Sports
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0042-4000-8000-000000000042', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How often do you exercise? What activities do you do to stay fit?',
    'Describe your weekly exercise routine.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'exercise', 'Physical activity for fitness', 1),
  ((SELECT id FROM card), 'routine', 'A regular set of activities', 2),
  ((SELECT id FROM card), 'gym', 'A place with exercise equipment', 3);

-- B1 - Sports
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0043-4000-8000-000000000043', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What are the benefits of playing team sports compared to individual sports?',
    'Think about social skills, motivation, and personal growth.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'cooperation', 'Working together toward a common goal', 1),
  ((SELECT id FROM card), 'competition', 'A contest between individuals or teams', 2),
  ((SELECT id FROM card), 'discipline', 'The practice of training to follow rules', 3);

-- B2 - Sports
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0044-4000-8000-000000000044', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'Should professional athletes be considered role models? Why or why not?',
    'Discuss their influence on young people and society.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'role model', 'A person looked up to by others', 1),
  ((SELECT id FROM card), 'endorsement', 'Public support or promotion of a product', 2),
  ((SELECT id FROM card), 'integrity', 'The quality of being honest and moral', 3);

-- C1 - Sports
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0045-4000-8000-000000000045', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'Analyze the relationship between money and modern sports. Has commercialization improved or damaged sports?',
    'Consider sponsorship, ticket prices, athlete salaries, and accessibility.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'commercialization', 'The process of managing something for profit', 1),
  ((SELECT id FROM card), 'sponsorship', 'Financial support from a company', 2),
  ((SELECT id FROM card), 'merchandising', 'The sale of branded products', 3);

-- C2 - Sports
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0046-4000-8000-000000000046', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically evaluate the use of performance-enhancing drugs in sports. How should governing bodies address this issue?',
    'Discuss health risks, fairness, and enforcement challenges.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'doping', 'The use of prohibited substances in sports', 1),
  ((SELECT id FROM card), 'sanction', 'A penalty for breaking rules', 2),
  ((SELECT id FROM card), 'pharmacology', 'The study of drugs and their effects', 3);

-- ============================================================
-- TOPIC: BUSINESS - English
-- ============================================================

-- A1 - Business
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0051-4000-8000-000000000051', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is your job? What do you do every day at work?',
    'Describe your daily work activities in 3 sentences.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'colleague', 'A person you work with', 1),
  ((SELECT id FROM card), 'office', 'A room or building where people work', 2),
  ((SELECT id FROM card), 'meeting', 'A gathering of people for discussion', 3);

-- A2 - Business
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0052-4000-8000-000000000052', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Would you prefer to work from home or in an office? What are the pros and cons?',
    'Compare both work environments.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'remote', 'Working from a location away from the office', 1),
  ((SELECT id FROM card), 'schedule', 'A plan of what to do and when', 2),
  ((SELECT id FROM card), 'deadline', 'A time by which something must be completed', 3);

-- B1 - Business
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0053-4000-8000-000000000053', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What qualities make a good leader? Give examples from your experience.',
    'Think about communication, decision-making, and empathy.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'leadership', 'The action of leading a group', 1),
  ((SELECT id FROM card), 'motivation', 'The desire to do something', 2),
  ((SELECT id FROM card), 'initiative', 'The ability to act without being told', 3);

-- B2 - Business
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0054-4000-8000-000000000054', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How has remote work transformed company culture and productivity? What are the long-term implications?',
    'Discuss work-life balance, communication tools, and team cohesion.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'productivity', 'The efficiency of production', 1),
  ((SELECT id FROM card), 'collaboration', 'Working jointly with others', 2),
  ((SELECT id FROM card), 'work-life balance', 'The balance between work and personal life', 3);

-- C1 - Business
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0055-4000-8000-000000000055', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'Analyze the impact of startups on traditional industries. Are they driving innovation or creating instability?',
    'Consider disruption, job creation, and market dynamics.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'startup', 'A newly established business', 1),
  ((SELECT id FROM card), 'disruption', 'Radical change to an industry', 2),
  ((SELECT id FROM card), 'innovation', 'A new method or product', 3);

-- C2 - Business
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0056-4000-8000-000000000056', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically evaluate the concept of "conscious capitalism." Can businesses truly be both profitable and ethical?',
    'Discuss corporate social responsibility, stakeholder theory, and long-term value.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'stakeholder', 'A person with an interest in a business', 1),
  ((SELECT id FROM card), 'transparency', 'Openness and honesty in business practices', 2),
  ((SELECT id FROM card), 'accountability', 'The responsibility for one''s actions', 3);
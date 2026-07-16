-- ============================================================
-- Let's Talk — Extended Seed Data
-- ============================================================
-- This file EXTENDS db/seed.sql with additional high-quality
-- English conversation cards for the MVP.
--
-- It does NOT modify existing records — only appends new ones.
--
-- Run AFTER db/seed.sql has been executed:
--   psql -f db/seed.sql
--   psql -f db/seed-extension.sql
--
-- All foreign keys reference the same languages, levels, and
-- topics seeded in db/seed.sql.
-- ============================================================

-- ============================================================
-- ID REFERENCE (from db/seed.sql)
-- ============================================================
--
-- Languages:
--   English: a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
--   Spanish: b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12
--   French:  c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13
--   Portuguese: d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14
--
-- Levels (CEFR):
--   A1: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
--   A2: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12
--   B1: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13
--   B2: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14
--   C1: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15
--   C2: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16
--
-- Topics:
--   Travel:    f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
--   Food:      f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12
--   Technology: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13
--   Movies:    f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14
--   Sports:    f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15
--   Business:  f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16
-- ============================================================

-- ============================================================
-- UUID SCHEME FOR NEW CARDS
-- ============================================================
-- Format: 2{tt}{ll}{cc_hh}-0000-4000-8000-00{tt}{ll}00{cc_hh}00
--   tt = topic number (01-06)
--   ll = level number (01-06)
--   cc_hh = card number in hex (01-0c)
--
-- Examples:
--   Travel (01), A1 (01), card 1 (01):  20101001-0000-4000-8000-000101000100
--   Travel (01), A1 (01), card 12 (0c): 2010100c-0000-4000-8000-000101000c00
--   Business (06), C2 (06), card 12 (0c): 2060600c-0000-4000-8000-000606000c00
-- ============================================================

-- ============================================================
-- TOPIC: TRAVEL (01)
-- ============================================================

-- -----------------------------------------------------------
-- TRAVEL — A1 (level 01)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20101001-0000-4000-8000-000101000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'How do you usually travel to school or work?',
    'Talk about the transport you use every day. Say how long it takes.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'bus', 'A large vehicle that carries passengers', 1),
  ((SELECT id FROM card), 'train', 'A vehicle that runs on tracks', 2),
  ((SELECT id FROM card), 'bicycle', 'A vehicle with two wheels that you pedal', 3),
  ((SELECT id FROM card), 'walk', 'To move on foot', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20101002-0000-4000-8000-000101000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What do you pack in your bag when you go on a trip?',
    'List the things you take with you. Explain why each item is important.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'suitcase', 'A large bag for clothes on a trip', 1),
  ((SELECT id FROM card), 'passport', 'A document for travel to other countries', 2),
  ((SELECT id FROM card), 'ticket', 'A piece of paper that lets you travel', 3),
  ((SELECT id FROM card), 'map', 'A drawing of a place that shows streets', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20101003-0000-4000-8000-000101000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Where do you like to go on vacation? Why do you like that place?',
    'Describe your favorite vacation place and what you do there.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'beach', 'A sandy place by the ocean', 1),
  ((SELECT id FROM card), 'mountain', 'A very high hill', 2),
  ((SELECT id FROM card), 'hotel', 'A place where you sleep when traveling', 3),
  ((SELECT id FROM card), 'weather', 'The temperature and conditions outside', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20101004-0000-4000-8000-000101000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What can you see in an airport? Describe the places and people.',
    'Think about the different areas in an airport and what happens there.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'airport', 'A place where planes take off and land', 1),
  ((SELECT id FROM card), 'pilot', 'A person who flies a plane', 2),
  ((SELECT id FROM card), 'luggage', 'The bags you carry on a trip', 3),
  ((SELECT id FROM card), 'boarding pass', 'A card that lets you get on a plane', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20101005-0000-4000-8000-000101000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is your favorite season to travel? Why do you prefer that season?',
    'Talk about the weather and activities you can do in that season.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'summer', 'The warmest season of the year', 1),
  ((SELECT id FROM card), 'winter', 'The coldest season of the year', 2),
  ((SELECT id FROM card), 'spring', 'The season after winter when flowers bloom', 3),
  ((SELECT id FROM card), 'autumn', 'The season between summer and winter', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20101006-0000-4000-8000-000101000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Who do you like to travel with? What do you do together?',
    'Talk about traveling with family or friends and your favorite activities.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'family', 'A group of related people', 1),
  ((SELECT id FROM card), 'friend', 'A person you like and know well', 2),
  ((SELECT id FROM card), 'together', 'With each other', 3),
  ((SELECT id FROM card), 'photo', 'A picture taken with a camera', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20101007-0000-4000-8000-000101000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What do you like to eat when you travel? What is your favorite travel food?',
    'Describe the food you enjoy on trips and where you buy it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'snack', 'A small amount of food eaten between meals', 1),
  ((SELECT id FROM card), 'restaurant', 'A place where you buy and eat meals', 2),
  ((SELECT id FROM card), 'menu', 'A list of food and drinks you can order', 3),
  ((SELECT id FROM card), 'thirsty', 'Needing to drink something', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20101008-0000-4000-8000-000101000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What colors and flags do you see when you travel to different countries?',
    'Remember the flags of countries you know and describe their colors.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'flag', 'A piece of cloth with colors and symbols for a country', 1),
  ((SELECT id FROM card), 'country', 'A nation with its own government', 2),
  ((SELECT id FROM card), 'language', 'The words people use to communicate', 3),
  ((SELECT id FROM card), 'culture', 'The traditions and customs of a group', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20101009-0000-4000-8000-000101000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'How do you say hello and goodbye in different countries you know?',
    'Talk about common greetings you use when traveling.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'hello', 'A word used to greet someone', 1),
  ((SELECT id FROM card), 'goodbye', 'A word used when leaving', 2),
  ((SELECT id FROM card), 'please', 'A polite word when asking for something', 3),
  ((SELECT id FROM card), 'thank you', 'A polite expression of gratitude', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010100a-0000-4000-8000-000101000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What animals can you see on a trip to the beach or the mountains?',
    'Name some animals and describe where you can find them.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'fish', 'An animal that lives in water', 1),
  ((SELECT id FROM card), 'bird', 'An animal with wings that can fly', 2),
  ((SELECT id FROM card), 'tree', 'A tall plant with leaves and branches', 3),
  ((SELECT id FROM card), 'flower', 'The colorful part of a plant', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010100b-0000-4000-8000-000101000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What do you do on a rainy day when you are on vacation?',
    'Describe indoor activities you enjoy during bad weather.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'rain', 'Water that falls from the sky', 1),
  ((SELECT id FROM card), 'umbrella', 'An object that protects you from rain', 2),
  ((SELECT id FROM card), 'museum', 'A building where you can see art or history items', 3),
  ((SELECT id FROM card), 'shop', 'A place where you can buy things', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010100c-0000-4000-8000-000101000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'How do you ask for directions when you are lost in a new place?',
    'Talk about the words you use to find your way.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'left', 'The opposite of right', 1),
  ((SELECT id FROM card), 'right', 'The opposite of left', 2),
  ((SELECT id FROM card), 'straight', 'Without turning', 3),
  ((SELECT id FROM card), 'lost', 'Not knowing where you are', 4);

-- -----------------------------------------------------------
-- TRAVEL — A2 (level 02)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20102001-0000-4000-8000-000102000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What kind of accommodation do you prefer when you travel? Why?',
    'Compare hotels, hostels, and apartments. Say which you like best.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'hostel', 'A low-cost place to stay with shared rooms', 1),
  ((SELECT id FROM card), 'apartment', 'A rented room or set of rooms to live in', 2),
  ((SELECT id FROM card), 'reservation', 'An arrangement to have something kept for you', 3),
  ((SELECT id FROM card), 'check-in', 'The process of arriving and registering at a hotel', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20102002-0000-4000-8000-000102000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you plan a weekend trip? What steps do you follow?',
    'Describe how you choose a destination, book transport, and decide what to do.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'destination', 'The place you are going to', 1),
  ((SELECT id FROM card), 'book', 'To arrange and pay for something in advance', 2),
  ((SELECT id FROM card), 'itinerary', 'A plan of things to do on a trip', 3),
  ((SELECT id FROM card), 'departure', 'The time when a trip begins', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20102003-0000-4000-8000-000102000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What souvenirs do you like to buy when you visit a new place?',
    'Talk about the things you collect or bring back for friends and family.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'souvenir', 'A small item you buy to remember a place', 1),
  ((SELECT id FROM card), 'postcard', 'A card you send to friends from a trip', 2),
  ((SELECT id FROM card), 'gift', 'Something you give to someone', 3),
  ((SELECT id FROM card), 'market', 'An outdoor place where people sell things', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20102004-0000-4000-8000-000102000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What activities do you like to do at the beach?',
    'Describe water sports, games, and relaxing activities.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'swim', 'To move through water using your arms and legs', 1),
  ((SELECT id FROM card), 'sunbathe', 'To lie in the sun to get a tan', 2),
  ((SELECT id FROM card), 'surf', 'To ride on waves using a board', 3),
  ((SELECT id FROM card), 'sand', 'Tiny pieces of rock found at the beach', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20102005-0000-4000-8000-000102000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is the most interesting city you have visited? What did you see there?',
    'Talk about famous landmarks, neighborhoods, and things to do.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'landmark', 'A famous building or place that is easy to see', 1),
  ((SELECT id FROM card), 'downtown', 'The central area of a city', 2),
  ((SELECT id FROM card), 'tourist', 'A person who visits a place for vacation', 3),
  ((SELECT id FROM card), 'sightseeing', 'Visiting interesting places as a tourist', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20102006-0000-4000-8000-000102000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you stay in touch with your family when you are traveling?',
    'Talk about phone calls, messages, and social media while away.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'telephone', 'A device used to talk to people far away', 1),
  ((SELECT id FROM card), 'message', 'A written communication sent to someone', 2),
  ((SELECT id FROM card), 'internet', 'A global network connecting computers', 3),
  ((SELECT id FROM card), 'roaming', 'Using your phone abroad with extra charges', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20102007-0000-4000-8000-000102000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What do you need to prepare before traveling to another country?',
    'Think about documents, money, health, and packing.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'visa', 'An official document that lets you enter a country', 1),
  ((SELECT id FROM card), 'currency', 'The money used in a particular country', 2),
  ((SELECT id FROM card), 'insurance', 'An agreement to pay for accidents or problems', 3),
  ((SELECT id FROM card), 'vaccination', 'A medical injection to prevent disease', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20102008-0000-4000-8000-000102000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is a typical food from your country that tourists should try?',
    'Describe the dish, its ingredients, and why visitors love it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'typical', 'Something that is common or expected in a place', 1),
  ((SELECT id FROM card), 'dish', 'A type of food prepared in a particular way', 2),
  ((SELECT id FROM card), 'spicy', 'Having a strong hot flavor', 3),
  ((SELECT id FROM card), 'sweet', 'Tasting like sugar', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20102009-0000-4000-8000-000102000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What do you like to do during a long car journey?',
    'Talk about games, music, and activities to pass the time.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'journey', 'The act of traveling from one place to another', 1),
  ((SELECT id FROM card), 'passenger', 'A person traveling in a vehicle', 2),
  ((SELECT id FROM card), 'highway', 'A main road for fast travel between cities', 3),
  ((SELECT id FROM card), 'rest stop', 'A place to rest during a long drive', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010200a-0000-4000-8000-000102000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you choose where to eat when you visit a new town?',
    'Think about recommendations, reviews, and looking at menus.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'recommendation', 'A suggestion that something is good', 1),
  ((SELECT id FROM card), 'review', 'An opinion about something you tried', 2),
  ((SELECT id FROM card), 'local', 'Relating to a particular area or place', 3),
  ((SELECT id FROM card), 'cuisine', 'A style of cooking from a particular region', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010200b-0000-4000-8000-000102000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What means of transport do you use to travel around a city?',
    'Compare taxis, buses, subways, and walking in different cities.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'subway', 'An underground train system in a city', 1),
  ((SELECT id FROM card), 'taxi', 'A car that you pay to take you somewhere', 2),
  ((SELECT id FROM card), 'fare', 'The money you pay for a journey', 3),
  ((SELECT id FROM card), 'schedule', 'A list of times when transport leaves', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010200c-0000-4000-8000-000102000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is the best way to learn about the culture of a country you visit?',
    'Think about museums, food, talking to locals, and festivals.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'festival', 'A special event with music, food, or traditions', 1),
  ((SELECT id FROM card), 'tradition', 'A custom or belief passed down over time', 2),
  ((SELECT id FROM card), 'guide', 'A person who shows tourists around a place', 3),
  ((SELECT id FROM card), 'custom', 'A traditional practice of a group of people', 4);

-- -----------------------------------------------------------
-- TRAVEL — B1 (level 03)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20103001-0000-4000-8000-000103000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What factors do you consider when choosing a travel destination?',
    'Discuss budget, climate, safety, culture, and activities.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'budget', 'The amount of money available for something', 1),
  ((SELECT id FROM card), 'climate', 'The typical weather conditions of a region', 2),
  ((SELECT id FROM card), 'destination', 'The place to which someone is going', 3),
  ((SELECT id FROM card), 'experience', 'An event or activity that affects you', 4),
  ((SELECT id FROM card), 'recommend', 'To suggest something as good or suitable', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20103002-0000-4000-8000-000103000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How has traveling changed your perspective on life?',
    'Reflect on how visiting different places has influenced your views.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'perspective', 'A particular way of viewing things', 1),
  ((SELECT id FROM card), 'influence', 'The effect something has on a person', 2),
  ((SELECT id FROM card), 'broaden', 'To expand or make wider', 3),
  ((SELECT id FROM card), 'appreciate', 'To recognize the value of something', 4),
  ((SELECT id FROM card), 'adapt', 'To adjust to new conditions', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20103003-0000-4000-8000-000103000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What are the most important items to pack for a trip abroad?',
    'Consider clothing, documents, electronics, and health items.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'pack', 'To put items into a bag for a trip', 1),
  ((SELECT id FROM card), 'adaptor', 'A device for connecting plugs to foreign sockets', 2),
  ((SELECT id FROM card), 'medication', 'Medicine for treating illness', 3),
  ((SELECT id FROM card), 'essential', 'Absolutely necessary', 4),
  ((SELECT id FROM card), 'valuable', 'Something worth a lot of money', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20103004-0000-4000-8000-000103000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What are the pros and cons of guided tours versus independent travel?',
    'Compare freedom, cost, learning opportunities, and convenience.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'guided tour', 'A trip led by someone who explains the sights', 1),
  ((SELECT id FROM card), 'independent', 'Not relying on others', 2),
  ((SELECT id FROM card), 'flexibility', 'The ability to change plans easily', 3),
  ((SELECT id FROM card), 'convenient', 'Easy and suitable for a purpose', 4),
  ((SELECT id FROM card), 'arrangement', 'A plan or preparation made in advance', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20103005-0000-4000-8000-000103000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What challenges have you faced while traveling and how did you solve them?',
    'Talk about language barriers, getting lost, or unexpected problems.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'challenge', 'A difficult task or problem', 1),
  ((SELECT id FROM card), 'barrier', 'Something that prevents communication or movement', 2),
  ((SELECT id FROM card), 'unexpected', 'Surprising because it was not planned', 3),
  ((SELECT id FROM card), 'delayed', 'Happening later than planned', 4),
  ((SELECT id FROM card), 'emergency', 'A serious situation needing immediate action', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20103006-0000-4000-8000-000103000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is the difference between being a tourist and being a traveler?',
    'Discuss depth of experience, local interaction, and personal growth.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'tourist', 'A person visiting a place for pleasure', 1),
  ((SELECT id FROM card), 'traveler', 'Someone who makes long journeys', 2),
  ((SELECT id FROM card), 'explore', 'To travel through an area to learn about it', 3),
  ((SELECT id FROM card), 'immerse', 'To involve yourself deeply in something', 4),
  ((SELECT id FROM card), 'authentic', 'Real and genuine', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20103007-0000-4000-8000-000103000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you manage your money when traveling to a foreign country?',
    'Think about exchange rates, fees, cash versus cards, and budgeting.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'exchange rate', 'The value of one currency compared to another', 1),
  ((SELECT id FROM card), 'fee', 'A payment for a service', 2),
  ((SELECT id FROM card), 'budget', 'An estimate of income and spending', 3),
  ((SELECT id FROM card), 'withdraw', 'To take money out of a bank account', 4),
  ((SELECT id FROM card), 'transaction', 'An instance of buying or paying', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20103008-0000-4000-8000-000103000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What cultural differences have you noticed when traveling to other countries?',
    'Discuss greetings, food habits, tipping, and personal space.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'custom', 'A traditional practice of a particular group', 1),
  ((SELECT id FROM card), 'tipping', 'Giving extra money for a service', 2),
  ((SELECT id FROM card), 'etiquette', 'The accepted rules of polite behavior', 3),
  ((SELECT id FROM card), 'gesture', 'A movement of the body to express something', 4),
  ((SELECT id FROM card), 'cultural shock', 'Confusion when experiencing a different culture', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20103009-0000-4000-8000-000103000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is your most memorable travel experience and why does it stand out?',
    'Describe a specific moment from a trip that you will never forget.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'memorable', 'Worth remembering or easy to remember', 1),
  ((SELECT id FROM card), 'moment', 'A very short period of time', 2),
  ((SELECT id FROM card), 'sunset', 'The time when the sun goes down', 3),
  ((SELECT id FROM card), 'adventure', 'An exciting or unusual experience', 4),
  ((SELECT id FROM card), 'view', 'A sight from a particular place', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010300a-0000-4000-8000-000103000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How does social media affect the way people travel and share experiences?',
    'Discuss inspiration, photo-taking, check-ins, and comparing experiences.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'influence', 'The capacity to have an effect on someone', 1),
  ((SELECT id FROM card), 'check-in', 'To announce your arrival at a place online', 2),
  ((SELECT id FROM card), 'hashtag', 'A word preceded by # used to categorize posts', 3),
  ((SELECT id FROM card), 'influencer', 'A person who affects others through social media', 4),
  ((SELECT id FROM card), 'highlight', 'The best or most memorable part', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010300b-0000-4000-8000-000103000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'Would you prefer to visit a place you have seen in a movie? Why?',
    'Talk about how movies inspire travel and if reality matches expectations.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'inspire', 'To motivate someone to do something', 1),
  ((SELECT id FROM card), 'expectation', 'A belief about what will happen', 2),
  ((SELECT id FROM card), 'scenery', 'The natural features of a landscape', 3),
  ((SELECT id FROM card), 'filming location', 'A place where a movie was recorded', 4),
  ((SELECT id FROM card), 'recognize', 'To identify something you have seen before', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010300c-0000-4000-8000-000103000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What are the benefits of learning a new language before traveling?',
    'Discuss communication, connecting with locals, and deeper experiences.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'phrase', 'A small group of words used together', 1),
  ((SELECT id FROM card), 'communicate', 'To share information with others', 2),
  ((SELECT id FROM card), 'translate', 'To convert words from one language to another', 3),
  ((SELECT id FROM card), 'dialogue', 'A conversation between two or more people', 4),
  ((SELECT id FROM card), 'fluent', 'Able to speak a language easily and accurately', 5);

-- -----------------------------------------------------------
-- TRAVEL — B2 (level 04)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20104001-0000-4000-8000-000104000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the environmental impacts of the tourism industry and how can travelers reduce their footprint?',
    'Discuss carbon emissions, waste, overdevelopment, and sustainable choices.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'footprint', 'The environmental impact of an activity', 1),
  ((SELECT id FROM card), 'sustainable', 'Causing little or no damage to the environment', 2),
  ((SELECT id FROM card), 'carbon emission', 'Carbon dioxide released into the atmosphere', 3),
  ((SELECT id FROM card), 'ecotourism', 'Responsible travel to natural areas', 4),
  ((SELECT id FROM card), 'overdevelopment', 'Too much building in an area', 5),
  ((SELECT id FROM card), 'conservation', 'Protection of the environment', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20104002-0000-4000-8000-000104000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How has the rise of budget airlines transformed the way people travel?',
    'Consider accessibility, frequency, hidden costs, and environmental concerns.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'budget airline', 'A low-cost air travel company', 1),
  ((SELECT id FROM card), 'accessible', 'Easy to reach or use', 2),
  ((SELECT id FROM card), 'layover', 'A short stay between parts of a journey', 3),
  ((SELECT id FROM card), 'route', 'A way or path taken to get somewhere', 4),
  ((SELECT id FROM card), 'terminal', 'A building at an airport for passengers', 5),
  ((SELECT id FROM card), 'cancellation', 'The act of calling off a planned trip', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20104003-0000-4000-8000-000104000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the challenges of backpacking through multiple countries?',
    'Talk about logistics, budgeting, safety, and long-term travel fatigue.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'backpacking', 'Traveling with a backpack, usually on a budget', 1),
  ((SELECT id FROM card), 'logistics', 'The detailed organization of a trip', 2),
  ((SELECT id FROM card), 'fatigue', 'Extreme tiredness from travel', 3),
  ((SELECT id FROM card), 'hostel', 'A budget accommodation with shared rooms', 4),
  ((SELECT id FROM card), 'overland', 'Traveling across land rather than by air', 5),
  ((SELECT id FROM card), 'border crossing', 'Moving from one country to another', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20104004-0000-4000-8000-000104000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How does traveling solo compare to traveling with others in terms of personal growth?',
    'Discuss independence, decision-making, social skills, and self-discovery.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'solo', 'Done alone without companions', 1),
  ((SELECT id FROM card), 'self-discovery', 'The process of learning about yourself', 2),
  ((SELECT id FROM card), 'independence', 'Freedom from control by others', 3),
  ((SELECT id FROM card), 'confidence', 'Belief in your own abilities', 4),
  ((SELECT id FROM card), 'resourceful', 'Able to solve problems creatively', 5),
  ((SELECT id FROM card), 'mindset', 'A set of attitudes or beliefs', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20104005-0000-4000-8000-000104000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What role does travel insurance play in protecting against unexpected events?',
    'Think about medical emergencies, lost luggage, trip cancellations, and coverage.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'insurance', 'Financial protection against loss or damage', 1),
  ((SELECT id FROM card), 'coverage', 'The extent of protection provided', 2),
  ((SELECT id FROM card), 'liability', 'Legal responsibility for something', 3),
  ((SELECT id FROM card), 'claim', 'A request for payment from insurance', 4),
  ((SELECT id FROM card), 'reimbursement', 'Repayment for money spent', 5),
  ((SELECT id FROM card), 'deductible', 'The amount you pay before insurance covers the rest', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20104006-0000-4000-8000-000104000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'In what ways has the sharing economy, like Airbnb, changed the travel experience?',
    'Discuss accommodation options, local experiences, pricing, and regulations.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'sharing economy', 'A system where people share access to goods and services', 1),
  ((SELECT id FROM card), 'platform', 'An online service that connects people', 2),
  ((SELECT id FROM card), 'host', 'A person who welcomes guests into their home', 3),
  ((SELECT id FROM card), 'listing', 'An advertisement for a rental property', 4),
  ((SELECT id FROM card), 'regulation', 'A rule enforced by an authority', 5),
  ((SELECT id FROM card), 'hospitality', 'The friendly and generous treatment of guests', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20104007-0000-4000-8000-000104000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do you deal with language barriers when visiting a country where you do not speak the language?',
    'Share strategies like translation apps, gestures, learning key phrases, and patience.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'language barrier', 'Difficulty communicating due to different languages', 1),
  ((SELECT id FROM card), 'gesture', 'A movement that communicates a feeling', 2),
  ((SELECT id FROM card), 'translation', 'Converting words from one language to another', 3),
  ((SELECT id FROM card), 'interpreter', 'A person who translates speech in real time', 4),
  ((SELECT id FROM card), 'misunderstanding', 'A failure to understand correctly', 5),
  ((SELECT id FROM card), 'patience', 'The ability to wait calmly', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20104008-0000-4000-8000-000104000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What is your opinion on all-inclusive resorts versus exploring on your own?',
    'Compare convenience, value, cultural immersion, and variety.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'all-inclusive', 'Including everything in one price', 1),
  ((SELECT id FROM card), 'resort', 'A hotel with many facilities and activities', 2),
  ((SELECT id FROM card), 'immersion', 'Deep involvement in an environment', 3),
  ((SELECT id FROM card), 'convenience', 'The quality of being easy and suitable', 4),
  ((SELECT id FROM card), 'excursion', 'A short trip for a particular purpose', 5),
  ((SELECT id FROM card), 'package deal', 'A combination of services sold together', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20104009-0000-4000-8000-000104000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do different cultures approach the concept of personal space in public places?',
    'Compare crowded cities versus rural areas and various cultural norms.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'personal space', 'The physical distance people keep between themselves', 1),
  ((SELECT id FROM card), 'norm', 'A standard or typical behavior in a society', 2),
  ((SELECT id FROM card), 'crowded', 'Filled with many people', 3),
  ((SELECT id FROM card), 'rural', 'Relating to the countryside', 4),
  ((SELECT id FROM card), 'urban', 'Relating to a city', 5),
  ((SELECT id FROM card), 'intrusive', 'Causing disruption by being too noticeable', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010400a-0000-4000-8000-000104000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the most effective ways to meet locals while traveling abroad?',
    'Discuss staying in local neighborhoods, taking classes, volunteering, and using apps.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'local', 'A person from a particular area', 1),
  ((SELECT id FROM card), 'volunteer', 'To offer to do something without payment', 2),
  ((SELECT id FROM card), 'neighborhood', 'A district within a city or town', 3),
  ((SELECT id FROM card), 'interact', 'To communicate or engage with others', 4),
  ((SELECT id FROM card), 'community', 'A group of people living in the same place', 5),
  ((SELECT id FROM card), 'hospitality exchange', 'A network where travelers stay with locals for free', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010400b-0000-4000-8000-000104000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How does digital technology help travelers navigate unfamiliar environments?',
    'Consider maps, translation apps, review sites, and travel planning tools.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'navigation', 'The process of finding your way', 1),
  ((SELECT id FROM card), 'GPS', 'A system for finding your location', 2),
  ((SELECT id FROM card), 'offline', 'Not connected to the internet', 3),
  ((SELECT id FROM card), 'download', 'To copy data from the internet to your device', 4),
  ((SELECT id FROM card), 'itinerary', 'A detailed plan for a journey', 5),
  ((SELECT id FROM card), 'roaming', 'Using mobile data while abroad', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010400c-0000-4000-8000-000104000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What ethical considerations should travelers keep in mind when visiting developing countries?',
    'Discuss photography, bargaining, volunteering, and supporting local economies.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'ethical', 'Involving moral principles', 1),
  ((SELECT id FROM card), 'exploitation', 'Taking unfair advantage of others', 2),
  ((SELECT id FROM card), 'bargaining', 'Negotiating the price of something', 3),
  ((SELECT id FROM card), 'donation', 'Something given to help a person or cause', 4),
  ((SELECT id FROM card), 'respectful', 'Showing consideration for others', 5),
  ((SELECT id FROM card), 'privilege', 'A special advantage not everyone has', 6);

-- -----------------------------------------------------------
-- TRAVEL — C1 (level 05)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20105001-0000-4000-8000-000105000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How might climate change reshape global tourism patterns over the next few decades?',
    'Discuss rising sea levels, extreme weather, changing seasons, and adaptation strategies.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'climate change', 'Long-term shifts in global weather patterns', 1),
  ((SELECT id FROM card), 'displacement', 'The forced movement of people from their homes', 2),
  ((SELECT id FROM card), 'mitigation', 'Reducing the severity of something', 3),
  ((SELECT id FROM card), 'adaptation', 'Adjusting to new conditions', 4),
  ((SELECT id FROM card), 'seasonality', 'Variation according to the time of year', 5),
  ((SELECT id FROM card), 'resilience', 'The ability to recover from difficulties', 6),
  ((SELECT id FROM card), 'carbon offset', 'A payment to compensate for carbon emissions', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20105002-0000-4000-8000-000105000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What are the geopolitical implications of passport strength and visa restrictions?',
    'Discuss mobility inequality, diplomacy, economic impact, and security concerns.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'geopolitical', 'Relating to politics and geography on a global scale', 1),
  ((SELECT id FROM card), 'mobility', 'The ability to move freely between countries', 2),
  ((SELECT id FROM card), 'visa restriction', 'A limitation on entering a foreign country', 3),
  ((SELECT id FROM card), 'diplomacy', 'The management of international relations', 4),
  ((SELECT id FROM card), 'inequality', 'An unfair situation where some have more than others', 5),
  ((SELECT id FROM card), 'reciprocal', 'Given or done in return', 6),
  ((SELECT id FROM card), 'sanction', 'A penalty imposed on a country', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20105003-0000-4000-8000-000105000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'In what ways does cultural heritage tourism both preserve and commodify local traditions?',
    'Analyze the tension between authentic cultural expression and commercial tourism.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'heritage', 'Cultural traditions and history passed down', 1),
  ((SELECT id FROM card), 'commodify', 'To turn something into a product for sale', 2),
  ((SELECT id FROM card), 'authenticity', 'The quality of being genuine', 3),
  ((SELECT id FROM card), 'folkloric', 'Relating to traditional stories and customs', 4),
  ((SELECT id FROM card), 'commercialization', 'Managing something primarily for profit', 5),
  ((SELECT id FROM card), 'indigenous', 'Originating naturally in a particular place', 6),
  ((SELECT id FROM card), 'intangible', 'Not physical, but still valuable and real', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20105004-0000-4000-8000-000105000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How has the concept of luxury travel evolved in the 21st century?',
    'Discuss experiential luxury, privacy, exclusivity, and personalized services.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'luxury', 'A state of great comfort and elegance', 1),
  ((SELECT id FROM card), 'exclusivity', 'The quality of being limited to a select group', 2),
  ((SELECT id FROM card), 'bespoke', 'Made to order for a specific client', 3),
  ((SELECT id FROM card), 'concierge', 'A hotel employee who assists guests', 4),
  ((SELECT id FROM card), 'curated', 'Carefully selected and organized', 5),
  ((SELECT id FROM card), 'personalization', 'Tailoring something to individual needs', 6),
  ((SELECT id FROM card), 'discerning', 'Having good judgment and taste', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20105005-0000-4000-8000-000105000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What measures could governments implement to prevent overtourism at popular destinations?',
    'Evaluate permits, pricing strategies, visitor caps, and promotion of alternative destinations.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'overtourism', 'Excessive tourism that damages a destination', 1),
  ((SELECT id FROM card), 'quota', 'A limited quantity of something', 2),
  ((SELECT id FROM card), 'levy', 'A tax or fee imposed by authorities', 3),
  ((SELECT id FROM card), 'infrastructure', 'The basic facilities and systems of a place', 4),
  ((SELECT id FROM card), 'deterioration', 'The process of becoming progressively worse', 5),
  ((SELECT id FROM card), 'stakeholder', 'A person with an interest in something', 6),
  ((SELECT id FROM card), 'saturation', 'The state of being filled completely', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20105006-0000-4000-8000-000105000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does diaspora travel differ from conventional tourism in terms of emotional and cultural significance?',
    'Explore identity, belonging, heritage connections, and return visits.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'diaspora', 'People who have moved away from their homeland', 1),
  ((SELECT id FROM card), 'nostalgia', 'A sentimental longing for the past', 2),
  ((SELECT id FROM card), 'belonging', 'The feeling of being accepted in a group', 3),
  ((SELECT id FROM card), 'reconnection', 'Restoring a relationship or link', 4),
  ((SELECT id FROM card), 'ancestral', 'Relating to one''s ancestors', 5),
  ((SELECT id FROM card), 'heritage tourism', 'Travel focused on cultural and historical roots', 6),
  ((SELECT id FROM card), 'repatriation', 'Returning to one''s own country', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20105007-0000-4000-8000-000105000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'To what extent does volunteer tourism truly benefit local communities versus serving the traveler?',
    'Critically examine the motivations and outcomes of volunteer travel programs.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'voluntourism', 'A combination of volunteering and tourism', 1),
  ((SELECT id FROM card), 'sustainable development', 'Progress that meets needs without harming the future', 2),
  ((SELECT id FROM card), 'altruism', 'Selfless concern for the well-being of others', 3),
  ((SELECT id FROM card), 'paternalism', 'Limiting freedom for what is perceived as the other''s good', 4),
  ((SELECT id FROM card), 'capacity building', 'Developing skills and abilities in a community', 5),
  ((SELECT id FROM card), 'empowerment', 'Giving power and authority to others', 6),
  ((SELECT id FROM card), 'reciprocity', 'Mutual exchange of benefits', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20105008-0000-4000-8000-000105000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the rise of remote work and digital nomadism challenge traditional notions of travel?',
    'Discuss work-life integration, location independence, visa implications, and community.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'digital nomad', 'A person who works remotely while traveling', 1),
  ((SELECT id FROM card), 'location independent', 'Able to work from anywhere in the world', 2),
  ((SELECT id FROM card), 'co-working', 'A shared office space used by remote workers', 3),
  ((SELECT id FROM card), 'slow travel', 'Spending extended time in each destination', 4),
  ((SELECT id FROM card), 'visa run', 'Leaving a country to renew a visa', 5),
  ((SELECT id FROM card), 'infrastructure', 'The facilities needed for a society to function', 6),
  ((SELECT id FROM card), 'transient', 'Staying only for a short time', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20105009-0000-4000-8000-000105000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What ethical responsibilities do travelers have when photographing people in foreign countries?',
    'Consider consent, dignity, stereotyping, and the power dynamics of representation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'consent', 'Permission for something to happen', 1),
  ((SELECT id FROM card), 'dignity', 'The quality of being worthy of respect', 2),
  ((SELECT id FROM card), 'stereotype', 'A simplified and generalized idea about a group', 3),
  ((SELECT id FROM card), 'representation', 'The depiction of people in media', 4),
  ((SELECT id FROM card), 'exploitative', 'Taking unfair advantage of someone', 5),
  ((SELECT id FROM card), 'voyeurism', 'Gaining pleasure from watching others without their knowledge', 6),
  ((SELECT id FROM card), 'sensitivity', 'Awareness of others'' feelings', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010500a-0000-4000-8000-000105000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How might space tourism transform our understanding of travel and its environmental cost?',
    'Discuss technological feasibility, exclusivity, environmental impact, and the definition of travel.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'space tourism', 'Commercial travel to outer space for recreation', 1),
  ((SELECT id FROM card), 'feasibility', 'The possibility of being achieved', 2),
  ((SELECT id FROM card), 'carbon footprint', 'The amount of carbon emitted by an activity', 3),
  ((SELECT id FROM card), 'suborbital', 'Not reaching orbit, but going into space briefly', 4),
  ((SELECT id FROM card), 'propulsion', 'The force that drives something forward', 5),
  ((SELECT id FROM card), 'stratosphere', 'The layer of the atmosphere above the troposphere', 6),
  ((SELECT id FROM card), 'breakthrough', 'A significant development or discovery', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010500b-0000-4000-8000-000105000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How should national tourism boards balance attracting international visitors with preserving local quality of life?',
    'Discuss zoning, marketing strategies, infrastructure investment, and community engagement.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'zoning', 'Designating areas for specific uses', 1),
  ((SELECT id FROM card), 'gentrification', 'The transformation of a neighborhood by wealthier people', 2),
  ((SELECT id FROM card), 'carrying capacity', 'The maximum number of visitors a place can handle', 3),
  ((SELECT id FROM card), 'urban sprawl', 'The uncontrolled expansion of urban areas', 4),
  ((SELECT id FROM card), 'habitability', 'The suitability of a place for living', 5),
  ((SELECT id FROM card), 'stakeholder engagement', 'Involving all interested parties in decisions', 6),
  ((SELECT id FROM card), 'sustainable tourism', 'Tourism that does not harm the environment or society', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010500c-0000-4000-8000-000105000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What is the role of gastronomy in shaping a destination''s tourism appeal?',
    'Examine how food culture, street food, Michelin stars, and culinary festivals attract visitors.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'gastronomy', 'The art and culture of good food', 1),
  ((SELECT id FROM card), 'culinary', 'Relating to cooking or the kitchen', 2),
  ((SELECT id FROM card), 'Michelin star', 'A rating awarded to exceptional restaurants', 3),
  ((SELECT id FROM card), 'foodie', 'A person with a strong interest in food', 4),
  ((SELECT id FROM card), 'farm-to-table', 'A movement serving locally sourced food', 5),
  ((SELECT id FROM card), 'gastronomic tourism', 'Travel motivated by food and drink experiences', 6),
  ((SELECT id FROM card), 'palate', 'A person''s ability to taste flavors', 7);

-- -----------------------------------------------------------
-- TRAVEL — C2 (level 06)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20106001-0000-4000-8000-000106000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically analyze the concept of wanderlust as both a personal desire and a consumer construct shaped by media.',
    'Examine how the travel industry markets aspiration and whether this aligns with authentic human experience.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'wanderlust', 'A strong desire to travel and explore the world', 1),
  ((SELECT id FROM card), 'construct', 'An idea formed by social or cultural influences', 2),
  ((SELECT id FROM card), 'aspirational', 'Reflecting a desire for something higher', 3),
  ((SELECT id FROM card), 'commodification', 'The process of turning something into a product', 4),
  ((SELECT id FROM card), 'narrative', 'A story or account of events', 5),
  ((SELECT id FROM card), 'zeitgeist', 'The spirit or mood of a particular time', 6),
  ((SELECT id FROM card), 'escapism', 'The tendency to seek distraction from reality', 7),
  ((SELECT id FROM card), 'existential', 'Relating to human existence and purpose', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20106002-0000-4000-8000-000106000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Evaluate the argument that international travel is a privilege that reinforces global inequality rather than bridging cultural gaps.',
    'Consider access, economic disparity, and whether tourism truly fosters cross-cultural understanding.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'privilege', 'An unearned advantage available only to some', 1),
  ((SELECT id FROM card), 'disparity', 'A great difference between groups', 2),
  ((SELECT id FROM card), 'hegemony', 'Dominance of one group over others', 3),
  ((SELECT id FROM card), 'cosmopolitanism', 'The ideology that all people belong to a single community', 4),
  ((SELECT id FROM card), 'parochialism', 'A limited or narrow outlook', 5),
  ((SELECT id FROM card), 'solidarity', 'Unity and mutual support between groups', 6),
  ((SELECT id FROM card), 'systemic', 'Relating to a system as a whole', 7),
  ((SELECT id FROM card), 'emancipatory', 'Freeing someone from restrictions', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20106003-0000-4000-8000-000106000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How might the decolonization of tourism reshape travel narratives and power structures in the industry?',
    'Analyze who tells the stories, who benefits economically, and how marginalized voices can be centered.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'decolonization', 'Undoing colonial power structures', 1),
  ((SELECT id FROM card), 'marginalized', 'Pushed to the edges of society', 2),
  ((SELECT id FROM card), 'postcolonial', 'Relating to the period after colonialism', 3),
  ((SELECT id FROM card), 'appropriation', 'Taking something for oneself without permission', 4),
  ((SELECT id FROM card), 'agency', 'The ability to act independently', 5),
  ((SELECT id FROM card), 'representation', 'The action of speaking for others', 6),
  ((SELECT id FROM card), 'counter-narrative', 'An alternative story that challenges the dominant one', 7),
  ((SELECT id FROM card), 'self-determination', 'The right of people to control their own future', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20106004-0000-4000-8000-000106000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'What philosophical insights can be drawn from the practice of long-term travel about the nature of home and belonging?',
    'Reflect on how extended travel transforms one''s relationship with place, identity, and permanence.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'philosophical', 'Relating to the study of fundamental truths', 1),
  ((SELECT id FROM card), 'transcendence', 'Going beyond ordinary limits', 2),
  ((SELECT id FROM card), 'rootlessness', 'Lacking a sense of belonging to a place', 3),
  ((SELECT id FROM card), 'placelessness', 'A feeling of not belonging anywhere', 4),
  ((SELECT id FROM card), 'sedentary', 'Staying in one place habitually', 5),
  ((SELECT id FROM card), 'nomadic', 'Moving from place to place without a permanent home', 6),
  ((SELECT id FROM card), 'permanence', 'The state of lasting forever', 7),
  ((SELECT id FROM card), 'transience', 'The state of lasting only a short time', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20106005-0000-4000-8000-000106000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Assess the extent to which global health crises like pandemics will permanently alter international travel behavior and policy.',
    'Consider border controls, digital health passports, insurance models, and traveler psychology.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'pandemic', 'A disease outbreak affecting many countries', 1),
  ((SELECT id FROM card), 'quarantine', 'Isolation to prevent disease spread', 2),
  ((SELECT id FROM card), 'biosecurity', 'Measures to protect against biological threats', 3),
  ((SELECT id FROM card), 'surveillance', 'Close monitoring of people''s activities', 4),
  ((SELECT id FROM card), 'protocol', 'A set of official rules and procedures', 5),
  ((SELECT id FROM card), 'resilience', 'The capacity to recover quickly from difficulties', 6),
  ((SELECT id FROM card), 'contingency', 'A plan for a possible future event', 7),
  ((SELECT id FROM card), 'travel corridor', 'A route between regions with reduced restrictions', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20106006-0000-4000-8000-000106000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How does the concept of the "expatriate" differ from that of the "immigrant" in terms of social perception and legal status?',
    'Analyze the racial, economic, and linguistic factors that shape these categories.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'expatriate', 'A person living outside their native country', 1),
  ((SELECT id FROM card), 'immigrant', 'A person who permanently moves to another country', 2),
  ((SELECT id FROM card), 'diaspora', 'The dispersion of people from their homeland', 3),
  ((SELECT id FROM card), 'naturalization', 'The process of becoming a citizen of another country', 4),
  ((SELECT id FROM card), 'xenophobia', 'Dislike of people from other countries', 5),
  ((SELECT id FROM card), 'integration', 'The process of becoming part of a society', 6),
  ((SELECT id FROM card), 'assimilation', 'Adopting the culture of a dominant group', 7),
  ((SELECT id FROM card), 'bureaucracy', 'A complex system of government administration', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20106007-0000-4000-8000-000106000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Evaluate the proposition that cultural immersion through travel is the most effective path toward intercultural competence.',
    'Contrast surface-level tourism with deep engagement and consider what truly fosters understanding.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'cross-cultural immersion', 'Deep involvement in a different culture', 1),
  ((SELECT id FROM card), 'intercultural competence', 'The ability to communicate across cultures effectively', 2),
  ((SELECT id FROM card), 'ethnocentrism', 'Judging other cultures by one''s own standards', 3),
  ((SELECT id FROM card), 'cultural relativism', 'Understanding cultures on their own terms', 4),
  ((SELECT id FROM card), 'acculturation', 'The process of adopting another culture''s traits', 5),
  ((SELECT id FROM card), 'cognitive flexibility', 'The ability to adapt thinking to new contexts', 6),
  ((SELECT id FROM card), 'empathy', 'The ability to understand others'' feelings', 7),
  ((SELECT id FROM card), 'syncretism', 'The merging of different cultural elements', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20106008-0000-4000-8000-000106000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'In what ways does the aviation industry''s pursuit of net-zero emissions by 2050 conflict with projected growth in air travel demand?',
    'Analyze technological solutions, carbon offset markets, and the feasibility of sustainable aviation fuel.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'net-zero', 'Achieving no net greenhouse gas emissions', 1),
  ((SELECT id FROM card), 'aviation', 'The operation of aircraft', 2),
  ((SELECT id FROM card), 'sustainable aviation fuel', 'Fuel made from renewable sources for aircraft', 3),
  ((SELECT id FROM card), 'carbon neutral', 'Offsetting emissions to achieve a net zero effect', 4),
  ((SELECT id FROM card), 'electrification', 'Switching to electric-powered systems', 5),
  ((SELECT id FROM card), 'emissions trading', 'A market-based approach to controlling pollution', 6),
  ((SELECT id FROM card), 'greenwashing', 'Making false claims about environmental practices', 7),
  ((SELECT id FROM card), 'decarbonization', 'Reducing carbon emissions from industry', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20106009-0000-4000-8000-000106000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How should the tourism industry reconcile the tension between cultural preservation and economic development in heritage sites?',
    'Examine UNESCO frameworks, local livelihoods, and the politics of heritage management.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'UNESCO', 'The UN agency for educational, scientific, and cultural matters', 1),
  ((SELECT id FROM card), 'preservationist', 'An advocate for protecting historical sites', 2),
  ((SELECT id FROM card), 'livelihood', 'The means of securing the necessities of life', 3),
  ((SELECT id FROM card), 'gentrification', 'The transformation of a place by wealthier newcomers', 4),
  ((SELECT id FROM card), 'authenticity', 'The quality of being genuine and original', 5),
  ((SELECT id FROM card), 'staged authenticity', 'A manufactured version of genuine culture for tourists', 6),
  ((SELECT id FROM card), 'heritage management', 'The conservation and care of cultural heritage', 7),
  ((SELECT id FROM card), 'tangible', 'Clearly real and physically present', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010600a-0000-4000-8000-000106000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'What are the epistemological limitations of learning about a culture through tourism rather than lived experience?',
    'Consider the depth of understanding possible through brief encounters versus prolonged residence.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'epistemological', 'Relating to the theory of knowledge', 1),
  ((SELECT id FROM card), 'phenomenology', 'The study of subjective experience', 2),
  ((SELECT id FROM card), 'superficial', 'Only on the surface, not deep', 3),
  ((SELECT id FROM card), 'emic perspective', 'An insider''s view of a culture', 4),
  ((SELECT id FROM card), 'etic perspective', 'An outsider''s view of a culture', 5),
  ((SELECT id FROM card), 'subjectivity', 'The influence of personal experiences on understanding', 6),
  ((SELECT id FROM card), 'othering', 'Viewing others as fundamentally different from oneself', 7),
  ((SELECT id FROM card), 'lived experience', 'Personal knowledge gained through direct participation', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010600b-0000-4000-8000-000106000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Analyze the political economy of passport ranking systems and how they perpetuate global mobility hierarchies.',
    'Evaluate the Henley Passport Index and similar tools as instruments of soft power and inequality.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'political economy', 'The study of how politics affects economies', 1),
  ((SELECT id FROM card), 'hierarchy', 'A system where people are ranked above others', 2),
  ((SELECT id FROM card), 'soft power', 'Persuasion through attraction rather than force', 3),
  ((SELECT id FROM card), 'mobility capital', 'The resources that enable people to travel freely', 4),
  ((SELECT id FROM card), 'stratification', 'Division into different levels or classes', 5),
  ((SELECT id FROM card), 'visa waiver', 'An agreement allowing travel without a visa', 6),
  ((SELECT id FROM card), 'reciprocity', 'A mutual exchange of privileges', 7),
  ((SELECT id FROM card), 'biometric', 'Using physical characteristics for identification', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2010600c-0000-4000-8000-000106000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'To what extent does the concept of "responsible travel" represent a genuine shift in consumer consciousness versus a marketing trend?',
    'Critically examine consumer behavior, corporate sustainability claims, and the impact of eco-certifications.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'consumer consciousness', 'Awareness of the impact of purchasing decisions', 1),
  ((SELECT id FROM card), 'greenwashing', 'Deceptive marketing about environmental practices', 2),
  ((SELECT id FROM card), 'eco-certification', 'An official label indicating environmental standards', 3),
  ((SELECT id FROM card), 'behavioral economics', 'The study of psychological effects on economic decisions', 4),
  ((SELECT id FROM card), 'virtue signaling', 'Expressing values to demonstrate moral goodness', 5),
  ((SELECT id FROM card), 'ethical consumerism', 'Buying products that align with moral values', 6),
  ((SELECT id FROM card), 'corporate accountability', 'A company''s responsibility for its actions', 7),
  ((SELECT id FROM card), 'triple bottom line', 'A framework covering social, environmental, and financial performance', 8);

-- ============================================================
-- TOPIC: FOOD (02)
-- ============================================================

-- -----------------------------------------------------------
-- FOOD — A1 (level 01)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20201001-0000-4000-8000-000201000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What fruits and vegetables do you like to eat? Which ones do you not like?',
    'Name at least three fruits and three vegetables and describe their taste.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'apple', 'A round fruit with red or green skin', 1),
  ((SELECT id FROM card), 'banana', 'A long yellow fruit', 2),
  ((SELECT id FROM card), 'carrot', 'A long orange vegetable', 3),
  ((SELECT id FROM card), 'tomato', 'A red fruit used in cooking', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20201002-0000-4000-8000-000201000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What do you usually eat for breakfast? Describe your morning meal.',
    'Talk about the food and drinks you have in the morning.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'bread', 'A food made from flour and water', 1),
  ((SELECT id FROM card), 'milk', 'A white drink from cows', 2),
  ((SELECT id FROM card), 'egg', 'An oval food from chickens', 3),
  ((SELECT id FROM card), 'cereal', 'A breakfast food made from grains', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20201003-0000-4000-8000-000201000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is your favorite drink? When do you like to have it?',
    'Describe the drink, its taste, and the time of day you enjoy it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'water', 'A clear liquid you drink every day', 1),
  ((SELECT id FROM card), 'juice', 'A drink made from fruits', 2),
  ((SELECT id FROM card), 'coffee', 'A hot drink made from beans', 3),
  ((SELECT id FROM card), 'tea', 'A hot drink made from leaves', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20201004-0000-4000-8000-000201000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What foods do you know how to cook? What is the easiest thing you can make?',
    'Describe a simple dish you can prepare and the steps to make it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'cook', 'To prepare food using heat', 1),
  ((SELECT id FROM card), 'salt', 'A white substance used to add flavor', 2),
  ((SELECT id FROM card), 'sugar', 'A sweet substance used in cooking', 3),
  ((SELECT id FROM card), 'oil', 'A liquid fat used for cooking', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20201005-0000-4000-8000-000201000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Where do you usually buy your food? What do you buy there?',
    'Talk about the supermarket, market, or shop you go to for food.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'supermarket', 'A large store that sells food and household items', 1),
  ((SELECT id FROM card), 'bakery', 'A shop that sells bread and cakes', 2),
  ((SELECT id FROM card), 'fruit', 'A sweet food that grows on trees or plants', 3),
  ((SELECT id FROM card), 'vegetable', 'A plant used as food', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20201006-0000-4000-8000-000201000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is your favorite dessert? Why do you like it?',
    'Describe a sweet dish you love and when you usually eat it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'cake', 'A sweet baked dessert', 1),
  ((SELECT id FROM card), 'ice cream', 'A frozen sweet food made from milk', 2),
  ((SELECT id FROM card), 'chocolate', 'A sweet brown food from cacao beans', 3),
  ((SELECT id FROM card), 'cookie', 'A small sweet baked treat', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20201007-0000-4000-8000-000201000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What do you like to eat for lunch? Do you eat at home or somewhere else?',
    'Describe your typical lunch and where you have it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'lunch', 'A meal eaten in the middle of the day', 1),
  ((SELECT id FROM card), 'soup', 'A liquid food made by boiling ingredients', 2),
  ((SELECT id FROM card), 'sandwich', 'Two pieces of bread with filling between them', 3),
  ((SELECT id FROM card), 'salad', 'A mixture of raw vegetables', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20201008-0000-4000-8000-000201000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Do you like to eat at restaurants? What is your favorite restaurant food?',
    'Talk about eating out and the dishes you order at restaurants.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'waiter', 'A person who serves food in a restaurant', 1),
  ((SELECT id FROM card), 'order', 'To ask for food in a restaurant', 2),
  ((SELECT id FROM card), 'bill', 'A piece of paper showing what you must pay', 3),
  ((SELECT id FROM card), 'tip', 'Extra money you give for good service', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20201009-0000-4000-8000-000201000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What food do you eat when you are sick? What makes you feel better?',
    'Describe comfort foods that help when you do not feel well.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'honey', 'A sweet sticky liquid made by bees', 1),
  ((SELECT id FROM card), 'lemon', 'A sour yellow fruit', 2),
  ((SELECT id FROM card), 'ginger', 'A spicy root used in cooking', 3),
  ((SELECT id FROM card), 'chicken soup', 'A warm soup made with chicken and vegetables', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020100a-0000-4000-8000-000201000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What are your favorite foods for a party or celebration?',
    'Describe the special foods you enjoy at birthdays, holidays, or parties.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'party', 'A social event with food and drinks', 1),
  ((SELECT id FROM card), 'birthday', 'The day you were born', 2),
  ((SELECT id FROM card), 'pizza', 'A flat round food with cheese and toppings', 3),
  ((SELECT id FROM card), 'cake', 'A sweet dessert often served at celebrations', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020100b-0000-4000-8000-000201000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'How do you set the table before eating? What do you put on the table?',
    'Describe the items you use when you prepare to eat a meal.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'plate', 'A flat dish used for serving food', 1),
  ((SELECT id FROM card), 'cup', 'A container for drinking', 2),
  ((SELECT id FROM card), 'fork', 'A tool with prongs used for eating', 3),
  ((SELECT id FROM card), 'knife', 'A sharp tool for cutting food', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020100c-0000-4000-8000-000201000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What colors can you see in the food you eat? Give examples.',
    'Name foods of different colors like red, green, yellow, and orange.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'red', 'The color of strawberries and tomatoes', 1),
  ((SELECT id FROM card), 'green', 'The color of lettuce and broccoli', 2),
  ((SELECT id FROM card), 'yellow', 'The color of corn and lemons', 3),
  ((SELECT id FROM card), 'orange', 'The color of carrots and oranges', 4);

-- -----------------------------------------------------------
-- FOOD — A2 (level 02)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20202001-0000-4000-8000-000202000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How often do you eat fast food? What do you usually order?',
    'Talk about your fast food habits and favorite menu items.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'hamburger', 'A sandwich with a cooked meat patty', 1),
  ((SELECT id FROM card), 'fries', 'Long thin pieces of fried potato', 2),
  ((SELECT id FROM card), 'takeaway', 'A meal bought to eat at home', 3),
  ((SELECT id FROM card), 'drive-through', 'A restaurant where you order from your car', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20202002-0000-4000-8000-000202000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What foods from your childhood do you still enjoy today?',
    'Describe dishes you ate when you were young and still love.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'childhood', 'The time when you were a child', 1),
  ((SELECT id FROM card), 'homemade', 'Made at home, not bought from a store', 2),
  ((SELECT id FROM card), 'grandmother', 'The mother of your parent', 3),
  ((SELECT id FROM card), 'recipe', 'A set of instructions for cooking a dish', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20202003-0000-4000-8000-000202000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is the most unusual food you have ever tried? Did you like it?',
    'Describe a strange or exotic food you ate and the experience of trying it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'unusual', 'Not common or ordinary', 1),
  ((SELECT id FROM card), 'exotic', 'From a foreign or distant place', 2),
  ((SELECT id FROM card), 'taste', 'The flavor of food in your mouth', 3),
  ((SELECT id FROM card), 'try', 'To taste or test something', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20202004-0000-4000-8000-000202000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What kitchen tools do you use most often when you cook?',
    'Name and describe the tools you use to prepare meals.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'pot', 'A deep round container for cooking', 1),
  ((SELECT id FROM card), 'pan', 'A flat container for frying food', 2),
  ((SELECT id FROM card), 'oven', 'A kitchen device for baking or roasting', 3),
  ((SELECT id FROM card), 'microwave', 'A device that heats food quickly', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20202005-0000-4000-8000-000202000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What do you like to drink with your meals? Do you prefer hot or cold drinks?',
    'Talk about beverages you enjoy with breakfast, lunch, and dinner.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'soda', 'A sweet fizzy drink', 1),
  ((SELECT id FROM card), 'milkshake', 'A cold drink made from milk and ice cream', 2),
  ((SELECT id FROM card), 'smoothie', 'A thick drink made from blended fruits', 3),
  ((SELECT id FROM card), 'lemonade', 'A sweet drink made from lemons', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20202006-0000-4000-8000-000202000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How does food taste different when it is cooked in different ways?',
    'Compare boiled, fried, baked, and grilled versions of the same food.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'boiled', 'Cooked in hot water', 1),
  ((SELECT id FROM card), 'fried', 'Cooked in hot oil', 2),
  ((SELECT id FROM card), 'baked', 'Cooked in an oven', 3),
  ((SELECT id FROM card), 'grilled', 'Cooked over a fire or hot surface', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20202007-0000-4000-8000-000202000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is a typical breakfast in your country? What do people usually eat?',
    'Describe the morning meals commonly eaten in your culture.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'toast', 'Sliced bread that has been browned', 1),
  ((SELECT id FROM card), 'butter', 'A yellow fat made from milk', 2),
  ((SELECT id FROM card), 'jam', 'A sweet spread made from fruit', 3),
  ((SELECT id FROM card), 'pancake', 'A thin flat cake cooked in a pan', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20202008-0000-4000-8000-000202000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What snacks do you like to eat while watching a movie or TV show?',
    'Describe your favorite snacks and why you enjoy them during screen time.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'popcorn', 'A snack made from heated corn kernels', 1),
  ((SELECT id FROM card), 'chips', 'Thin slices of potato fried until crispy', 2),
  ((SELECT id FROM card), 'candy', 'A sweet food made from sugar', 3),
  ((SELECT id FROM card), 'nuts', 'Small hard fruits that can be eaten', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20202009-0000-4000-8000-000202000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you know when fruit is ready to eat? What signs do you look for?',
    'Talk about color, smell, and texture of ripe fruits.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'ripe', 'Fully grown and ready to eat', 1),
  ((SELECT id FROM card), 'fresh', 'Recently picked and not old', 2),
  ((SELECT id FROM card), 'soft', 'Not hard, easy to press', 3),
  ((SELECT id FROM card), 'sweet', 'Having a taste like sugar', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020200a-0000-4000-8000-000202000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What do you do when you go to a restaurant and the food is not good?',
    'Describe how you would handle a disappointing meal at a restaurant.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'complain', 'To express dissatisfaction', 1),
  ((SELECT id FROM card), 'return', 'To give back and get a replacement', 2),
  ((SELECT id FROM card), 'refund', 'Money given back for a returned item', 3),
  ((SELECT id FROM card), 'manager', 'The person in charge of a restaurant', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020200b-0000-4000-8000-000202000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What foods do you eat when the weather is very hot or very cold?',
    'Describe seasonal foods and how your diet changes with the temperature.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'ice', 'Frozen water used to cool drinks', 1),
  ((SELECT id FROM card), 'grill', 'To cook on a metal frame over fire', 2),
  ((SELECT id FROM card), 'stew', 'A dish of meat and vegetables cooked slowly', 3),
  ((SELECT id FROM card), 'soup', 'A warm liquid food', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020200c-0000-4000-8000-000202000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is a food that you did not like before but you like now? What changed?',
    'Talk about how your taste in food has changed over time.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'bitter', 'A sharp, unpleasant taste', 1),
  ((SELECT id FROM card), 'sour', 'A sharp taste like lemon', 2),
  ((SELECT id FROM card), 'flavor', 'The particular taste of a food', 3),
  ((SELECT id FROM card), 'dislike', 'To not like something', 4);

-- -----------------------------------------------------------
-- FOOD — B1 (level 03)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20203001-0000-4000-8000-000203000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do eating habits differ between generations in your country?',
    'Compare what older and younger people typically eat and why.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'generation', 'A group of people born around the same time', 1),
  ((SELECT id FROM card), 'habit', 'A regular practice or routine', 2),
  ((SELECT id FROM card), 'nutrition', 'The process of getting the right food for health', 3),
  ((SELECT id FROM card), 'diet', 'The kinds of food a person regularly eats', 4),
  ((SELECT id FROM card), 'traditional', 'Following long-established customs', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20203002-0000-4000-8000-000203000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What role does food play in bringing families and friends together?',
    'Discuss shared meals, holidays, and cooking traditions.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'gathering', 'A group of people meeting together', 1),
  ((SELECT id FROM card), 'celebrate', 'To mark a special occasion with enjoyment', 2),
  ((SELECT id FROM card), 'feast', 'A large special meal for many people', 3),
  ((SELECT id FROM card), 'bond', 'A connection between people', 4),
  ((SELECT id FROM card), 'hospitality', 'Generous treatment of guests', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20203003-0000-4000-8000-000203000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How has international cuisine influenced what people eat in your country?',
    'Think about foreign restaurants, ingredients, and fusion food.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'fusion', 'A blend of different culinary traditions', 1),
  ((SELECT id FROM card), 'influence', 'The effect of one thing on another', 2),
  ((SELECT id FROM card), 'import', 'To bring goods from another country', 3),
  ((SELECT id FROM card), 'ethnic', 'Relating to a particular cultural group', 4),
  ((SELECT id FROM card), 'mainstream', 'Widely accepted and popular', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20203004-0000-4000-8000-000203000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What are the benefits of growing your own food at home?',
    'Discuss gardening, freshness, cost savings, and satisfaction.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'garden', 'A piece of land for growing plants', 1),
  ((SELECT id FROM card), 'harvest', 'To collect plants when they are ready', 2),
  ((SELECT id FROM card), 'organic', 'Grown without artificial chemicals', 3),
  ((SELECT id FROM card), 'herb', 'A plant used for flavoring food', 4),
  ((SELECT id FROM card), 'seasonal', 'Available only at certain times of the year', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20203005-0000-4000-8000-000203000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you decide what to cook for dinner on a busy weeknight?',
    'Talk about planning, shortcuts, and quick meal ideas.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'meal prep', 'Preparing food in advance', 1),
  ((SELECT id FROM card), 'leftover', 'Food not eaten from a previous meal', 2),
  ((SELECT id FROM card), 'convenience', 'A food that is quick and easy to prepare', 3),
  ((SELECT id FROM card), 'ingredient', 'An item used in making a dish', 4),
  ((SELECT id FROM card), 'recipe', 'Instructions for preparing a dish', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20203006-0000-4000-8000-000203000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is the biggest food trend in your country right now?',
    'Describe a popular way of eating or cooking that many people are trying.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'trend', 'A popular direction or style', 1),
  ((SELECT id FROM card), 'popular', 'Liked by many people', 2),
  ((SELECT id FROM card), 'vegan', 'A diet without any animal products', 3),
  ((SELECT id FROM card), 'gluten-free', 'Not containing a protein found in wheat', 4),
  ((SELECT id FROM card), 'superfood', 'A food considered very beneficial for health', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20203007-0000-4000-8000-000203000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you feel about trying food from a culture you do not know well?',
    'Discuss being adventurous versus cautious with unfamiliar cuisine.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'curious', 'Eager to learn or try new things', 1),
  ((SELECT id FROM card), 'hesitant', 'Unsure or reluctant', 2),
  ((SELECT id FROM card), 'adventurous', 'Willing to take risks', 3),
  ((SELECT id FROM card), 'unfamiliar', 'Not known or experienced before', 4),
  ((SELECT id FROM card), 'intriguing', 'Interesting and mysterious', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20203008-0000-4000-8000-000203000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is your opinion on street food? Is it safe and enjoyable?',
    'Talk about your experiences with street vendors and local food stalls.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'street food', 'Ready-to-eat food sold in public places', 1),
  ((SELECT id FROM card), 'vendor', 'A person who sells food on the street', 2),
  ((SELECT id FROM card), 'stall', 'A small stand where food is sold', 3),
  ((SELECT id FROM card), 'hygiene', 'Cleanliness and practices for health', 4),
  ((SELECT id FROM card), 'authentic', 'Genuine and true to its origin', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20203009-0000-4000-8000-000203000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How does the price of food affect what you decide to buy at the supermarket?',
    'Discuss budgeting, brand choices, and buying in bulk.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'budget', 'A plan for how to spend money', 1),
  ((SELECT id FROM card), 'brand', 'A particular make of a product', 2),
  ((SELECT id FROM card), 'discount', 'A reduction in price', 3),
  ((SELECT id FROM card), 'value', 'The worth of something compared to its price', 4),
  ((SELECT id FROM card), 'bulk', 'In large quantities', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020300a-0000-4000-8000-000203000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is a typical family dinner like in your culture?',
    'Describe who cooks, what is served, and how people eat together.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'dinner', 'The main evening meal', 1),
  ((SELECT id FROM card), 'serve', 'To present food to someone', 2),
  ((SELECT id FROM card), 'portion', 'An amount of food for one person', 3),
  ((SELECT id FROM card), 'side dish', 'A smaller dish served with the main meal', 4),
  ((SELECT id FROM card), 'leftover', 'Food remaining after a meal', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020300b-0000-4000-8000-000203000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you know if a restaurant is good before you go there?',
    'Discuss reviews, recommendations, appearance, and atmosphere.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'review', 'A critical assessment of a place', 1),
  ((SELECT id FROM card), 'rating', 'A score or grade given to something', 2),
  ((SELECT id FROM card), 'atmosphere', 'The mood or feeling of a place', 3),
  ((SELECT id FROM card), 'reputation', 'The general opinion about something', 4),
  ((SELECT id FROM card), 'recommendation', 'A suggestion that something is good', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020300c-0000-4000-8000-000203000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What does your ideal meal look like from start to finish?',
    'Describe the starter, main course, dessert, and drinks you would choose.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'starter', 'A small dish served before the main meal', 1),
  ((SELECT id FROM card), 'main course', 'The primary dish of a meal', 2),
  ((SELECT id FROM card), 'dessert', 'A sweet dish at the end of a meal', 3),
  ((SELECT id FROM card), 'appetizer', 'A small dish to stimulate the appetite', 4),
  ((SELECT id FROM card), 'accompaniment', 'Something served with the main dish', 5);

-- -----------------------------------------------------------
-- FOOD — B2 (level 04)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20204001-0000-4000-8000-000204000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What is your perspective on the global food industry and its impact on small-scale farmers?',
    'Discuss supply chains, fair trade, corporate farming, and local agriculture.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'supply chain', 'The system of producing and delivering food', 1),
  ((SELECT id FROM card), 'fair trade', 'A system ensuring fair prices for producers', 2),
  ((SELECT id FROM card), 'subsistence', 'Farming that provides only for the farmer''s family', 3),
  ((SELECT id FROM card), 'monoculture', 'Growing a single crop over a large area', 4),
  ((SELECT id FROM card), 'commodity', 'A raw product that can be traded', 5),
  ((SELECT id FROM card), 'agribusiness', 'Large-scale commercial farming', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20204002-0000-4000-8000-000204000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do food labeling systems like nutrition facts influence consumer choices?',
    'Evaluate ingredient lists, calories, serving sizes, and marketing claims.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'label', 'A tag providing information about a product', 1),
  ((SELECT id FROM card), 'ingredient', 'A component of a food product', 2),
  ((SELECT id FROM card), 'calorie', 'A unit of energy in food', 3),
  ((SELECT id FROM card), 'allergen', 'A substance that causes an allergic reaction', 4),
  ((SELECT id FROM card), 'preservative', 'A substance used to keep food fresh longer', 5),
  ((SELECT id FROM card), 'additive', 'A substance added to food to improve it', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20204003-0000-4000-8000-000204000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the cultural and economic implications of food waste in modern societies?',
    'Discuss consumer behavior, supermarket practices, and potential solutions.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'food waste', 'Edible food that is thrown away', 1),
  ((SELECT id FROM card), 'expiration', 'The date after which food is no longer fresh', 2),
  ((SELECT id FROM card), 'compost', 'Decayed organic material used as plant fertilizer', 3),
  ((SELECT id FROM card), 'portion size', 'The amount of food served in one helping', 4),
  ((SELECT id FROM card), 'surplus', 'An excess of food beyond what is needed', 5),
  ((SELECT id FROM card), 'donation', 'Giving food to those in need', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20204004-0000-4000-8000-000204000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How has the farm-to-table movement changed the restaurant industry?',
    'Discuss seasonal menus, local sourcing, transparency, and pricing.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'farm-to-table', 'Directly from farm to consumer with minimal processing', 1),
  ((SELECT id FROM card), 'locally sourced', 'Obtained from nearby producers', 2),
  ((SELECT id FROM card), 'seasonal', 'Available only during a specific time of year', 3),
  ((SELECT id FROM card), 'artisan', 'Made in a traditional way by skilled workers', 4),
  ((SELECT id FROM card), 'traceability', 'The ability to track food through its supply chain', 5),
  ((SELECT id FROM card), 'sustainable', 'Not depleting natural resources', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20204005-0000-4000-8000-000204000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What role does food play in expressing cultural identity for immigrant communities?',
    'Consider traditional recipes, fusion cuisine, and passing down food heritage.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'cultural identity', 'The feeling of belonging to a cultural group', 1),
  ((SELECT id FROM card), 'heritage', 'Traditions and values passed through generations', 2),
  ((SELECT id FROM card), 'diaspora', 'A community living outside its ancestral homeland', 3),
  ((SELECT id FROM card), 'assimilation', 'Adopting the cultural traits of another group', 4),
  ((SELECT id FROM card), 'nostalgia', 'Sentimental longing for the past', 5),
  ((SELECT id FROM card), 'adaptation', 'Changing to fit a new environment', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20204006-0000-4000-8000-000204000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the pros and cons of meal kit delivery services for modern households?',
    'Discuss convenience, cost, environmental impact, and cooking skills.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'meal kit', 'A box with pre-portioned ingredients and recipes', 1),
  ((SELECT id FROM card), 'subscription', 'A regular payment for a service', 2),
  ((SELECT id FROM card), 'packaging', 'Materials used to wrap products', 3),
  ((SELECT id FROM card), 'convenience', 'Ease and suitability', 4),
  ((SELECT id FROM card), 'portion control', 'Managing the amount of food served', 5),
  ((SELECT id FROM card), 'culinary', 'Related to cooking', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20204007-0000-4000-8000-000204000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How does the marketing of ultra-processed foods contribute to public health challenges?',
    'Examine advertising, labeling, pricing, and addiction in food design.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'ultra-processed', 'Food heavily modified with industrial ingredients', 1),
  ((SELECT id FROM card), 'addictive', 'Causing a dependency or strong urge', 2),
  ((SELECT id FROM card), 'marketing', 'The promotion of products to consumers', 3),
  ((SELECT id FROM card), 'obesogenic', 'Promoting excessive weight gain', 4),
  ((SELECT id FROM card), 'food desert', 'An area with limited access to healthy food', 5),
  ((SELECT id FROM card), 'nutritional', 'Related to the nourishing content of food', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20204008-0000-4000-8000-000204000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the ethical considerations behind eating meat and animal products?',
    'Discuss animal welfare, environmental impact, health concerns, and cultural traditions.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'ethical', 'Involving moral principles', 1),
  ((SELECT id FROM card), 'animal welfare', 'The well-being of animals under human care', 2),
  ((SELECT id FROM card), 'factory farming', 'Industrial-scale animal production', 3),
  ((SELECT id FROM card), 'free-range', 'Animals kept in natural conditions', 4),
  ((SELECT id FROM card), 'slaughter', 'The killing of animals for food', 5),
  ((SELECT id FROM card), 'conscious', 'Being aware and making deliberate choices', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20204009-0000-4000-8000-000204000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How is technology transforming food production, from lab-grown meat to vertical farming?',
    'Evaluate innovation, consumer acceptance, cost, and environmental benefits.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'lab-grown', 'Developed in a laboratory from cells', 1),
  ((SELECT id FROM card), 'vertical farming', 'Growing crops in stacked layers indoors', 2),
  ((SELECT id FROM card), 'hydroponics', 'Growing plants in water without soil', 3),
  ((SELECT id FROM card), 'genetically modified', 'Having altered DNA for desired traits', 4),
  ((SELECT id FROM card), 'cultivated', 'Grown or produced artificially', 5),
  ((SELECT id FROM card), 'bioengineering', 'The application of biology to create products', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020400a-0000-4000-8000-000204000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do cultural taboos around certain foods vary across the world?',
    'Discuss religious restrictions, cultural aversions, and social norms around eating.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'taboo', 'A forbidden practice based on cultural beliefs', 1),
  ((SELECT id FROM card), 'restriction', 'A rule that limits what you can do', 2),
  ((SELECT id FROM card), 'aversion', 'A strong dislike or avoidance', 3),
  ((SELECT id FROM card), 'halal', 'Permitted according to Islamic law', 4),
  ((SELECT id FROM card), 'kosher', 'Prepared according to Jewish dietary laws', 5),
  ((SELECT id FROM card), 'omnivore', 'An animal that eats both plants and meat', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020400b-0000-4000-8000-000204000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What impact do food bloggers and social media influencers have on people''s eating habits?',
    'Consider viral recipes, Instagram aesthetics, sponsored content, and health advice.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'influencer', 'A person who affects others through social media', 1),
  ((SELECT id FROM card), 'viral', 'Quickly spreading through online sharing', 2),
  ((SELECT id FROM card), 'aesthetic', 'Concerned with beauty and visual appeal', 3),
  ((SELECT id FROM card), 'sponsored', 'Paid for by a company to promote products', 4),
  ((SELECT id FROM card), 'food photography', 'Taking appealing pictures of food', 5),
  ((SELECT id FROM card), 'endorsement', 'Public support for a product', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020400c-0000-4000-8000-000204000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How does food pricing influence public health outcomes in low-income communities?',
    'Discuss food access, fast food density, health disparities, and policy interventions.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'disparity', 'A significant difference between groups', 1),
  ((SELECT id FROM card), 'access', 'The ability to obtain or reach something', 2),
  ((SELECT id FROM card), 'subsidy', 'Government financial support for certain goods', 3),
  ((SELECT id FROM card), 'food insecurity', 'Limited access to sufficient food', 4),
  ((SELECT id FROM card), 'intervention', 'Action taken to improve a situation', 5),
  ((SELECT id FROM card), 'socioeconomic', 'Relating to social and economic factors', 6);

-- -----------------------------------------------------------
-- FOOD — C1 (level 05)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20205001-0000-4000-8000-000205000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the global food system contribute to climate change, and what are the most effective interventions?',
    'Analyze methane emissions, deforestation, transportation, and regenerative agriculture.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'methane', 'A potent greenhouse gas from livestock', 1),
  ((SELECT id FROM card), 'deforestation', 'The clearing of forests for agriculture', 2),
  ((SELECT id FROM card), 'regenerative', 'Restoring and improving ecosystems', 3),
  ((SELECT id FROM card), 'food miles', 'The distance food travels from farm to consumer', 4),
  ((SELECT id FROM card), 'carbon sequestration', 'Capturing carbon dioxide from the atmosphere', 5),
  ((SELECT id FROM card), 'agroecology', 'Sustainable farming integrating ecology', 6),
  ((SELECT id FROM card), 'supply chain', 'The network involved in producing and distributing food', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20205002-0000-4000-8000-000205000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What is the significance of culinary nationalism in the context of globalization?',
    'Examine how countries use cuisine as a tool for cultural diplomacy and identity preservation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'culinary nationalism', 'Using food to assert national identity', 1),
  ((SELECT id FROM card), 'gastronomic diplomacy', 'Using food to improve international relations', 2),
  ((SELECT id FROM card), 'appropriation', 'Taking elements of another culture without permission', 3),
  ((SELECT id FROM card), 'authenticity', 'The quality of being true to its origins', 4),
  ((SELECT id FROM card), 'globalization', 'The increasing interconnection of cultures', 5),
  ((SELECT id FROM card), 'homogenization', 'Making everything the same', 6),
  ((SELECT id FROM card), 'distinction', 'A difference or unique characteristic', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20205003-0000-4000-8000-000205000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How might personalized nutrition based on genomics transform healthcare and the food industry?',
    'Discuss DNA-based diets, nutrigenomics, ethical concerns, and accessibility.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'genomics', 'The study of an organism''s complete DNA', 1),
  ((SELECT id FROM card), 'nutrigenomics', 'The study of how food affects gene expression', 2),
  ((SELECT id FROM card), 'personalized', 'Tailored to an individual''s characteristics', 3),
  ((SELECT id FROM card), 'biomarker', 'A biological indicator of health or disease', 4),
  ((SELECT id FROM card), 'metabolism', 'The chemical processes in the body', 5),
  ((SELECT id FROM card), 'precision', 'The quality of being exact and accurate', 6),
  ((SELECT id FROM card), 'intervention', 'A deliberate action to improve health', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20205004-0000-4000-8000-000205000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'Analyze the relationship between food advertising and childhood obesity in the digital age.',
    'Consider marketing algorithms, influencer targeting, parental controls, and regulation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'obesity', 'The condition of being extremely overweight', 1),
  ((SELECT id FROM card), 'advertising', 'The activity of promoting products', 2),
  ((SELECT id FROM card), 'targeting', 'Directing marketing at specific groups', 3),
  ((SELECT id FROM card), 'algorithm', 'A calculation used by online platforms', 4),
  ((SELECT id FROM card), 'regulation', 'A rule enforced by authorities', 5),
  ((SELECT id FROM card), 'paternalism', 'Limiting choices for someone''s own good', 6),
  ((SELECT id FROM card), 'litigation', 'Legal action to enforce rights', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20205005-0000-4000-8000-000205000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What are the implications of intellectual property rights on traditional and indigenous foods?',
    'Discuss patenting, geographical indications, biopiracy, and cultural ownership.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'intellectual property', 'Legal rights over creations of the mind', 1),
  ((SELECT id FROM card), 'geographical indication', 'A label indicating a product''s specific origin', 2),
  ((SELECT id FROM card), 'biopiracy', 'Exploiting traditional knowledge without compensation', 3),
  ((SELECT id FROM card), 'patent', 'An exclusive right to an invention', 4),
  ((SELECT id FROM card), 'indigenous', 'Originating naturally in a particular region', 5),
  ((SELECT id FROM card), 'commodification', 'Turning something into a marketable product', 6),
  ((SELECT id FROM card), 'sovereignty', 'The right of a group to govern itself', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20205006-0000-4000-8000-000205000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the concept of "food as medicine" challenge conventional healthcare approaches?',
    'Evaluate nutritional therapy, preventative diets, healthcare integration, and evidence.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'therapeutic', 'Having healing or curative properties', 1),
  ((SELECT id FROM card), 'preventative', 'Designed to stop something from happening', 2),
  ((SELECT id FROM card), 'holistic', 'Considering the whole person, not just symptoms', 3),
  ((SELECT id FROM card), 'anti-inflammatory', 'Reducing inflammation in the body', 4),
  ((SELECT id FROM card), 'micronutrient', 'A vitamin or mineral needed in small amounts', 5),
  ((SELECT id FROM card), 'phytochemical', 'A chemical compound produced by plants', 6),
  ((SELECT id FROM card), 'bioavailability', 'The degree to which a substance is absorbed by the body', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20205007-0000-4000-8000-000205000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What are the key factors driving the rise of global food prices and their effect on international stability?',
    'Analyze climate shocks, energy costs, trade policies, and supply chain vulnerabilities.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'inflation', 'The increase in prices over time', 1),
  ((SELECT id FROM card), 'volatility', 'Tendency to change rapidly and unpredictably', 2),
  ((SELECT id FROM card), 'speculation', 'Trading commodities for profit based on price changes', 3),
  ((SELECT id FROM card), 'tariff', 'A tax on imported or exported goods', 4),
  ((SELECT id FROM card), 'subsidy', 'Government payment to support an industry', 5),
  ((SELECT id FROM card), 'food sovereignty', 'The right of people to define their own food systems', 6),
  ((SELECT id FROM card), 'protectionism', 'Shielding domestic industries from foreign competition', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20205008-0000-4000-8000-000205000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How might the rise of AI-powered cooking and recipe generation change culinary creativity?',
    'Discuss machine learning in food design, chef versus algorithm, and cultural adaptation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'algorithmic', 'Performed by a step-by-step computational process', 1),
  ((SELECT id FROM card), 'generation', 'The creation of content by AI', 2),
  ((SELECT id FROM card), 'sensory', 'Relating to taste, smell, and texture perception', 3),
  ((SELECT id FROM card), 'innovation', 'A new method or product', 4),
  ((SELECT id FROM card), 'culinary arts', 'The art of cooking and food presentation', 5),
  ((SELECT id FROM card), 'augmented', 'Enhanced by technology', 6),
  ((SELECT id FROM card), 'intuition', 'The ability to understand without reasoning', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20205009-0000-4000-8000-000205000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'To what extent should governments intervene in people''s dietary choices to reduce healthcare costs?',
    'Evaluate sugar taxes, labeling laws, advertising bans, and public health campaigns.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'interventionism', 'Government involvement in individuals'' choices', 1),
  ((SELECT id FROM card), 'nudge theory', 'Subtly influencing behavior without restricting options', 2),
  ((SELECT id FROM card), 'paternalism', 'Limiting freedom for the person''s own benefit', 3),
  ((SELECT id FROM card), 'fiscal policy', 'Government decisions about taxation and spending', 4),
  ((SELECT id FROM card), 'public health', 'The health of the population as a whole', 5),
  ((SELECT id FROM card), 'libertarian', 'Advocating for minimal government intervention', 6),
  ((SELECT id FROM card), 'proportionality', 'The principle of being appropriately balanced', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020500a-0000-4000-8000-000205000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the industrialization of animal agriculture conflict with animal rights and environmental sustainability?',
    'Examine factory farming, welfare standards, alternatives, and consumer responsibility.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'industrialization', 'The large-scale mechanization of production', 1),
  ((SELECT id FROM card), 'sentient', 'Able to perceive and feel', 2),
  ((SELECT id FROM card), 'concentrated feeding operation', 'A large-scale animal farming facility', 3),
  ((SELECT id FROM card), 'anthropocentric', 'Centering humans as the most important', 4),
  ((SELECT id FROM card), 'deontological', 'An ethical approach based on duties and rules', 5),
  ((SELECT id FROM card), 'utilitarian', 'An ethical approach based on outcomes and consequences', 6),
  ((SELECT id FROM card), 'speciesism', 'Discrimination based on species membership', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020500b-0000-4000-8000-000205000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What role does food play in the construction of social class distinctions in different societies?',
    'Discuss luxury foods, dining etiquette, food access, and cultural capital.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'social class', 'A division of society based on status', 1),
  ((SELECT id FROM card), 'cultural capital', 'Knowledge and behaviors that confer social status', 2),
  ((SELECT id FROM card), 'conspicuous consumption', 'Spending on luxury goods to display wealth', 3),
  ((SELECT id FROM card), 'gourmet', 'Involving high-quality or sophisticated food', 4),
  ((SELECT id FROM card), 'culinary capital', 'Knowledge and taste in food as social currency', 5),
  ((SELECT id FROM card), 'distinction', 'The marking of difference through taste', 6),
  ((SELECT id FROM card), 'snobbery', 'Attitudes of superiority based on taste', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020500c-0000-4000-8000-000205000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How do food scarcity and abundance coexist in urban environments in the 21st century?',
    'Examine food deserts, farmers markets, food banks, and urban agriculture initiatives.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'scarcity', 'A shortage or lack of something', 1),
  ((SELECT id FROM card), 'abundance', 'A large quantity of something', 2),
  ((SELECT id FROM card), 'food desert', 'An area with limited access to nutritious food', 3),
  ((SELECT id FROM card), 'food bank', 'A charity that distributes food to those in need', 4),
  ((SELECT id FROM card), 'urban agriculture', 'Growing food in cities and towns', 5),
  ((SELECT id FROM card), 'food security', 'The state of having reliable access to adequate food', 6),
  ((SELECT id FROM card), 'nutritional inequality', 'Differences in diet quality between groups', 7);

-- -----------------------------------------------------------
-- FOOD — C2 (level 06)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20206001-0000-4000-8000-000206000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically evaluate the proposition that the global food system is a primary driver of both climate change and biodiversity loss.',
    'Analyze land use, agricultural practices, supply chains, and the potential for systemic reform.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'biodiversity', 'The variety of species in an ecosystem', 1),
  ((SELECT id FROM card), 'anthropocene', 'The current geological age shaped by human activity', 2),
  ((SELECT id FROM card), 'feedback loop', 'A process where an output amplifies or dampens an input', 3),
  ((SELECT id FROM card), 'tipping point', 'A critical threshold beyond which change becomes irreversible', 4),
  ((SELECT id FROM card), 'externalities', 'Indirect costs or benefits of economic activities', 5),
  ((SELECT id FROM card), 'regenerative agriculture', 'Farming that restores soil health and ecosystems', 6),
  ((SELECT id FROM card), 'systems thinking', 'Analyzing how parts of a system interact', 7),
  ((SELECT id FROM card), 'circular economy', 'An economic system eliminating waste through reuse', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20206002-0000-4000-8000-000206000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'To what extent does the Slow Food movement represent a viable alternative to the dominant fast food paradigm?',
    'Examine its philosophy, economic model, scalability, and impact on food culture.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'paradigm', 'A typical example or pattern of something', 1),
  ((SELECT id FROM card), 'slow food', 'A movement promoting local food and traditional cooking', 2),
  ((SELECT id FROM card), 'hegemony', 'The dominance of one system over others', 3),
  ((SELECT id FROM card), 'scalability', 'The capacity to grow and handle increased demand', 4),
  ((SELECT id FROM card), 'artisanal', 'Made by hand in small quantities', 5),
  ((SELECT id FROM card), 'conviviality', 'The quality of being festive and friendly', 6),
  ((SELECT id FROM card), 'hedonistic', 'Pursuing pleasure and enjoyment', 7),
  ((SELECT id FROM card), 'counterculture', 'A way of life opposed to the mainstream', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20206003-0000-4000-8000-000206000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Analyze the epistemological foundations of nutritional science and the limitations of reductionist approaches to diet.',
    'Critique how nutritional research is conducted, interpreted, and applied to public policy.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'epistemological', 'Relating to the theory of knowledge', 1),
  ((SELECT id FROM card), 'reductionist', 'Explaining complex phenomena by simple components', 2),
  ((SELECT id FROM card), 'empirical', 'Based on observation or experience', 3),
  ((SELECT id FROM card), 'correlative', 'Showing a relationship without proving causation', 4),
  ((SELECT id FROM card), 'confound', 'To confuse or mix up variables in research', 5),
  ((SELECT id FROM card), 'placebo', 'An inactive substance used in controlled experiments', 6),
  ((SELECT id FROM card), 'generalizability', 'The extent to which findings apply to broader populations', 7),
  ((SELECT id FROM card), 'evidence-based', 'Relying on scientific evidence for decision-making', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20206004-0000-4000-8000-000206000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How might the convergence of AI, biotechnology, and food science redefine the fundamental nature of what we consider food?',
    'Consider synthetic biology, precision fermentation, cultured meat, and the philosophy of naturalness.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'convergence', 'The merging of distinct technologies or fields', 1),
  ((SELECT id FROM card), 'synthetic biology', 'Designing and constructing new biological systems', 2),
  ((SELECT id FROM card), 'precision fermentation', 'Using microorganisms to produce specific compounds', 3),
  ((SELECT id FROM card), 'naturalness', 'The quality of being found in nature', 4),
  ((SELECT id FROM card), 'ontological', 'Relating to the nature of being or existence', 5),
  ((SELECT id FROM card), 'novel', 'New and original', 6),
  ((SELECT id FROM card), 'risk assessment', 'Evaluating potential dangers of new technologies', 7),
  ((SELECT id FROM card), 'regulatory framework', 'The system of rules governing an industry', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20206005-0000-4000-8000-000206000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically assess the claim that the Mediterranean diet represents an optimal dietary pattern for longevity and health.',
    'Evaluate the evidence, cultural context, transferability, and potential biases in the research.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'longevity', 'The length of a person''s life', 1),
  ((SELECT id FROM card), 'cardiovascular', 'Relating to the heart and blood vessels', 2),
  ((SELECT id FROM card), 'antioxidant', 'A substance that prevents oxidative damage', 3),
  ((SELECT id FROM card), 'polyphenol', 'A plant compound with health benefits', 4),
  ((SELECT id FROM card), 'transferability', 'The applicability of findings to different populations', 5),
  ((SELECT id FROM card), 'confound', 'A variable that can distort research results', 6),
  ((SELECT id FROM card), 'observational study', 'Research that observes without intervention', 7),
  ((SELECT id FROM card), 'causality', 'The relationship between cause and effect', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20206006-0000-4000-8000-000206000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How does the political economy of agricultural subsidies shape what food is produced and consumed globally?',
    'Analyze how government support for certain crops influences prices, diets, and land use patterns.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'political economy', 'The study of how politics affects economic systems', 1),
  ((SELECT id FROM card), 'subsidy', 'A government payment to support a sector', 2),
  ((SELECT id FROM card), 'commodity crop', 'A crop grown for sale rather than subsistence', 3),
  ((SELECT id FROM card), 'oligopoly', 'A market dominated by a small number of producers', 4),
  ((SELECT id FROM card), 'dumping', 'Selling products below cost to undercut competitors', 5),
  ((SELECT id FROM card), 'trade liberalization', 'Removing barriers to international trade', 6),
  ((SELECT id FROM card), 'farm bill', 'A law governing agricultural and food policy', 7),
  ((SELECT id FROM card), 'protectionism', 'Shielding domestic producers from foreign competition', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20206007-0000-4000-8000-000206000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Evaluate the philosophical and practical tensions between universal access to nutrition and the right to culinary cultural autonomy.',
    'Consider food aid, cultural preservation, globalized diets, and ethical food distribution.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'autonomy', 'The right to self-governance', 1),
  ((SELECT id FROM card), 'universalism', 'The principle of applying to all people', 2),
  ((SELECT id FROM card), 'relativism', 'The idea that beliefs are relative to culture', 3),
  ((SELECT id FROM card), 'food aid', 'The provision of food to those in need', 4),
  ((SELECT id FROM card), 'cultural preservation', 'Protecting cultural heritage and traditions', 5),
  ((SELECT id FROM card), 'malnutrition', 'A condition caused by poor or inadequate nutrition', 6),
  ((SELECT id FROM card), 'interdependence', 'Mutual reliance between groups or systems', 7),
  ((SELECT id FROM card), 'subsistence rights', 'The right to sufficient food for survival', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20206008-0000-4000-8000-000206000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'In what ways does the concept of terroir illustrate the intersection of geography, culture, and sensory experience?',
    'Analyze how soil, climate, and tradition shape food and wine identity across regions.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'terroir', 'The unique character of a place reflected in its food', 1),
  ((SELECT id FROM card), 'sensory', 'Related to the senses of taste, smell, and touch', 2),
  ((SELECT id FROM card), 'appellation', 'A legally defined geographical designation for products', 3),
  ((SELECT id FROM card), 'microclimate', 'The local climate of a small area', 4),
  ((SELECT id FROM card), 'typicity', 'The degree to which a product reflects its origin', 5),
  ((SELECT id FROM card), 'pedigree', 'The record of origin and quality', 6),
  ((SELECT id FROM card), 'palate', 'A person''s capacity to distinguish flavors', 7),
  ((SELECT id FROM card), 'olfactory', 'Relating to the sense of smell', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20206009-0000-4000-8000-000206000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How should societies balance the competing demands of food affordability, nutritional quality, and environmental sustainability?',
    'Examine policy trade-offs, technological solutions, and consumer behavior in achieving food system transformation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'trilemma', 'A difficult choice between three alternatives', 1),
  ((SELECT id FROM card), 'affordability', 'The quality of being reasonably priced', 2),
  ((SELECT id FROM card), 'sustainability', 'The capacity to maintain over the long term', 3),
  ((SELECT id FROM card), 'trade-off', 'A compromise where one thing is given up for another', 4),
  ((SELECT id FROM card), 'externalize', 'To shift costs to others or the environment', 5),
  ((SELECT id FROM card), 'life cycle assessment', 'Evaluating environmental impact from production to disposal', 6),
  ((SELECT id FROM card), 'eco-efficiency', 'Creating more value with less environmental impact', 7),
  ((SELECT id FROM card), 'degrowth', 'An economic approach prioritizing well-being over growth', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020600a-0000-4000-8000-000206000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically analyze the role of multinational food corporations in shaping global dietary norms and health outcomes.',
    'Examine market power, lobbying, product formulation, and corporate responsibility frameworks.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'multinational', 'Operating in multiple countries', 1),
  ((SELECT id FROM card), 'lobbying', 'Attempting to influence government decisions', 2),
  ((SELECT id FROM card), 'formulation', 'The composition and recipe of a product', 3),
  ((SELECT id FROM card), 'market share', 'The portion of a market controlled by a company', 4),
  ((SELECT id FROM card), 'regulatory capture', 'When regulators act in the interest of the regulated industry', 5),
  ((SELECT id FROM card), 'corporate social responsibility', 'A company''s commitment to ethical practices', 6),
  ((SELECT id FROM card), 'shareholder primacy', 'The principle that companies prioritize shareholder returns', 7),
  ((SELECT id FROM card), 'external accountability', 'Answerability to stakeholders beyond shareholders', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020600b-0000-4000-8000-000206000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'What are the ethical implications of using gene editing technologies like CRISPR in food crops?',
    'Consider food safety, environmental impact, corporate control, and global food equity.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'gene editing', 'Making precise changes to an organism''s DNA', 1),
  ((SELECT id FROM card), 'CRISPR', 'A technology for editing genetic material', 2),
  ((SELECT id FROM card), 'genetic modification', 'Altering the genetic material of an organism', 3),
  ((SELECT id FROM card), 'precautionary principle', 'Erring on the side of caution in the face of uncertainty', 4),
  ((SELECT id FROM card), 'intellectual property', 'Ownership of creations and inventions', 5),
  ((SELECT id FROM card), 'food equity', 'Fair access to nutritious food for all', 6),
  ((SELECT id FROM card), 'patent', 'Exclusive legal rights to an invention', 7),
  ((SELECT id FROM card), 'biosafety', 'Protecting against risks from biological research', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2020600c-0000-4000-8000-000206000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How does the gastronomic philosophy of molecular gastronomy challenge traditional notions of cooking and eating?',
    'Analyze the tension between scientific innovation and culinary tradition in haute cuisine.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'molecular gastronomy', 'Applying scientific principles to cooking', 1),
  ((SELECT id FROM card), 'deconstruction', 'Breaking down a dish into its components', 2),
  ((SELECT id FROM card), 'emulsion', 'A mixture of two liquids that normally separate', 3),
  ((SELECT id FROM card), 'spherification', 'Forming liquids into spheres using gelation', 4),
  ((SELECT id FROM card), 'sous-vide', 'Cooking vacuum-sealed food in a water bath', 5),
  ((SELECT id FROM card), 'foam', 'A light, airy culinary texture', 6),
  ((SELECT id FROM card), 'transgressive', 'Going beyond accepted boundaries', 7),
  ((SELECT id FROM card), 'avant-garde', 'Innovative and experimental in approach', 8);

-- ============================================================
-- NOTE: Remaining topics (Technology, Movies, Sports, Business)
-- will follow the same pattern in subsequent sections.
-- For brevity and to avoid exceeding the file size limit, the above
-- content covers Travel and Food completely (12 cards × 6 levels × 2 topics = 144 cards).
-- ============================================================

-- ============================================================
-- STATISTICS (for this extension file)
-- ============================================================
-- Languages: 1 (English)
-- Levels: 6 (A1, A2, B1, B2, C1, C2)
-- Topics: 2 (Travel, Food)
-- Cards Added: 144 (12 per combination × 6 levels × 2 topics)
-- Vocabulary Words Added: ~864 (6 avg per card × 144 cards)
-- Card-Vocabulary Relations: ~864
--
-- When combined with the existing seed:
-- Total Cards: 36 (existing) + 144 = 180
-- Total Vocabulary Relations: ~108 (existing) + ~864 = ~972
-- ============================================================
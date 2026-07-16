-- ============================================================
-- Let's Talk — Seed Data Extension: Vacations & Phone Calls
-- Additional topics following the same format as seed.sql
-- ============================================================

-- 3. TOPICS (Additional)
-- ============================================================

INSERT INTO topics (id, name, slug, description, icon) VALUES
  ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Vacations', 'vacations', 'Conversations about holiday experiences, relaxation, and travel destinations', '🏖️'),
  ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'Phone Calls', 'phone-calls', 'Discussions about phone conversations, communication, and calling experiences', '📞')
ON CONFLICT (slug) DO NOTHING;

-- 4. CARDS AND VOCABULARY
-- ============================================================
-- English cards for 6 levels × 3 cards per level × 2 topics = 36 cards
-- Each card has 4 vocabulary words

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
-- Vacations: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17
-- Phone Calls: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18

-- ============================================================
-- TOPIC: VACATIONS - English
-- ============================================================

-- A1 - Vacations (Card 1)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0061-4000-8000-000000000061', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Where do you like to go on vacation? What do you do there?',
    'Talk about a place you enjoy visiting and activities you like to do.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'vacation', 'Time away from work for pleasure', 1),
  ((SELECT id FROM card), 'beach', 'Sandy land next to the ocean', 2),
  ((SELECT id FROM card), 'relax', 'To rest and enjoy yourself', 3),
  ((SELECT id FROM card), 'sun', 'The bright star in the sky', 4);

-- A1 - Vacations (Card 2)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0061-4000-8000-000000000062', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Do you like to travel? Where did you go last time?',
    'Talk about a place you visited and how you got there.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'travel', 'To go to different places', 1),
  ((SELECT id FROM card), 'trip', 'A journey to a place', 2),
  ((SELECT id FROM card), 'plane', 'An airplane for flying', 3),
  ((SELECT id FROM card), 'journey', 'A long trip from one place to another', 4);

-- A1 - Vacations (Card 3)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0061-4000-8000-000000000063', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What do you pack for a vacation? What is important to bring?',
    'Talk about things you need for traveling.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'pack', 'To put things in a bag', 1),
  ((SELECT id FROM card), 'suitcase', 'A large bag for traveling', 2),
  ((SELECT id FROM card), 'important', 'Very necessary or significant', 3),
  ((SELECT id FROM card), 'clothes', 'Items you wear', 4);

-- A2 - Vacations (Card 1)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0062-4000-8000-000000000064', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Describe your ideal vacation. Where would you go and what would you do?',
    'Talk about the perfect place for you to relax and have fun.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'ideal', 'Perfect or best possible', 1),
  ((SELECT id FROM card), 'destination', 'A place someone is going to', 2),
  ((SELECT id FROM card), 'activity', 'Something you do for enjoyment', 3),
  ((SELECT id FROM card), 'perfect', 'Without any mistakes', 4);

-- A2 - Vacations (Card 2)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0062-4000-8000-000000000065', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is the best season for vacation? Why do you like that season?',
    'Talk about summer, winter, spring, or fall and activities for each.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'season', 'One of the four parts of the year', 1),
  ((SELECT id FROM card), 'summer', 'The warmest time of year', 2),
  ((SELECT id FROM card), 'skiing', 'A winter sport on snow', 3),
  ((SELECT id FROM card), 'winter', 'The coldest time of year', 4);

-- A2 - Vacations (Card 3)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0062-4000-8000-000000000066', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Do you like to stay in hotels or rent apartments when traveling? Why?',
    'Compare different types of accommodation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'hotel', 'A building with rooms for guests', 1),
  ((SELECT id FROM card), 'apartment', 'A set of rooms for living', 2),
  ((SELECT id FROM card), 'comfortable', 'Making you feel relaxed', 3),
  ((SELECT id FROM card), 'room', 'A space inside a building', 4);

-- B1 - Vacations (Card 1)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0063-4000-8000-000000000067', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What makes a vacation memorable? Share an experience from your last trip.',
    'Talk about people, places, or events that made your vacation special.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'memorable', 'Worth remembering', 1),
  ((SELECT id FROM card), 'experience', 'Something that happened to you', 2),
  ((SELECT id FROM card), 'itinerary', 'A plan of your trip activities', 3),
  ((SELECT id FROM card), 'special', 'Different from normal in a good way', 4);

-- B1 - Vacations (Card 2)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0063-4000-8000-000000000068', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you plan your vacations? Do you like to plan everything or be spontaneous?',
    'Talk about your vacation planning style and preferences.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'spontaneous', 'Done without planning', 1),
  ((SELECT id FROM card), 'organize', 'To arrange things in order', 2),
  ((SELECT id FROM card), 'adventure', 'An unusual and exciting experience', 3),
  ((SELECT id FROM card), 'plan', 'To think about what you will do', 4);

-- B1 - Vacations (Card 3)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0063-4000-8000-000000000069', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What are the benefits of taking regular vacations? How do they affect your well-being?',
    'Discuss the importance of rest and time off.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'benefit', 'A helpful result', 1),
  ((SELECT id FROM card), 'well-being', 'The state of being comfortable and happy', 2),
  ((SELECT id FROM card), 'stress', 'Worry or pressure', 3),
  ((SELECT id FROM card), 'rest', 'Time to relax and recover', 4);

-- B2 - Vacations (Card 1)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0064-4000-8000-000000000070', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do different cultures approach vacation time? Compare your country with another.',
    'Think about work-life balance, holiday traditions, and travel habits.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'culture', 'The customs and beliefs of a group', 1),
  ((SELECT id FROM card), 'work-life balance', 'The balance between work and free time', 2),
  ((SELECT id FROM card), 'tradition', 'A custom passed down through generations', 3),
  ((SELECT id FROM card), 'habit', 'A regular way of behaving', 4);

-- B2 - Vacations (Card 2)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0064-4000-8000-000000000071', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the advantages of budget travel versus luxury travel? Which do you prefer?',
    'Consider cost, comfort, and authentic experiences.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'budget', 'A plan for how much money to spend', 1),
  ((SELECT id FROM card), 'luxury', 'Expensive and comfortable', 2),
  ((SELECT id FROM card), 'authentic', 'Real and genuine', 3),
  ((SELECT id FROM card), 'cost', 'The amount of money needed', 4);

-- B2 - Vacations (Card 3)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0064-4000-8000-000000000072', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How has the pandemic changed the way people take vacations?',
    'Discuss travel restrictions, staycations, and new travel trends.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'pandemic', 'A disease spreading worldwide', 1),
  ((SELECT id FROM card), 'restriction', 'A rule limiting what you can do', 2),
  ((SELECT id FROM card), 'quarantine', 'Isolation to prevent disease spread', 3),
  ((SELECT id FROM card), 'travel', 'To go to different places', 4);

-- C1 - Vacations (Card 1)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0065-4000-8000-000000000073', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'Should companies provide unlimited vacation days? Discuss the pros and cons.',
    'Consider employee well-being, productivity, and company culture.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'unlimited', 'Not restricted in amount', 1),
  ((SELECT id FROM card), 'well-being', 'The state of being comfortable and happy', 2),
  ((SELECT id FROM card), 'policy', 'An official plan of action', 3),
  ((SELECT id FROM card), 'employee', 'A person who works for a company', 4);

-- C1 - Vacations (Card 2)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0065-4000-8000-000000000074', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What is the impact of mass tourism on popular destinations?',
    'Consider environmental damage, local economy, and cultural changes.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'tourism', 'Travel for pleasure and business', 1),
  ((SELECT id FROM card), 'environmental', 'Relating to nature and surroundings', 2),
  ((SELECT id FROM card), 'sustainable', 'Not causing harm to the environment', 3),
  ((SELECT id FROM card), 'damage', 'Harm or destruction', 4);

-- C1 - Vacations (Card 3)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0065-4000-8000-000000000075', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How do gap year travels contribute to personal development?',
    'Discuss self-discovery, independence, and cultural awareness.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'development', 'The process of growing or improving', 1),
  ((SELECT id FROM card), 'independence', 'Freedom to make your own decisions', 2),
  ((SELECT id FROM card), 'awareness', 'Knowledge and understanding', 3),
  ((SELECT id FROM card), 'self-discovery', 'Learning about yourself', 4);

-- C2 - Vacations (Card 1)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0066-4000-8000-000000000076', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically analyze the concept of "staycations" versus international travel. What are the implications for personal growth and cultural understanding?',
    'Discuss cost, time constraints, cultural exposure, and personal development.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'staycation', 'A vacation spent at home or nearby', 1),
  ((SELECT id FROM card), 'implication', 'A conclusion you can draw', 2),
  ((SELECT id FROM card), 'cultural exposure', 'Experience of different cultures', 3),
  ((SELECT id FROM card), 'analyze', 'To examine something in detail', 4);

-- C2 - Vacations (Card 2)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0066-4000-8000-000000000077', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Evaluate the role of social media in creating unrealistic vacation expectations.',
    'Consider Instagram culture, FOMO, and authentic experiences.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'unrealistic', 'Not based on what is real', 1),
  ((SELECT id FROM card), 'expectation', 'What you think will happen', 2),
  ((SELECT id FROM card), 'curated', 'Carefully selected and arranged', 3),
  ((SELECT id FROM card), 'social media', 'Websites for social interaction', 4);

-- C2 - Vacations (Card 3)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0066-4000-8000-000000000078', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Assess the future of travel in the context of climate change and environmental concerns.',
    'Discuss carbon footprint, eco-tourism, and responsible travel.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'climate change', 'Long-term changes in weather patterns', 1),
  ((SELECT id FROM card), 'carbon footprint', 'The amount of carbon dioxide produced', 2),
  ((SELECT id FROM card), 'eco-tourism', 'Travel that protects the environment', 3),
  ((SELECT id FROM card), 'environmental', 'Relating to nature and surroundings', 4);

-- ============================================================
-- TOPIC: PHONE CALLS - English
-- ============================================================

-- A1 - Phone Calls (Card 1)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0071-4000-8000-000000000079', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'How often do you call your family? What do you talk about?',
    'Describe your phone conversations with relatives.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'family', 'Your relatives', 1),
  ((SELECT id FROM card), 'relative', 'A family member', 2),
  ((SELECT id FROM card), 'conversation', 'Talking with someone', 3),
  ((SELECT id FROM card), 'often', 'Many times', 4);

-- A1 - Phone Calls (Card 2)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0071-4000-8000-000000000080', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Who do you call when you need help? What do you say?',
    'Talk about asking for help on the phone.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'help', 'Assistance or support', 1),
  ((SELECT id FROM card), 'emergency', 'A sudden serious problem', 2),
  ((SELECT id FROM card), 'number', 'A phone number to call', 3),
  ((SELECT id FROM card), 'call', 'To telephone someone', 4);

-- A1 - Phone Calls (Card 3)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0071-4000-8000-000000000081', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is the first thing you do when you get a phone call?',
    'Describe how you answer the phone.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'answer', 'To pick up the phone and speak', 1),
  ((SELECT id FROM card), 'ring', 'The sound a phone makes', 2),
  ((SELECT id FROM card), 'hello', 'What you say when answering', 3),
  ((SELECT id FROM card), 'phone', 'A device for making calls', 4);

-- A2 - Phone Calls (Card 1)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0072-4000-8000-000000000082', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Do you prefer calling or texting? Why? Give examples of when you use each.',
    'Compare phone calls and messages for different situations.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'prefer', 'To like something more than another thing', 1),
  ((SELECT id FROM card), 'texting', 'Sending written messages on a phone', 2),
  ((SELECT id FROM card), 'situation', 'A particular set of circumstances', 3),
  ((SELECT id FROM card), 'message', 'A written or spoken communication', 4);

-- A2 - Phone Calls (Card 2)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0072-4000-8000-000000000083', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you make an appointment by phone? What do you need to know?',
    'Talk about scheduling and confirming details.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'appointment', 'A planned meeting with someone', 1),
  ((SELECT id FROM card), 'schedule', 'To arrange a time for something', 2),
  ((SELECT id FROM card), 'confirm', 'To make sure something is correct', 3),
  ((SELECT id FROM card), 'time', 'When something happens', 4);

-- A2 - Phone Calls (Card 3)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0072-4000-8000-000000000084', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What do you do when you miss a phone call? How do you return the call?',
    'Describe calling back someone who tried to reach you.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'miss', 'To not answer when someone calls', 1),
  ((SELECT id FROM card), 'return', 'To call back someone', 2),
  ((SELECT id FROM card), 'voicemail', 'A recorded message system', 3),
  ((SELECT id FROM card), 'leave', 'To go away from a place', 4);

-- B1 - Phone Calls (Card 1)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0073-4000-8000-000000000085', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How has the way we make phone calls changed in the last 20 years? What do you think about these changes?',
    'Talk about technology, apps, and communication habits.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'changed', 'Made different', 1),
  ((SELECT id FROM card), 'technology', 'Modern machines and methods', 2),
  ((SELECT id FROM card), 'habit', 'A regular way of behaving', 3),
  ((SELECT id FROM card), 'think', 'To use your mind to consider something', 4);

-- B1 - Phone Calls (Card 2)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0073-4000-8000-000000000086', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'When do you prefer to have important conversations in person versus on the phone?',
    'Compare face-to-face and phone communication.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'prefer', 'To like something more', 1),
  ((SELECT id FROM card), 'face-to-face', 'In person, not by phone', 2),
  ((SELECT id FROM card), 'important', 'Very significant or necessary', 3),
  ((SELECT id FROM card), 'person', 'A human being', 4);

-- B1 - Phone Calls (Card 3)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0073-4000-8000-000000000087', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you handle language barriers when making phone calls in a foreign country?',
    'Talk about using translation apps or asking for help.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'language barrier', 'Difficulty communicating in another language', 1),
  ((SELECT id FROM card), 'translation', 'Changing words from one language to another', 2),
  ((SELECT id FROM card), 'foreign', 'From another country', 3),
  ((SELECT id FROM card), 'handle', 'To deal with something', 4);

-- B2 - Phone Calls (Card 1)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0074-4000-8000-000000000088', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the advantages and disadvantages of video calls compared to regular phone calls? When do you prefer each?',
    'Consider connection quality, personal touch, and practical situations.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'advantage', 'A benefit or positive aspect', 1),
  ((SELECT id FROM card), 'disadvantage', 'A downside or negative aspect', 2),
  ((SELECT id FROM card), 'video call', 'A call with live video', 3),
  ((SELECT id FROM card), 'regular', 'Normal or usual', 4);

-- B2 - Phone Calls (Card 2)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0074-4000-8000-000000000089', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do phone scams work and how can people protect themselves?',
    'Discuss common tactics and safety measures.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'scam', 'A trick to steal money', 1),
  ((SELECT id FROM card), 'protect', 'To keep safe from harm', 2),
  ((SELECT id FROM card), 'tactic', 'A planned way to achieve something', 3),
  ((SELECT id FROM card), 'people', 'Human beings', 4);

-- B2 - Phone Calls (Card 3)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0074-4000-8000-000000000090', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What is the etiquette for professional phone calls? How does it differ from personal calls?',
    'Consider tone, formality, and appropriate language.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'etiquette', 'The rules of polite behavior', 1),
  ((SELECT id FROM card), 'formality', 'Being serious and proper', 2),
  ((SELECT id FROM card), 'appropriate', 'Suitable for the situation', 3),
  ((SELECT id FROM card), 'professional', 'Relating to work or career', 4);

-- C1 - Phone Calls (Card 1)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0075-4000-8000-000000000091', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How do phone calls contribute to maintaining long-distance relationships? What makes them effective or ineffective?',
    'Discuss emotional connection, communication quality, and relationship maintenance.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'long-distance', 'Far away, especially in a different place', 1),
  ((SELECT id FROM card), 'maintain', 'To keep something going', 2),
  ((SELECT id FROM card), 'effective', 'Producing the desired result', 3),
  ((SELECT id FROM card), 'relationship', 'A connection between people', 4);

-- C1 - Phone Calls (Card 2)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0075-4000-8000-000000000092', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What role do phone calls play in crisis communication and emergency situations?',
    'Consider speed, clarity, and reliability of voice communication.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'crisis', 'A dangerous or difficult situation', 1),
  ((SELECT id FROM card), 'emergency', 'A sudden serious problem', 2),
  ((SELECT id FROM card), 'reliability', 'Being dependable and consistent', 3),
  ((SELECT id FROM card), 'role', 'The function or position of something', 4);

-- C1 - Phone Calls (Card 3)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0075-4000-8000-000000000093', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How has the decline of phone calls among younger generations affected social skills?',
    'Discuss communication patterns, empathy, and social development.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'decline', 'A decrease or reduction', 1),
  ((SELECT id FROM card), 'generation', 'A group of people born around the same time', 2),
  ((SELECT id FROM card), 'empathy', 'Understanding others'' feelings', 3),
  ((SELECT id FROM card), 'social', 'Relating to society or people', 4);

-- C2 - Phone Calls (Card 1)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0076-4000-8000-000000000094', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Analyze the role of phone communication in professional settings. How has remote work affected business calls and meetings?',
    'Consider efficiency, relationship building, and digital communication tools.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'professional', 'Relating to work or career', 1),
  ((SELECT id FROM card), 'efficiency', 'Achieving maximum productivity with minimum wasted effort', 2),
  ((SELECT id FROM card), 'remote work', 'Working from a location away from the office', 3),
  ((SELECT id FROM card), 'business', 'Work or commerce', 4);

-- C2 - Phone Calls (Card 2)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0076-4000-8000-000000000095', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Evaluate the impact of asynchronous communication on the traditional phone call culture.',
    'Consider messaging apps, email, and the future of voice communication.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'asynchronous', 'Not happening at the same time', 1),
  ((SELECT id FROM card), 'communication', 'The act of exchanging information', 2),
  ((SELECT id FROM card), 'culture', 'The customs and practices of a group', 3),
  ((SELECT id FROM card), 'impact', 'The effect or influence of something', 4);

-- C2 - Phone Calls (Card 3)
WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('c101a1aa-0076-4000-8000-000000000096', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically assess the evolution of telephony from analog to digital systems. What are the implications for privacy and security?',
    'Discuss encryption, data storage, and surveillance concerns.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'telephony', 'The technology of transmitting voice', 1),
  ((SELECT id FROM card), 'encryption', 'Converting data to keep it secret', 2),
  ((SELECT id FROM card), 'surveillance', 'Close monitoring of behavior', 3),
  ((SELECT id FROM card), 'evolution', 'A gradual development or change', 4);
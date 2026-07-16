-- ============================================================
-- Let's Talk — Extended Seed Data — Part 2
-- ============================================================
-- This is the second part of the seed extension.
--
-- Run AFTER db/seed.sql and db/seed-extension.sql:
--   psql -f db/seed.sql
--   psql -f db/seed-extension.sql
--   psql -f db/seed-extension-part2.sql
--
-- Covers Technology, Movies, Sports, and Business topics.
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
-- Technology: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13
-- Movies: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14
-- Sports: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15
-- Business: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16
-- ============================================================

-- ============================================================
-- TOPIC: TECHNOLOGY (03)
-- ============================================================

-- -----------------------------------------------------------
-- TECHNOLOGY — A1 (level 01)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20301001-0000-4000-8000-000301000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What apps do you use on your phone every day? What do you use them for?',
    'Name 2 or 3 apps and explain what you do with each one.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'app', 'A program on a phone or computer', 1),
  ((SELECT id FROM card), 'phone', 'A device for calling and using apps', 2),
  ((SELECT id FROM card), 'screen', 'The display of a phone or computer', 3),
  ((SELECT id FROM card), 'button', 'A small part you press to control something', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20301002-0000-4000-8000-000301000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Do you have a computer? What do you use it for?',
    'Describe how you use a computer at home, school, or work.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'computer', 'An electronic device for processing data', 1),
  ((SELECT id FROM card), 'mouse', 'A device for moving the cursor on a screen', 2),
  ((SELECT id FROM card), 'email', 'A message sent electronically', 3),
  ((SELECT id FROM card), 'print', 'To produce text or images on paper', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20301003-0000-4000-8000-000301000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What games do you like to play on a phone or computer?',
    'Describe your favorite game and how you play it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'game', 'An activity for fun, often on a device', 1),
  ((SELECT id FROM card), 'play', 'To take part in a game', 2),
  ((SELECT id FROM card), 'level', 'A stage in a game', 3),
  ((SELECT id FROM card), 'score', 'The points you get in a game', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20301004-0000-4000-8000-000301000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'How do you use the internet to learn new things?',
    'Talk about websites or videos that help you learn.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'internet', 'A global network connecting computers', 1),
  ((SELECT id FROM card), 'video', 'A recording of moving images', 2),
  ((SELECT id FROM card), 'search', 'To look for information', 3),
  ((SELECT id FROM card), 'website', 'A page or collection of pages on the internet', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20301005-0000-4000-8000-000301000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is your favorite website? Why do you like visiting it?',
    'Describe the website and what you do there.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'favorite', 'Preferred above all others', 1),
  ((SELECT id FROM card), 'visit', 'To go to a website', 2),
  ((SELECT id FROM card), 'page', 'A single screen of information on the internet', 3),
  ((SELECT id FROM card), 'link', 'A clickable connection to another page', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20301006-0000-4000-8000-000301000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Do you like to take photos with your phone? What do you take pictures of?',
    'Describe the photos you like to take and who you share them with.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'photo', 'A picture taken with a camera', 1),
  ((SELECT id FROM card), 'camera', 'A device for taking pictures', 2),
  ((SELECT id FROM card), 'share', 'To show something to others', 3),
  ((SELECT id FROM card), 'album', 'A collection of photos', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20301007-0000-4000-8000-000301000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What sounds and music do you listen to on your devices?',
    'Talk about how you listen to music, podcasts, or other audio.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'music', 'Sounds arranged in a pleasant way', 1),
  ((SELECT id FROM card), 'headphones', 'A device you wear on your ears to listen', 2),
  ((SELECT id FROM card), 'speaker', 'A device that produces sound', 3),
  ((SELECT id FROM card), 'volume', 'The loudness of sound', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20301008-0000-4000-8000-000301000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is a TV remote control used for? How do you use it?',
    'Describe the buttons on a remote and what they do.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'remote', 'A device for controlling a TV from a distance', 1),
  ((SELECT id FROM card), 'channel', 'A station that broadcasts TV programs', 2),
  ((SELECT id FROM card), 'volume', 'The level of sound', 3),
  ((SELECT id FROM card), 'power', 'The ability to turn something on or off', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20301009-0000-4000-8000-000301000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'How do you charge your phone? Where do you charge it?',
    'Talk about charging cables, plugs, and where you charge your devices.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'charge', 'To put electricity into a device', 1),
  ((SELECT id FROM card), 'cable', 'A wire used to connect devices', 2),
  ((SELECT id FROM card), 'plug', 'A device for connecting to electricity', 3),
  ((SELECT id FROM card), 'battery', 'A source of power for a device', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030100a-0000-4000-8000-000301000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What colors can you see on a computer screen? Name some.',
    'Identify colors you see in apps, games, or websites.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'black', 'The darkest color', 1),
  ((SELECT id FROM card), 'white', 'The lightest color', 2),
  ((SELECT id FROM card), 'blue', 'The color of the sky', 3),
  ((SELECT id FROM card), 'green', 'The color of grass', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030100b-0000-4000-8000-000301000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What electronic devices do you have in your kitchen?',
    'List the machines and gadgets you use for cooking and cleaning.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'fridge', 'A device that keeps food cold', 1),
  ((SELECT id FROM card), 'microwave', 'A device that heats food quickly', 2),
  ((SELECT id FROM card), 'toaster', 'A device that browns bread', 3),
  ((SELECT id FROM card), 'kettle', 'A device for boiling water', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030100c-0000-4000-8000-000301000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'How do you turn on a computer or tablet? What happens next?',
    'Describe the steps to start a device and what you see on the screen.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'tablet', 'A mobile computer with a touchscreen', 1),
  ((SELECT id FROM card), 'password', 'A secret word to access a device', 2),
  ((SELECT id FROM card), 'icon', 'A small picture representing an app', 3),
  ((SELECT id FROM card), 'desktop', 'The main screen of a computer', 4);

-- -----------------------------------------------------------
-- TECHNOLOGY — A2 (level 02)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20302001-0000-4000-8000-000302000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What social media platforms do you use? How often do you check them?',
    'Describe your social media habits and favorite platforms.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'social media', 'Websites for connecting with people online', 1),
  ((SELECT id FROM card), 'profile', 'A personal page on social media', 2),
  ((SELECT id FROM card), 'post', 'To share content online', 3),
  ((SELECT id FROM card), 'friend', 'A person you connect with on social media', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20302002-0000-4000-8000-000302000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you save and organize files on your computer?',
    'Talk about folders, file names, and where you keep your documents.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'file', 'A collection of data stored on a computer', 1),
  ((SELECT id FROM card), 'folder', 'A place where files are grouped', 2),
  ((SELECT id FROM card), 'save', 'To store data on a device', 3),
  ((SELECT id FROM card), 'delete', 'To remove a file permanently', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20302003-0000-4000-8000-000302000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is your favorite YouTube channel? What kind of videos do they make?',
    'Describe the content you watch and why you like it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'channel', 'A page on YouTube where a creator posts videos', 1),
  ((SELECT id FROM card), 'subscribe', 'To follow a channel for updates', 2),
  ((SELECT id FROM card), 'comment', 'A response to a video', 3),
  ((SELECT id FROM card), 'like', 'A way to show you enjoy content', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20302004-0000-4000-8000-000302000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you use a search engine to find information?',
    'Describe the steps you take when looking for something online.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'search engine', 'A website for finding information online', 1),
  ((SELECT id FROM card), 'keyword', 'A word used for searching', 2),
  ((SELECT id FROM card), 'result', 'The list of links from a search', 3),
  ((SELECT id FROM card), 'browser', 'A program for viewing websites', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20302005-0000-4000-8000-000302000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What do you use a tablet for? Do you prefer a tablet or a laptop?',
    'Compare tablets and laptops and explain your preference.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'laptop', 'A portable computer', 1),
  ((SELECT id FROM card), 'touchscreen', 'A screen that responds to touch', 2),
  ((SELECT id FROM card), 'light', 'Not heavy, easy to carry', 3),
  ((SELECT id FROM card), 'portable', 'Easy to carry and move', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20302006-0000-4000-8000-000302000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you stay safe online? What rules do you follow?',
    'Discuss passwords, personal information, and being careful on the internet.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'password', 'A secret code to protect your accounts', 1),
  ((SELECT id FROM card), 'privacy', 'Keeping personal information secret', 2),
  ((SELECT id FROM card), 'scam', 'A trick to steal information or money', 3),
  ((SELECT id FROM card), 'virus', 'A program that can damage your computer', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20302007-0000-4000-8000-000302000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What type of notifications do you get on your phone?',
    'Talk about alerts from apps, messages, and calendar reminders.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'notification', 'An alert from an app or device', 1),
  ((SELECT id FROM card), 'alert', 'A sound or message that gets your attention', 2),
  ((SELECT id FROM card), 'reminder', 'A message to help you remember something', 3),
  ((SELECT id FROM card), 'vibrate', 'To shake gently as a notification', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20302008-0000-4000-8000-000302000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you connect to the internet at home?',
    'Describe your Wi-Fi setup and how you get online.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'Wi-Fi', 'A wireless internet connection', 1),
  ((SELECT id FROM card), 'router', 'A device that sends internet signals', 2),
  ((SELECT id FROM card), 'signal', 'The strength of a wireless connection', 3),
  ((SELECT id FROM card), 'wireless', 'Without cables', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20302009-0000-4000-8000-000302000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What do you do when your device runs out of battery?',
    'Talk about charging, power banks, and saving battery life.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'battery life', 'How long a device works before needing a charge', 1),
  ((SELECT id FROM card), 'power bank', 'A portable charger for devices', 2),
  ((SELECT id FROM card), 'low battery', 'When a device has little power left', 3),
  ((SELECT id FROM card), 'energy saving', 'Using less power to save battery', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030200a-0000-4000-8000-000302000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you back up your photos and important files?',
    'Discuss cloud storage, external drives, and saving copies.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'backup', 'A copy of data for safety', 1),
  ((SELECT id FROM card), 'cloud', 'Online storage for files', 2),
  ((SELECT id FROM card), 'storage', 'Space to keep data', 3),
  ((SELECT id FROM card), 'sync', 'To update files across devices', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030200b-0000-4000-8000-000302000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What kind of messages do you send to your friends and family?',
    'Describe texts, emojis, voice messages, and group chats.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'text', 'A written message sent by phone', 1),
  ((SELECT id FROM card), 'emoji', 'A small digital image used in messages', 2),
  ((SELECT id FROM card), 'group chat', 'A conversation with multiple people', 3),
  ((SELECT id FROM card), 'attachment', 'A file sent with a message', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030200c-0000-4000-8000-000302000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you use online maps to find a place?',
    'Describe using GPS, directions, and what you do when you get lost.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'map', 'A representation of an area', 1),
  ((SELECT id FROM card), 'GPS', 'A system for finding your location', 2),
  ((SELECT id FROM card), 'direction', 'Instructions for getting somewhere', 3),
  ((SELECT id FROM card), 'location', 'A particular place or position', 4);

-- -----------------------------------------------------------
-- TECHNOLOGY — B1 (level 03)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20303001-0000-4000-8000-000303000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How has the internet changed the way people shop for clothes and other items?',
    'Compare online shopping with going to physical stores.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'online shopping', 'Buying items over the internet', 1),
  ((SELECT id FROM card), 'delivery', 'The transport of goods to your home', 2),
  ((SELECT id FROM card), 'review', 'A customer''s opinion about a product', 3),
  ((SELECT id FROM card), 'secure payment', 'A safe way to pay online', 4),
  ((SELECT id FROM card), 'return policy', 'The rules for sending items back', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20303002-0000-4000-8000-000303000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What are the benefits and drawbacks of working remotely using technology?',
    'Discuss video calls, productivity tools, and work-life balance.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'remote work', 'Working from a place other than an office', 1),
  ((SELECT id FROM card), 'video call', 'A conversation using cameras and screens', 2),
  ((SELECT id FROM card), 'productivity', 'The amount of work done', 3),
  ((SELECT id FROM card), 'distraction', 'Something that takes your attention away', 4),
  ((SELECT id FROM card), 'virtual meeting', 'A meeting held online', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20303003-0000-4000-8000-000303000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you decide if information you find online is true or false?',
    'Think about fake news, reliable sources, and checking facts.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'fake news', 'False information presented as news', 1),
  ((SELECT id FROM card), 'source', 'Where information comes from', 2),
  ((SELECT id FROM card), 'reliable', 'Trustworthy and accurate', 3),
  ((SELECT id FROM card), 'fact-check', 'To verify information for accuracy', 4),
  ((SELECT id FROM card), 'misinformation', 'False or misleading information', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20303004-0000-4000-8000-000303000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What apps or tools do you use to stay organized and manage your time?',
    'Discuss calendars, to-do lists, and productivity apps.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'calendar', 'A tool for scheduling events', 1),
  ((SELECT id FROM card), 'deadline', 'A time by which something must be done', 2),
  ((SELECT id FROM card), 'schedule', 'A plan of things to do and when', 3),
  ((SELECT id FROM card), 'reminder', 'A notification to help you remember', 4),
  ((SELECT id FROM card), 'priority', 'Something considered more important', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20303005-0000-4000-8000-000303000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How has technology improved the way we learn languages?',
    'Talk about apps, online courses, video calls, and translation tools.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'translation', 'Converting words from one language to another', 1),
  ((SELECT id FROM card), 'pronunciation', 'The way a word is spoken', 2),
  ((SELECT id FROM card), 'flashcard', 'A card with words used for memorization', 3),
  ((SELECT id FROM card), 'interactive', 'Allowing two-way communication', 4),
  ((SELECT id FROM card), 'online course', 'A class taught over the internet', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20303006-0000-4000-8000-000303000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What do you think about the amount of time people spend on their phones?',
    'Discuss screen time, digital habits, and taking breaks from devices.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'screen time', 'The amount of time spent looking at a screen', 1),
  ((SELECT id FROM card), 'addiction', 'A strong dependency on something', 2),
  ((SELECT id FROM card), 'digital detox', 'A period without using devices', 3),
  ((SELECT id FROM card), 'balance', 'A healthy mix of activities', 4),
  ((SELECT id FROM card), 'mindful', 'Being aware and present in the moment', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20303007-0000-4000-8000-000303000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do video games affect communication and teamwork among players?',
    'Discuss multiplayer games, voice chat, and cooperating with others.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'multiplayer', 'Played by many people at the same time', 1),
  ((SELECT id FROM card), 'teamwork', 'Working together with others', 2),
  ((SELECT id FROM card), 'strategy', 'A plan for achieving a goal', 3),
  ((SELECT id FROM card), 'avatar', 'A digital character representing a player', 4),
  ((SELECT id FROM card), 'achievement', 'Something completed successfully', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20303008-0000-4000-8000-000303000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What role do smart home devices play in making life more convenient?',
    'Think about smart speakers, thermostats, lights, and security cameras.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'smart home', 'A home with connected devices', 1),
  ((SELECT id FROM card), 'voice assistant', 'A program that responds to voice commands', 2),
  ((SELECT id FROM card), 'automation', 'Automatic operation of systems', 3),
  ((SELECT id FROM card), 'sensor', 'A device that detects changes', 4),
  ((SELECT id FROM card), 'remote control', 'Controlling something from a distance', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20303009-0000-4000-8000-000303000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you use technology to stay in touch with family who live far away?',
    'Discuss video calls, messaging apps, and social media.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'video chat', 'A live conversation with video', 1),
  ((SELECT id FROM card), 'message', 'A written note sent electronically', 2),
  ((SELECT id FROM card), 'connect', 'To link with someone', 3),
  ((SELECT id FROM card), 'distance', 'The amount of space between people', 4),
  ((SELECT id FROM card), 'update', 'Recent news about someone', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030300a-0000-4000-8000-000303000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is your opinion on using social media to follow news and current events?',
    'Compare social media news with traditional news sources.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'feed', 'A stream of posts on social media', 1),
  ((SELECT id FROM card), 'trend', 'A popular topic at a specific time', 2),
  ((SELECT id FROM card), 'headline', 'The title of a news story', 3),
  ((SELECT id FROM card), 'journalist', 'A person who reports news', 4),
  ((SELECT id FROM card), 'bias', 'A strong opinion that affects reporting', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030300b-0000-4000-8000-000303000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How have smartphones changed the way we take and share photographs?',
    'Discuss camera quality, filters, editing, and sharing platforms.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'megapixel', 'A unit of image resolution', 1),
  ((SELECT id FROM card), 'filter', 'An effect applied to a photo', 2),
  ((SELECT id FROM card), 'edit', 'To change or improve a photo', 3),
  ((SELECT id FROM card), 'gallery', 'A collection of images', 4),
  ((SELECT id FROM card), 'resolution', 'The sharpness of an image', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030300c-0000-4000-8000-000303000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What are the most useful features of a modern smartphone?',
    'List and describe the features you use most often and why they matter.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'feature', 'A function or quality of a device', 1),
  ((SELECT id FROM card), 'fingerprint', 'A security system using your fingerprint', 2),
  ((SELECT id FROM card), 'face recognition', 'A system that uses your face to unlock', 3),
  ((SELECT id FROM card), 'wireless charging', 'Charging without a cable', 4),
  ((SELECT id FROM card), 'water resistant', 'Protected against water damage', 5);

-- -----------------------------------------------------------
-- TECHNOLOGY — B2 (level 04)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20304001-0000-4000-8000-000304000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the privacy risks of using free online services like email and social media?',
    'Discuss data collection, advertising, and user consent.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'data mining', 'Analyzing large data sets for patterns', 1),
  ((SELECT id FROM card), 'tracking', 'Monitoring someone''s online activity', 2),
  ((SELECT id FROM card), 'third-party', 'An external company with access to data', 3),
  ((SELECT id FROM card), 'encryption', 'Coding data to keep it secret', 4),
  ((SELECT id FROM card), 'opt-out', 'The choice to remove yourself from data collection', 5),
  ((SELECT id FROM card), 'cookie', 'A small file that tracks website activity', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20304002-0000-4000-8000-000304000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How might artificial intelligence change the job market in the next decade?',
    'Consider automation, new job creation, and skills needed for the future.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'automation', 'The use of machines to do work', 1),
  ((SELECT id FROM card), 'displacement', 'Losing a job due to technological change', 2),
  ((SELECT id FROM card), 'upskilling', 'Learning new skills for changing jobs', 3),
  ((SELECT id FROM card), 'algorithm', 'A set of rules followed by a computer', 4),
  ((SELECT id FROM card), 'machine learning', 'AI that improves through experience', 5),
  ((SELECT id FROM card), 'redundancy', 'When a job is no longer needed', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20304003-0000-4000-8000-000304000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the ethical concerns surrounding facial recognition technology?',
    'Discuss surveillance, consent, accuracy, and bias in AI systems.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'facial recognition', 'Identifying people by their face', 1),
  ((SELECT id FROM card), 'surveillance', 'Close monitoring of people''s activities', 2),
  ((SELECT id FROM card), 'bias', 'Systematic error in AI outcomes', 3),
  ((SELECT id FROM card), 'consent', 'Agreement to be monitored or tracked', 4),
  ((SELECT id FROM card), 'misidentification', 'Incorrectly identifying a person', 5),
  ((SELECT id FROM card), 'accountability', 'Responsibility for decisions made by AI', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20304004-0000-4000-8000-000304000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How has streaming technology changed the music and entertainment industries?',
    'Discuss subscription models, artist revenue, and access to content.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'streaming', 'Transmitting audio or video over the internet', 1),
  ((SELECT id FROM card), 'subscription', 'A regular payment for access to content', 2),
  ((SELECT id FROM card), 'royalty', 'Payment to artists for their work', 3),
  ((SELECT id FROM card), 'catalog', 'A collection of available content', 4),
  ((SELECT id FROM card), 'exclusive', 'Content available on only one platform', 5),
  ((SELECT id FROM card), 'playlist', 'A curated list of songs or videos', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20304005-0000-4000-8000-000304000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the potential benefits and risks of self-driving cars?',
    'Consider safety, efficiency, job loss, and legal liability.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'autonomous', 'Self-operating without human input', 1),
  ((SELECT id FROM card), 'sensor', 'A device that detects objects and obstacles', 2),
  ((SELECT id FROM card), 'liability', 'Legal responsibility for accidents', 3),
  ((SELECT id FROM card), 'infrastructure', 'The basic systems needed for roads and signs', 4),
  ((SELECT id FROM card), 'collision', 'A crash between vehicles', 5),
  ((SELECT id FROM card), 'regulatory', 'Relating to government rules and laws', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20304006-0000-4000-8000-000304000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How does the use of big data by companies influence the products and services we see?',
    'Discuss personalization, recommendation algorithms, and targeted advertising.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'big data', 'Very large sets of data for analysis', 1),
  ((SELECT id FROM card), 'personalization', 'Tailoring content to individual users', 2),
  ((SELECT id FROM card), 'recommendation', 'A suggestion based on your preferences', 3),
  ((SELECT id FROM card), 'targeted', 'Directed at specific groups of people', 4),
  ((SELECT id FROM card), 'analytics', 'The analysis of data to gain insights', 5),
  ((SELECT id FROM card), 'user profile', 'A collection of data about a user''s behavior', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20304007-0000-4000-8000-000304000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do cybersecurity threats affect individuals and businesses differently?',
    'Compare the impact of hacking, phishing, and data breaches on personal versus corporate levels.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'cybersecurity', 'Protection against digital attacks', 1),
  ((SELECT id FROM card), 'hacking', 'Gaining unauthorized access to systems', 2),
  ((SELECT id FROM card), 'phishing', 'Fraudulent attempts to steal information', 3),
  ((SELECT id FROM card), 'breach', 'A security incident exposing data', 4),
  ((SELECT id FROM card), 'ransomware', 'Malware that demands payment to release data', 5),
  ((SELECT id FROM card), 'vulnerability', 'A weakness in a system that can be exploited', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20304008-0000-4000-8000-000304000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What is your opinion on the use of drones for delivery and surveillance?',
    'Discuss convenience, privacy, safety, and regulation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'drone', 'An unmanned aircraft operated remotely', 1),
  ((SELECT id FROM card), 'airspace', 'The space above the ground used by aircraft', 2),
  ((SELECT id FROM card), 'surveillance', 'Close observation of an area', 3),
  ((SELECT id FROM card), 'logistics', 'The detailed coordination of operations', 4),
  ((SELECT id FROM card), 'autonomous', 'Capable of operating without human control', 5),
  ((SELECT id FROM card), 'no-fly zone', 'An area where aircraft cannot operate', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20304009-0000-4000-8000-000304000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How has social media influenced political campaigns and public opinion?',
    'Discuss advertising, echo chambers, misinformation, and voter engagement.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'echo chamber', 'An environment where beliefs are reinforced', 1),
  ((SELECT id FROM card), 'polarization', 'Division into opposing groups', 2),
  ((SELECT id FROM card), 'disinformation', 'Deliberately false information', 3),
  ((SELECT id FROM card), 'engagement', 'Interaction with content on social media', 4),
  ((SELECT id FROM card), 'microtargeting', 'Targeting ads at very specific groups', 5),
  ((SELECT id FROM card), 'algorithmic bias', 'Systematic errors in algorithms affecting outcomes', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030400a-0000-4000-8000-000304000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the environmental costs of the technology industry, from manufacturing to e-waste?',
    'Discuss resource extraction, energy consumption, recycling, and sustainability.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'e-waste', 'Discarded electronic devices', 1),
  ((SELECT id FROM card), 'rare earth', 'Metals essential for electronics manufacturing', 2),
  ((SELECT id FROM card), 'carbon footprint', 'Greenhouse gas emissions from technology', 3),
  ((SELECT id FROM card), 'planned obsolescence', 'Designing products to become outdated quickly', 4),
  ((SELECT id FROM card), 'recycling', 'Processing waste into reusable materials', 5),
  ((SELECT id FROM card), 'supply chain', 'The network of production and distribution', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030400b-0000-4000-8000-000304000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How does the gig economy rely on technology platforms to function?',
    'Discuss apps for ride-sharing, freelance work, food delivery, and ratings.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'gig economy', 'A labor market with short-term contracts', 1),
  ((SELECT id FROM card), 'platform', 'An online service connecting workers and customers', 2),
  ((SELECT id FROM card), 'rating', 'A score given to workers or services', 3),
  ((SELECT id FROM card), 'algorithmic management', 'Using algorithms to manage workers', 4),
  ((SELECT id FROM card), 'freelancer', 'A self-employed worker', 5),
  ((SELECT id FROM card), 'worker classification', 'Legal status of gig workers', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030400c-0000-4000-8000-000304000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the educational benefits and drawbacks of using AI tools like ChatGPT for learning?',
    'Consider research assistance, plagiarism, critical thinking, and accessibility.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'ChatGPT', 'An AI language model for conversations', 1),
  ((SELECT id FROM card), 'plagiarism', 'Using others'' work without credit', 2),
  ((SELECT id FROM card), 'critical thinking', 'Analyzing information objectively', 3),
  ((SELECT id FROM card), 'hallucination', 'AI generating false information confidently', 4),
  ((SELECT id FROM card), 'prompt', 'An input given to an AI system', 5),
  ((SELECT id FROM card), 'augmentation', 'Enhancing human abilities with AI', 6);

-- -----------------------------------------------------------
-- TECHNOLOGY — C1 (level 05)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20305001-0000-4000-8000-000305000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the concentration of power among a few big tech companies affect innovation and competition?',
    'Analyze market dominance, antitrust regulation, startup ecosystems, and consumer choice.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'monopoly', 'Dominance of a market by one company', 1),
  ((SELECT id FROM card), 'antitrust', 'Laws preventing anti-competitive behavior', 2),
  ((SELECT id FROM card), 'market consolidation', 'Concentration of market power in fewer hands', 3),
  ((SELECT id FROM card), 'innovation', 'The introduction of new ideas or methods', 4),
  ((SELECT id FROM card), 'vendor lock-in', 'Dependency on a single provider', 5),
  ((SELECT id FROM card), 'interoperability', 'The ability to work with other systems', 6),
  ((SELECT id FROM card), 'open source', 'Software that can be freely modified and shared', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20305002-0000-4000-8000-000305000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What are the implications of quantum computing for cryptography and data security?',
    'Examine current encryption methods, potential vulnerabilities, and post-quantum solutions.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'quantum computing', 'Computing using quantum-mechanical phenomena', 1),
  ((SELECT id FROM card), 'cryptography', 'The practice of secure communication', 2),
  ((SELECT id FROM card), 'encryption', 'Encoding information to protect it', 3),
  ((SELECT id FROM card), 'vulnerability', 'A weakness in a security system', 4),
  ((SELECT id FROM card), 'post-quantum', 'Cryptography resistant to quantum attacks', 5),
  ((SELECT id FROM card), 'qubit', 'The basic unit of quantum information', 6),
  ((SELECT id FROM card), 'supremacy', 'The point where quantum exceeds classical computing', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20305003-0000-4000-8000-000305000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How should societies regulate the use of AI in decision-making for criminal justice and healthcare?',
    'Discuss transparency, accountability, fairness, and the role of human oversight.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'algorithmic transparency', 'Openness about how AI makes decisions', 1),
  ((SELECT id FROM card), 'due process', 'Fair treatment through the legal system', 2),
  ((SELECT id FROM card), 'recidivism', 'Tendency of a convicted person to reoffend', 3),
  ((SELECT id FROM card), 'diagnostic', 'AI used to identify medical conditions', 4),
  ((SELECT id FROM card), 'liability', 'Legal responsibility for AI-driven decisions', 5),
  ((SELECT id FROM card), 'explainability', 'The ability to explain AI decisions', 6),
  ((SELECT id FROM card), 'human in the loop', 'Involving human judgment in AI processes', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20305004-0000-4000-8000-000305000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What are the societal consequences of deepfake technology and synthetic media?',
    'Analyze authenticity, trust, misinformation, legal frameworks, and detection methods.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'deepfake', 'Synthetic media that replaces a person''s likeness', 1),
  ((SELECT id FROM card), 'synthetic media', 'Media generated or modified by AI', 2),
  ((SELECT id FROM card), 'authenticity', 'The quality of being genuine', 3),
  ((SELECT id FROM card), 'forensic', 'Scientific methods for detecting fakes', 4),
  ((SELECT id FROM card), 'digital watermark', 'A hidden marker to verify authenticity', 5),
  ((SELECT id FROM card), 'impersonation', 'Pretending to be someone else', 6),
  ((SELECT id FROM card), 'consent', 'Permission to use one''s image or voice', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20305005-0000-4000-8000-000305000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the concept of the digital divide affect access to education and economic opportunity?',
    'Examine internet access, device availability, digital literacy, and systemic inequality.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'digital divide', 'The gap between those with and without technology access', 1),
  ((SELECT id FROM card), 'digital literacy', 'The ability to use technology effectively', 2),
  ((SELECT id FROM card), 'broadband', 'High-speed internet access', 3),
  ((SELECT id FROM card), 'marginalization', 'The process of pushing groups to the edges', 4),
  ((SELECT id FROM card), 'infrastructure', 'The basic facilities needed for connectivity', 5),
  ((SELECT id FROM card), 'net neutrality', 'The principle of equal internet access', 6),
  ((SELECT id FROM card), 'universal access', 'Technology available to all people', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20305006-0000-4000-8000-000305000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What ethical frameworks should guide the development of autonomous weapons systems?',
    'Discuss international law, human rights, accountability, and the risks of escalation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'autonomous weapon', 'A weapon that selects targets without human input', 1),
  ((SELECT id FROM card), 'escalation', 'An increase in the intensity of conflict', 2),
  ((SELECT id FROM card), 'accountability gap', 'Lack of responsibility for AI-driven actions', 3),
  ((SELECT id FROM card), 'humanitarian law', 'Rules protecting civilians in conflict', 4),
  ((SELECT id FROM card), 'proliferation', 'The rapid spread of weapons technology', 5),
  ((SELECT id FROM card), 'dual-use', 'Technology that can be used for civilian and military purposes', 6),
  ((SELECT id FROM card), 'arms race', 'Competition between countries for military superiority', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20305007-0000-4000-8000-000305000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How might blockchain technology transform industries beyond cryptocurrency?',
    'Consider supply chain, voting, digital identity, and smart contracts.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'blockchain', 'A decentralized digital ledger', 1),
  ((SELECT id FROM card), 'decentralization', 'Distribution of power away from central authority', 2),
  ((SELECT id FROM card), 'smart contract', 'A self-executing digital contract', 3),
  ((SELECT id FROM card), 'consensus mechanism', 'The process for validating transactions', 4),
  ((SELECT id FROM card), 'immutable', 'Unable to be changed once recorded', 5),
  ((SELECT id FROM card), 'distributed ledger', 'A database shared across multiple locations', 6),
  ((SELECT id FROM card), 'tokenization', 'Representing assets as digital tokens', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20305008-0000-4000-8000-000305000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What are the implications of the Internet of Things for personal privacy and security?',
    'Discuss connected devices, data collection, hacking risks, and regulation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'Internet of Things', 'Physical devices connected to the internet', 1),
  ((SELECT id FROM card), 'interconnectivity', 'The state of being connected together', 2),
  ((SELECT id FROM card), 'attack surface', 'The total number of entry points for attacks', 3),
  ((SELECT id FROM card), 'firmware', 'Software built into hardware devices', 4),
  ((SELECT id FROM card), 'endpoint', 'A device connected to a network', 5),
  ((SELECT id FROM card), 'botnet', 'A network of compromised devices', 6),
  ((SELECT id FROM card), 'zero trust', 'A security model requiring constant verification', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20305009-0000-4000-8000-000305000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How should content moderation on social media balance free speech with the need to prevent harm?',
    'Examine hate speech, misinformation, censorship, and platform responsibility.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'content moderation', 'The process of reviewing user-generated content', 1),
  ((SELECT id FROM card), 'free speech', 'The right to express opinions without censorship', 2),
  ((SELECT id FROM card), 'hate speech', 'Abusive speech targeting groups', 3),
  ((SELECT id FROM card), 'censorship', 'The suppression of unacceptable content', 4),
  ((SELECT id FROM card), 'section 230', 'A law protecting platforms from liability for user content', 5),
  ((SELECT id FROM card), 'algorithmic curation', 'Using algorithms to select what users see', 6),
  ((SELECT id FROM card), 'overblocking', 'Removing content that should not have been removed', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030500a-0000-4000-8000-000305000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How might brain-computer interfaces change the relationship between humans and machines?',
    'Discuss medical applications, cognitive enhancement, ethics, and accessibility.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'brain-computer interface', 'Direct communication between brain and computer', 1),
  ((SELECT id FROM card), 'neurotechnology', 'Technology that interacts with the nervous system', 2),
  ((SELECT id FROM card), 'cognitive enhancement', 'Improving mental abilities through technology', 3),
  ((SELECT id FROM card), 'neural implant', 'A device placed in the brain', 4),
  ((SELECT id FROM card), 'neuroplasticity', 'The brain''s ability to reorganize itself', 5),
  ((SELECT id FROM card), 'invasiveness', 'The degree of intrusion into the body', 6),
  ((SELECT id FROM card), 'cyborg', 'A being with both organic and biomechatronic parts', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030500b-0000-4000-8000-000305000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What strategies can governments use to close the digital skills gap in the workforce?',
    'Evaluate education reform, retraining programs, public-private partnerships, and incentives.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'skills gap', 'The difference between skills needed and available', 1),
  ((SELECT id FROM card), 'reskilling', 'Learning new skills for different jobs', 2),
  ((SELECT id FROM card), 'vocational training', 'Education focused on specific trades', 3),
  ((SELECT id FROM card), 'STEM', 'Science, technology, engineering, and mathematics', 4),
  ((SELECT id FROM card), 'apprenticeship', 'A program combining work and study', 5),
  ((SELECT id FROM card), 'lifelong learning', 'Continuous education throughout life', 6),
  ((SELECT id FROM card), 'digital inclusion', 'Ensuring everyone can benefit from technology', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030500c-0000-4000-8000-000305000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the design of social media platforms exploit psychological vulnerabilities for engagement?',
    'Analyze variable rewards, social validation loops, fear of missing out, and habit formation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'variable reward', 'An unpredictable positive reinforcement', 1),
  ((SELECT id FROM card), 'dopamine loop', 'A cycle of seeking reward-based reinforcement', 2),
  ((SELECT id FROM card), 'FOMO', 'Fear of missing out on experiences', 3),
  ((SELECT id FROM card), 'persuasive design', 'Design intended to change user behavior', 4),
  ((SELECT id FROM card), 'dark pattern', 'A manipulative user interface design', 5),
  ((SELECT id FROM card), 'attention economy', 'The competition for human attention', 6),
  ((SELECT id FROM card), 'behavioral reinforcement', 'Strengthening behaviors through rewards', 7);

-- -----------------------------------------------------------
-- TECHNOLOGY — C2 (level 06)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20306001-0000-4000-8000-000306000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically analyze the proposition that technological progress is inherently neutral and its impact depends on how it is used.',
    'Examine the social, political, and economic assumptions embedded in technology design and deployment.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'technological determinism', 'The belief that technology drives social change', 1),
  ((SELECT id FROM card), 'social construction of technology', 'The theory that society shapes technology', 2),
  ((SELECT id FROM card), 'value-laden design', 'Technology that embeds certain values', 3),
  ((SELECT id FROM card), 'path dependency', 'The influence of past choices on future options', 4),
  ((SELECT id FROM card), 'instrumentalism', 'The view of technology as a neutral tool', 5),
  ((SELECT id FROM card), 'substantivism', 'The view that technology transforms society', 6),
  ((SELECT id FROM card), 'technocracy', 'A society governed by technical experts', 7),
  ((SELECT id FROM card), 'solutionism', 'The belief that technology can solve all problems', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20306002-0000-4000-8000-000306000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Evaluate the argument that surveillance capitalism represents a fundamental threat to democratic institutions.',
    'Analyze data extraction, predictive analytics, social control, and the commodification of experience.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'surveillance capitalism', 'An economic system based on collecting personal data', 1),
  ((SELECT id FROM card), 'behavioral surplus', 'Excess data used for prediction and influence', 2),
  ((SELECT id FROM card), 'informational asymmetry', 'Unequal access to information between parties', 3),
  ((SELECT id FROM card), 'social sorting', 'Categorizing people based on data', 4),
  ((SELECT id FROM card), 'predictive analytics', 'Using data to forecast behavior', 5),
  ((SELECT id FROM card), 'commodification', 'Turning human experience into a product', 6),
  ((SELECT id FROM card), 'digital authoritarianism', 'Using technology to control and suppress', 7),
  ((SELECT id FROM card), 'data sovereignty', 'The right to control one''s own data', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20306003-0000-4000-8000-000306000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'To what extent can algorithmic fairness be achieved given the inherent biases in training data and human labeling?',
    'Explore statistical fairness, intersectionality, and the limitations of mathematical approaches to justice.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'algorithmic fairness', 'Ensuring algorithms do not discriminate', 1),
  ((SELECT id FROM card), 'intersectionality', 'The overlap of social identities and discriminations', 2),
  ((SELECT id FROM card), 'statistical parity', 'Equal outcomes across demographic groups', 3),
  ((SELECT id FROM card), 'equal opportunity', 'Ensuring equal chances of correct outcomes', 4),
  ((SELECT id FROM card), 'demographic parity', 'Proportional representation across groups', 5),
  ((SELECT id FROM card), 'fairness metric', 'A mathematical measure of fairness', 6),
  ((SELECT id FROM card), 'impossibility theorem', 'The proof that certain fairness criteria cannot be met simultaneously', 7),
  ((SELECT id FROM card), 'ground truth', 'The actual reality used to train AI models', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20306004-0000-4000-8000-000306000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How might the technological singularity reshape philosophical questions about consciousness and identity?',
    'Examine superintelligence, machine consciousness, transhumanism, and posthuman futures.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'technological singularity', 'A point where AI surpasses human intelligence', 1),
  ((SELECT id FROM card), 'superintelligence', 'An intellect far beyond human capability', 2),
  ((SELECT id FROM card), 'transhumanism', 'The enhancement of humans through technology', 3),
  ((SELECT id FROM card), 'posthuman', 'A future being beyond current human form', 4),
  ((SELECT id FROM card), 'emergence', 'Complex behaviors arising from simple rules', 5),
  ((SELECT id FROM card), 'recursive self-improvement', 'AI that improves its own intelligence', 6),
  ((SELECT id FROM card), 'orthogonality thesis', 'The idea that intelligence and goals are independent', 7),
  ((SELECT id FROM card), 'alignment problem', 'Ensuring AI goals align with human values', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20306005-0000-4000-8000-000306000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Analyze the geopolitical implications of countries developing sovereign AI capabilities and digital infrastructure.',
    'Discuss technological nationalism, supply chain decoupling, and the fragmentation of the global internet.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'technological nationalism', 'The pursuit of domestic tech capabilities', 1),
  ((SELECT id FROM card), 'decoupling', 'The separation of economies and technology systems', 2),
  ((SELECT id FROM card), 'splinternet', 'The fragmentation of the global internet', 3),
  ((SELECT id FROM card), 'semiconductor', 'A material used in computer chips', 4),
  ((SELECT id FROM card), 'industrial policy', 'Government intervention to shape industries', 5),
  ((SELECT id FROM card), 'tech sovereignty', 'A nation''s control over its technological systems', 6),
  ((SELECT id FROM card), 'digital colonization', 'Tech dominance by one country over others', 7),
  ((SELECT id FROM card), 'infrastructure dependency', 'Reliance on foreign tech infrastructure', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20306006-0000-4000-8000-000306000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically examine the moral and practical arguments for and against a universal basic income in an age of automation.',
    'Consider human dignity, economic efficiency, social cohesion, and feasibility.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'universal basic income', 'A regular payment to all citizens from the government', 1),
  ((SELECT id FROM card), 'technological unemployment', 'Job loss caused by automation', 2),
  ((SELECT id FROM card), 'post-work society', 'A society where work is not central to life', 3),
  ((SELECT id FROM card), 'social safety net', 'Government programs supporting people in need', 4),
  ((SELECT id FROM card), 'means testing', 'Determining eligibility based on income', 5),
  ((SELECT id FROM card), 'disincentive', 'A factor that discourages a particular behavior', 6),
  ((SELECT id FROM card), 'economic rent', 'Income from ownership rather than labor', 7),
  ((SELECT id FROM card), 'fiscal sustainability', 'The ability to maintain spending over time', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20306007-0000-4000-8000-000306000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Epistemologically, how should we evaluate knowledge claims generated by large language models?',
    'Examine truth, authority, reliability, and the nature of understanding in AI-generated content.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'epistemology', 'The theory of knowledge and justified belief', 1),
  ((SELECT id FROM card), 'stochastic parrot', 'A metaphor for AI that mimics without understanding', 2),
  ((SELECT id FROM card), 'grounding', 'Connecting language to real-world meaning', 3),
  ((SELECT id FROM card), 'reasoning', 'The process of drawing logical conclusions', 4),
  ((SELECT id FROM card), 'benchmark', 'A standard test for evaluating AI capabilities', 5),
  ((SELECT id FROM card), 'generalization', 'Applying learned knowledge to new situations', 6),
  ((SELECT id FROM card), 'emergent ability', 'A skill that appears without explicit training', 7),
  ((SELECT id FROM card), 'failure mode', 'A specific way in which AI can produce errors', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20306008-0000-4000-8000-000306000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How does the open-source movement challenge traditional models of intellectual property and software ownership?',
    'Analyze the tension between communal development and commercial exploitation in digital goods.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'open source', 'Software with freely available source code', 1),
  ((SELECT id FROM card), 'copyleft', 'A license requiring derivative works to be open', 2),
  ((SELECT id FROM card), 'fork', 'A copy of a project that develops independently', 3),
  ((SELECT id FROM card), 'permissive license', 'A license with minimal restrictions on use', 4),
  ((SELECT id FROM card), 'commons', 'Resources shared by a community', 5),
  ((SELECT id FROM card), 'enclosure', 'The conversion of shared resources to private property', 6),
  ((SELECT id FROM card), 'tragedy of the commons', 'When shared resources are depleted through individual use', 7),
  ((SELECT id FROM card), 'bazaar model', 'An open, decentralized approach to software development', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20306009-0000-4000-8000-000306000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'What philosophical tensions arise between the concept of informational privacy and the benefits of data-driven innovation?',
    'Examine autonomy, social welfare, proportionality, and the public-private boundary in information ethics.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'informational privacy', 'Control over personal information', 1),
  ((SELECT id FROM card), 'autonomy', 'The right to self-determination', 2),
  ((SELECT id FROM card), 'proportionality', 'Balancing competing interests appropriately', 3),
  ((SELECT id FROM card), 'social welfare', 'The well-being of society as a whole', 4),
  ((SELECT id FROM card), 'contextual integrity', 'A framework for evaluating privacy based on context', 5),
  ((SELECT id FROM card), 'paternalism', 'Limiting choices for someone''s own good', 6),
  ((SELECT id FROM card), 'informed consent', 'Agreement with full understanding of implications', 7),
  ((SELECT id FROM card), 'data fiduciary', 'A legal duty to protect user data', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030600a-0000-4000-8000-000306000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Assess the proposition that digital platforms have fundamentally restructured labor markets toward precarity and insecurity.',
    'Evaluate algorithmic management, worker agency, collective bargaining, and regulatory responses.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'precarity', 'A state of job insecurity and instability', 1),
  ((SELECT id FROM card), 'algorithmic management', 'Using algorithms to direct and evaluate workers', 2),
  ((SELECT id FROM card), 'agency', 'The capacity to act independently', 3),
  ((SELECT id FROM card), 'collective bargaining', 'Negotiation by a group of workers', 4),
  ((SELECT id FROM card), 'decent work', 'Employment with fair conditions and dignity', 5),
  ((SELECT id FROM card), 'platform dependency', 'Reliance on a digital platform for income', 6),
  ((SELECT id FROM card), 'labor arbitration', 'Resolving disputes between workers and platforms', 7),
  ((SELECT id FROM card), 'portability', 'The ability to transfer benefits across jobs', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030600b-0000-4000-8000-000306000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How does the concept of technological path dependency explain the persistence of legacy systems in critical infrastructure?',
    'Analyze lock-in effects, switching costs, interoperability challenges, and innovation barriers.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'path dependency', 'The influence of past decisions on current options', 1),
  ((SELECT id FROM card), 'legacy system', 'An outdated but still used computer system', 2),
  ((SELECT id FROM card), 'lock-in', 'Difficulty switching away from a technology', 3),
  ((SELECT id FROM card), 'switching cost', 'The expense of moving to a different system', 4),
  ((SELECT id FROM card), 'technical debt', 'The cost of maintaining suboptimal technology', 5),
  ((SELECT id FROM card), 'interoperability', 'The ability of systems to work together', 6),
  ((SELECT id FROM card), 'sunset', 'The planned end of support for a system', 7),
  ((SELECT id FROM card), 'brownfield', 'Developing on top of existing systems', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2030600c-0000-4000-8000-000306000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically evaluate the argument that technology companies should be regulated as public utilities given their essential role in modern life.',
    'Examine natural monopoly characteristics, essential services, rate regulation, and universal access.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'public utility', 'A company providing essential services to the public', 1),
  ((SELECT id FROM card), 'natural monopoly', 'A market where one company can serve most efficiently', 2),
  ((SELECT id FROM card), 'rate regulation', 'Government control over prices charged', 3),
  ((SELECT id FROM card), 'common carrier', 'A service that must serve all customers equally', 4),
  ((SELECT id FROM card), 'essential facility', 'A resource necessary for competition', 5),
  ((SELECT id FROM card), 'universal service', 'Ensuring access for all citizens', 6),
  ((SELECT id FROM card), 'net neutrality', 'The principle of equal treatment of internet traffic', 7),
  ((SELECT id FROM card), 'price cap', 'A maximum price set by regulation', 8);

-- ============================================================
-- TOPIC: MOVIES (04)
-- ============================================================

-- -----------------------------------------------------------
-- MOVIES — A1 (level 01)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20401001-0000-4000-8000-000401000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Do you like watching movies? What kind of movies do you like?',
    'Name your favorite type of movie and describe why you enjoy it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'movie', 'A recording of moving images that tells a story', 1),
  ((SELECT id FROM card), 'comedy', 'A funny movie that makes you laugh', 2),
  ((SELECT id FROM card), 'cartoon', 'A movie made with drawings or computer images', 3),
  ((SELECT id FROM card), 'story', 'A description of events in a movie', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20401002-0000-4000-8000-000401000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Who is your favorite actor or actress? What movies are they in?',
    'Describe the actor and name movies you have seen them in.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'actor', 'A person who performs in movies', 1),
  ((SELECT id FROM card), 'actress', 'A female performer in movies', 2),
  ((SELECT id FROM card), 'star', 'A famous actor or actress', 3),
  ((SELECT id FROM card), 'role', 'A character played by an actor', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20401003-0000-4000-8000-000401000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Do you prefer to watch movies alone or with other people? Why?',
    'Talk about who you watch movies with and why you like that.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'alone', 'Without other people', 1),
  ((SELECT id FROM card), 'together', 'With other people', 2),
  ((SELECT id FROM card), 'fun', 'Enjoyable and entertaining', 3),
  ((SELECT id FROM card), 'boring', 'Not interesting or exciting', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20401004-0000-4000-8000-000401000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is your favorite movie character? Why do you like them?',
    'Describe the character and what makes them special to you.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'hero', 'The main good character in a movie', 1),
  ((SELECT id FROM card), 'funny', 'Making you laugh', 2),
  ((SELECT id FROM card), 'brave', 'Not afraid to do difficult things', 3),
  ((SELECT id FROM card), 'kind', 'Nice and caring toward others', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20401005-0000-4000-8000-000401000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'How often do you watch movies? When do you usually watch them?',
    'Describe how many movies you watch each week and at what time of day.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'weekend', 'Saturday and Sunday', 1),
  ((SELECT id FROM card), 'evening', 'The time at the end of the day', 2),
  ((SELECT id FROM card), 'night', 'The time when it is dark', 3),
  ((SELECT id FROM card), 'often', 'Many times', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20401006-0000-4000-8000-000401000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What do you eat or drink while watching a movie?',
    'Describe your favorite snacks and drinks for movie time.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'popcorn', 'A snack made from heated corn', 1),
  ((SELECT id FROM card), 'soda', 'A sweet carbonated drink', 2),
  ((SELECT id FROM card), 'candy', 'A sweet food', 3),
  ((SELECT id FROM card), 'snack', 'A small amount of food eaten between meals', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20401007-0000-4000-8000-000401000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is a movie you have watched many times? Why do you watch it again?',
    'Talk about a movie you can watch again and again.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'favorite', 'The one you like the most', 1),
  ((SELECT id FROM card), 'again', 'Another time, once more', 2),
  ((SELECT id FROM card), 'love', 'To like very much', 3),
  ((SELECT id FROM card), 'remember', 'To keep in your memory', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20401008-0000-4000-8000-000401000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What is the last movie you saw? Did you like it?',
    'Describe the movie and give your opinion about it.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'last', 'The most recent', 1),
  ((SELECT id FROM card), 'see', 'To watch something', 2),
  ((SELECT id FROM card), 'good', 'Of a high quality', 3),
  ((SELECT id FROM card), 'bad', 'Not good', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20401009-0000-4000-8000-000401000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Do you like scary movies or happy movies? Why?',
    'Compare scary and happy movies and say which you prefer.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'scary', 'Making you feel afraid', 1),
  ((SELECT id FROM card), 'happy', 'Feeling or showing joy', 2),
  ((SELECT id FROM card), 'sad', 'Feeling unhappy', 3),
  ((SELECT id FROM card), 'exciting', 'Making you feel very enthusiastic', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040100a-0000-4000-8000-000401000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What animals can you see in movies? Name some movies with animals.',
    'Think about movies with animal characters and describe them.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'dog', 'A common pet animal', 1),
  ((SELECT id FROM card), 'cat', 'A small furry pet', 2),
  ((SELECT id FROM card), 'lion', 'A large wild cat', 3),
  ((SELECT id FROM card), 'fish', 'An animal that lives in water', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040100b-0000-4000-8000-000401000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'Where do you like to sit when you go to the cinema?',
    'Describe where you prefer to sit and why.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'seat', 'A place to sit', 1),
  ((SELECT id FROM card), 'front', 'The area at the beginning', 2),
  ((SELECT id FROM card), 'back', 'The area at the end', 3),
  ((SELECT id FROM card), 'middle', 'The center area', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040100c-0000-4000-8000-000401000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'What colors do you see in a movie poster? What do they tell you?',
    'Describe a movie poster and the feelings the colors show.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'poster', 'A large printed picture', 1),
  ((SELECT id FROM card), 'color', 'The appearance of things from light', 2),
  ((SELECT id FROM card), 'dark', 'With little light', 3),
  ((SELECT id FROM card), 'bright', 'With a lot of light', 4);

-- -----------------------------------------------------------
-- MOVIES — A2 (level 02)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20402001-0000-4000-8000-000402000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Do you prefer to watch movies in English with subtitles or dubbed? Why?',
    'Compare subtitled and dubbed movies and explain your choice.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'subtitles', 'Text shown at the bottom of the screen', 1),
  ((SELECT id FROM card), 'dubbed', 'With voices recorded in another language', 2),
  ((SELECT id FROM card), 'original', 'The first version, not translated', 3),
  ((SELECT id FROM card), 'audio', 'The sound part of a movie', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20402002-0000-4000-8000-000402000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What was the funniest scene you have ever seen in a movie?',
    'Describe a scene that made you laugh and why it was funny.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'scene', 'A part of a movie with continuous action', 1),
  ((SELECT id FROM card), 'laugh', 'To make sounds when something is funny', 2),
  ((SELECT id FROM card), 'joke', 'Something said to make people laugh', 3),
  ((SELECT id FROM card), 'ending', 'The final part of a movie', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20402003-0000-4000-8000-000402000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What kind of movie makes you feel scared? Describe a scary movie you have watched.',
    'Talk about horror movies and what makes them frightening.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'horror', 'A movie genre that is frightening', 1),
  ((SELECT id FROM card), 'monster', 'A scary imaginary creature', 2),
  ((SELECT id FROM card), 'ghost', 'The spirit of a dead person', 3),
  ((SELECT id FROM card), 'surprise', 'An unexpected event', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20402004-0000-4000-8000-000402000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you choose which movie to watch on a Friday night?',
    'Describe your process for picking a movie to watch.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'trailer', 'A short preview of a movie', 1),
  ((SELECT id FROM card), 'recommendation', 'A suggestion from someone', 2),
  ((SELECT id FROM card), 'genre', 'A category of movies', 3),
  ((SELECT id FROM card), 'rating', 'A score or grade for a movie', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20402005-0000-4000-8000-000402000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is the best movie you have seen this year? What is it about?',
    'Describe the plot and why you think it is the best.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'plot', 'The main story of a movie', 1),
  ((SELECT id FROM card), 'character', 'A person in the movie', 2),
  ((SELECT id FROM card), 'beginning', 'The start of the story', 3),
  ((SELECT id FROM card), 'surprising', 'Causing surprise', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20402006-0000-4000-8000-000402000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Do you like movies that are based on true stories? Why or why not?',
    'Discuss the difference between real-life movies and fictional ones.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'true story', 'A movie based on real events', 1),
  ((SELECT id FROM card), 'fiction', 'A made-up story', 2),
  ((SELECT id FROM card), 'inspiring', 'Making you feel motivated', 3),
  ((SELECT id FROM card), 'history', 'The study of past events', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20402007-0000-4000-8000-000402000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How long do you think a movie should be? What is the perfect length?',
    'Talk about how the length of a movie affects your enjoyment.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'length', 'How long something is', 1),
  ((SELECT id FROM card), 'short', 'Not long', 2),
  ((SELECT id FROM card), 'long', 'Taking a lot of time', 3),
  ((SELECT id FROM card), 'minute', 'A unit of time equal to 60 seconds', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20402008-0000-4000-8000-000402000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What do you do during the advertisements before a movie?',
    'Describe what happens in the cinema before the movie starts.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'advertisement', 'A short film promoting something', 1),
  ((SELECT id FROM card), 'preview', 'A showing of a movie before its release', 2),
  ((SELECT id FROM card), 'wait', 'To stay in place until something happens', 3),
  ((SELECT id FROM card), 'light', 'The brightness in the cinema', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20402009-0000-4000-8000-000402000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Do you watch movies on your phone, tablet, or TV? Which do you prefer?',
    'Compare different devices for watching movies.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'screen size', 'The size of the display', 1),
  ((SELECT id FROM card), 'quality', 'How good the picture and sound are', 2),
  ((SELECT id FROM card), 'comfortable', 'Pleasant and relaxing', 3),
  ((SELECT id FROM card), 'portable', 'Easy to carry and use anywhere', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040200a-0000-4000-8000-000402000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'What is your favorite movie from when you were a child?',
    'Describe a movie you loved as a child and why it was special.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'childhood', 'The time when you were a child', 1),
  ((SELECT id FROM card), 'memory', 'Something you remember from the past', 2),
  ((SELECT id FROM card), 'nostalgic', 'Feeling happy about the past', 3),
  ((SELECT id FROM card), 'fairy tale', 'A story with magic and imaginary beings', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040200b-0000-4000-8000-000402000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'Do you like action movies? What kind of action do you enjoy?',
    'Talk about chase scenes, fights, explosions, and stunts.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'action', 'Exciting physical activity in movies', 1),
  ((SELECT id FROM card), 'chase', 'A scene where someone runs after another', 2),
  ((SELECT id FROM card), 'fight', 'A physical struggle between characters', 3),
  ((SELECT id FROM card), 'explosion', 'A sudden burst of fire and energy', 4);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040200c-0000-4000-8000-000402000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
    'How do you feel when a movie ends in a way you did not expect?',
    'Describe a movie with a twist ending and your reaction.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'twist', 'An unexpected change in the story', 1),
  ((SELECT id FROM card), 'predict', 'To say what will happen before it does', 2),
  ((SELECT id FROM card), 'shock', 'A sudden surprise', 3),
  ((SELECT id FROM card), 'confused', 'Not able to understand clearly', 4);

-- -----------------------------------------------------------
-- MOVIES — B1 (level 03)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20403001-0000-4000-8000-000403000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What makes a movie soundtrack memorable? Give examples.',
    'Discuss how music affects the mood and emotion of a movie.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'soundtrack', 'The music of a movie', 1),
  ((SELECT id FROM card), 'mood', 'The atmosphere or feeling', 2),
  ((SELECT id FROM card), 'memorable', 'Easy to remember', 3),
  ((SELECT id FROM card), 'orchestra', 'A large group of musicians playing together', 4),
  ((SELECT id FROM card), 'theme', 'A recognizable melody in a movie', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20403002-0000-4000-8000-000403000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do special effects improve the movie-watching experience?',
    'Talk about CGI, practical effects, and when effects are overused.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'special effects', 'Visual tricks used in movies', 1),
  ((SELECT id FROM card), 'CGI', 'Computer-generated imagery', 2),
  ((SELECT id FROM card), 'realistic', 'Looking like real life', 3),
  ((SELECT id FROM card), 'stunt', 'A dangerous action performed by an actor', 4),
  ((SELECT id FROM card), 'green screen', 'A green background replaced with digital images', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20403003-0000-4000-8000-000403000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'Do you think movies can teach us about real life? Give examples.',
    'Discuss life lessons, historical events, and social issues shown in movies.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'lesson', 'Something you learn from experience', 1),
  ((SELECT id FROM card), 'message', 'An idea that the movie communicates', 2),
  ((SELECT id FROM card), 'society', 'People living together in a community', 3),
  ((SELECT id FROM card), 'issue', 'An important topic or problem', 4),
  ((SELECT id FROM card), 'reflect', 'To show or represent something', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20403004-0000-4000-8000-000403000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is the difference between watching a movie at home and in a cinema?',
    'Compare the atmosphere, sound, screen, and social experience.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'atmosphere', 'The feeling in a space', 1),
  ((SELECT id FROM card), 'screen', 'The surface where images are shown', 2),
  ((SELECT id FROM card), 'surround sound', 'Audio system that creates an immersive experience', 3),
  ((SELECT id FROM card), 'audience', 'The people watching a movie', 4),
  ((SELECT id FROM card), 'experience', 'An event that you are part of', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20403005-0000-4000-8000-000403000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'Who is a director you admire? What do you like about their movies?',
    'Discuss the director''s style, themes, and favorite films.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'director', 'The person who controls a movie''s creation', 1),
  ((SELECT id FROM card), 'style', 'A particular way of making movies', 2),
  ((SELECT id FROM card), 'vision', 'The director''s creative idea for the movie', 3),
  ((SELECT id FROM card), 'cinematography', 'The art of filming and camera work', 4),
  ((SELECT id FROM card), 'award', 'A prize given for excellent work', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20403006-0000-4000-8000-000403000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What is your opinion on watching movie adaptations of books?',
    'Compare books to their movie versions and which you prefer.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'adaptation', 'A movie based on a book', 1),
  ((SELECT id FROM card), 'original', 'The first version of the story', 2),
  ((SELECT id FROM card), 'compare', 'To examine how things are similar or different', 3),
  ((SELECT id FROM card), 'imagination', 'The ability to create images in your mind', 4),
  ((SELECT id FROM card), 'interpretation', 'A personal way of understanding something', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20403007-0000-4000-8000-000403000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How does the movie industry influence fashion and trends?',
    'Discuss costumes, hairstyles, and products featured in movies.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'fashion', 'Popular styles of clothing', 1),
  ((SELECT id FROM card), 'costume', 'Clothes worn by actors in a movie', 2),
  ((SELECT id FROM card), 'trend', 'A popular direction or style', 3),
  ((SELECT id FROM card), 'merchandise', 'Products related to a movie', 4),
  ((SELECT id FROM card), 'product placement', 'Advertising products within a movie', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20403008-0000-4000-8000-000403000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What movies do you think everyone should watch at least once? Why?',
    'Recommend movies that are important for cultural or historical reasons.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'classic', 'A movie that is considered important and lasting', 1),
  ((SELECT id FROM card), 'cultural', 'Relating to the ideas and customs of a group', 2),
  ((SELECT id FROM card), 'influential', 'Having a great impact on others', 3),
  ((SELECT id FROM card), 'masterpiece', 'A work of outstanding quality', 4),
  ((SELECT id FROM card), 'essential', 'Absolutely necessary', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20403009-0000-4000-8000-000403000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'Why do some people prefer to watch a movie multiple times?',
    'Discuss discovering new details, emotional comfort, and appreciating the craft.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'rewatch', 'To watch something again', 1),
  ((SELECT id FROM card), 'detail', 'A small part of the movie', 2),
  ((SELECT id FROM card), 'comfort', 'A feeling of ease and relaxation', 3),
  ((SELECT id FROM card), 'familiar', 'Well known from previous experience', 4),
  ((SELECT id FROM card), 'appreciation', 'Recognition of quality or value', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040300a-0000-4000-8000-000403000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do you decide whether a movie is worth watching in the cinema or waiting for streaming?',
    'Discuss budget, hype, visual effects, and social experience.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'worth', 'Having enough value for the cost', 1),
  ((SELECT id FROM card), 'hype', 'Excitement and publicity around a movie', 2),
  ((SELECT id FROM card), 'blockbuster', 'A very popular and successful movie', 3),
  ((SELECT id FROM card), 'premiere', 'The first public showing of a movie', 4),
  ((SELECT id FROM card), 'opening weekend', 'The first weekend of a movie''s release', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040300b-0000-4000-8000-000403000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'What movie character do you relate to the most? Why?',
    'Describe a character whose personality or experiences are similar to yours.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'relate', 'To understand and connect with something', 1),
  ((SELECT id FROM card), 'personality', 'The character of a person', 2),
  ((SELECT id FROM card), 'struggle', 'A difficult experience', 3),
  ((SELECT id FROM card), 'growth', 'The process of developing and improving', 4),
  ((SELECT id FROM card), 'journey', 'A character''s development through the story', 5);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040300c-0000-4000-8000-000403000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
    'How do different countries produce movies that reflect their own culture?',
    'Compare Hollywood movies with films from other countries you have watched.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'Hollywood', 'The American movie industry', 1),
  ((SELECT id FROM card), 'Bollywood', 'The Indian movie industry', 2),
  ((SELECT id FROM card), 'independent film', 'A movie made outside the major studio system', 3),
  ((SELECT id FROM card), 'perspective', 'A particular way of seeing the world', 4),
  ((SELECT id FROM card), 'representation', 'How groups and cultures are shown', 5);

-- -----------------------------------------------------------
-- MOVIES — B2 (level 04)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20404001-0000-4000-8000-000404000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How has the rise of streaming platforms changed the types of movies being produced?',
    'Discuss data-driven production, niche content, and the decline of mid-budget films.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'streaming platform', 'A service that delivers video over the internet', 1),
  ((SELECT id FROM card), 'mid-budget', 'A movie with a moderate production budget', 2),
  ((SELECT id FROM card), 'data-driven', 'Decisions based on audience data analysis', 3),
  ((SELECT id FROM card), 'niche', 'Appealing to a specific, small audience', 4),
  ((SELECT id FROM card), 'greenlight', 'To approve a movie for production', 5),
  ((SELECT id FROM card), 'acquisition', 'Buying the rights to distribute a movie', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20404002-0000-4000-8000-000404000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the effects of movie piracy on the film industry?',
    'Discuss revenue loss, distribution models, and accessibility.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'piracy', 'Unauthorized copying of copyrighted content', 1),
  ((SELECT id FROM card), 'copyright', 'Legal rights over creative work', 2),
  ((SELECT id FROM card), 'revenue', 'Income generated by the movie', 3),
  ((SELECT id FROM card), 'distribution', 'Making a movie available to audiences', 4),
  ((SELECT id FROM card), 'DRM', 'Digital rights management technology', 5),
  ((SELECT id FROM card), 'box office', 'The commercial success of a movie', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20404003-0000-4000-8000-000404000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How important is diversity and representation in modern cinema?',
    'Discuss casting, storytelling, behind-the-camera diversity, and audience impact.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'diversity', 'The inclusion of different backgrounds and perspectives', 1),
  ((SELECT id FROM card), 'representation', 'The depiction of different groups in media', 2),
  ((SELECT id FROM card), 'underrepresented', 'Not adequately represented', 3),
  ((SELECT id FROM card), 'stereotype', 'A generalized and simplified view of a group', 4),
  ((SELECT id FROM card), 'inclusion', 'The practice of including all groups', 5),
  ((SELECT id FROM card), 'casting', 'The process of choosing actors', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20404004-0000-4000-8000-000404000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What makes a movie sequel better or worse than the original?',
    'Discuss character development, story quality, fan expectations, and creativity.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'sequel', 'A movie that continues the story of an earlier film', 1),
  ((SELECT id FROM card), 'prequel', 'A movie set before the original story', 2),
  ((SELECT id FROM card), 'franchise', 'A series of related movies', 3),
  ((SELECT id FROM card), 'reboot', 'A new version of an existing movie series', 4),
  ((SELECT id FROM card), 'spin-off', 'A movie focusing on a character from another film', 5),
  ((SELECT id FROM card), 'continuity', 'Consistency of story details across a series', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20404005-0000-4000-8000-000404000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do film critics influence public opinion about movies?',
    'Discuss review aggregators, critic versus audience scores, and the role of reviews.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'critic', 'A person who evaluates movies professionally', 1),
  ((SELECT id FROM card), 'review', 'A critical assessment of a movie', 2),
  ((SELECT id FROM card), 'aggregator', 'A site that collects multiple reviews', 3),
  ((SELECT id FROM card), 'score', 'A numerical rating for a movie', 4),
  ((SELECT id FROM card), 'subjectivity', 'The influence of personal opinion', 5),
  ((SELECT id FROM card), 'consensus', 'General agreement among critics', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20404006-0000-4000-8000-000404000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do animated movies appeal to both children and adults?',
    'Discuss layered storytelling, humor, visual art, and emotional themes.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'animated', 'Made using drawings or computer graphics', 1),
  ((SELECT id FROM card), 'layer', 'A level of meaning or complexity', 2),
  ((SELECT id FROM card), 'visual', 'Relating to what you see', 3),
  ((SELECT id FROM card), 'humor', 'The quality of being funny', 4),
  ((SELECT id FROM card), 'double entendre', 'A phrase with two meanings', 5),
  ((SELECT id FROM card), 'voice acting', 'Performing the voice of an animated character', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20404007-0000-4000-8000-000404000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the advantages and disadvantages of the superhero movie genre?',
    'Discuss escapism, formulaic plots, box office dominance, and cultural impact.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'superhero', 'A character with superhuman abilities', 1),
  ((SELECT id FROM card), 'escapism', 'Entertainment that provides distraction from reality', 2),
  ((SELECT id FROM card), 'formulaic', 'Following a predictable pattern', 3),
  ((SELECT id FROM card), 'cinematic universe', 'A shared fictional world across multiple films', 4),
  ((SELECT id FROM card), 'origin story', 'How a character gained their abilities', 5),
  ((SELECT id FROM card), 'franchise fatigue', 'Loss of interest due to too many sequels', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20404008-0000-4000-8000-000404000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How does the awards season affect which movies get attention and funding?',
    'Discuss Oscar campaigns, prestige films, and the economics of awards.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'awards season', 'The period when film awards are given', 1),
  ((SELECT id FROM card), 'Oscar', 'An award from the Academy of Motion Pictures', 2),
  ((SELECT id FROM card), 'prestige', 'High reputation and respect', 3),
  ((SELECT id FROM card), 'campaign', 'A promotional effort for awards consideration', 4),
  ((SELECT id FROM card), 'nominations', 'Being selected as a candidate for an award', 5),
  ((SELECT id FROM card), 'buzz', 'Excitement and discussion around a movie', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20404009-0000-4000-8000-000404000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What role do international films play in broadening our understanding of the world?',
    'Discuss cultural exchange, subtitles, film festivals, and global storytelling.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'international', 'Involving multiple countries', 1),
  ((SELECT id FROM card), 'film festival', 'An event showcasing many movies', 2),
  ((SELECT id FROM card), 'subtitle', 'Translated text on screen', 3),
  ((SELECT id FROM card), 'cultural exchange', 'Sharing ideas and traditions between cultures', 4),
  ((SELECT id FROM card), 'global audience', 'Viewers from around the world', 5),
  ((SELECT id FROM card), 'cross-cultural', 'Involving different cultures', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040400a-0000-4000-8000-000404000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How has the portrayal of technology in science-fiction movies influenced real-world innovation?',
    'Discuss predictions that came true, inspiration for inventors, and the role of imagination.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'science fiction', 'A genre based on imagined future technology', 1),
  ((SELECT id FROM card), 'prediction', 'A statement about what will happen in the future', 2),
  ((SELECT id FROM card), 'dystopia', 'An imagined society with great suffering', 3),
  ((SELECT id FROM card), 'utopia', 'An imagined perfect society', 4),
  ((SELECT id FROM card), 'speculative', 'Based on conjecture rather than knowledge', 5),
  ((SELECT id FROM card), 'futuristic', 'Relating to the future', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040400b-0000-4000-8000-000404000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do biographical movies balance historical accuracy with dramatic storytelling?',
    'Discuss creative license, truth versus entertainment, and public perception.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'biopic', 'A movie about a real person''s life', 1),
  ((SELECT id FROM card), 'historical accuracy', 'Being true to real events', 2),
  ((SELECT id FROM card), 'dramatic license', 'Changing facts for storytelling effect', 3),
  ((SELECT id FROM card), 'portrayal', 'The way someone is shown in a movie', 4),
  ((SELECT id FROM card), 'authenticity', 'The quality of being real and genuine', 5),
  ((SELECT id FROM card), 'fact vs fiction', 'The boundary between truth and imagination', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040400c-0000-4000-8000-000404000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What impact do rating systems like PG-13 and R have on movie content and audience?',
    'Discuss age restrictions, creative freedom, and marketing implications.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'rating', 'An age-based classification for movies', 1),
  ((SELECT id FROM card), 'censorship', 'The removal of content considered unsuitable', 2),
  ((SELECT id FROM card), 'content warning', 'A notice about potentially disturbing content', 3),
  ((SELECT id FROM card), 'parental guidance', 'A recommendation for parents about content', 4),
  ((SELECT id FROM card), 'age restriction', 'A limit on who can watch a movie', 5),
  ((SELECT id FROM card), 'self-censorship', 'Creators limiting their own content', 6);

-- -----------------------------------------------------------
-- MOVIES — C1 (level 05)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20405001-0000-4000-8000-000405000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How do documentary films shape public opinion on social and political issues?',
    'Examine bias, narrative construction, evidence, and the filmmaker''s perspective.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'documentary', 'A non-fiction film presenting facts', 1),
  ((SELECT id FROM card), 'narrative', 'The way a story is told', 2),
  ((SELECT id FROM card), 'persuasion', 'The act of influencing beliefs', 3),
  ((SELECT id FROM card), 'objectivity', 'Lack of bias or prejudice', 4),
  ((SELECT id FROM card), 'selective editing', 'Choosing specific footage to support a viewpoint', 5),
  ((SELECT id FROM card), 'advocacy', 'Public support for a cause', 6),
  ((SELECT id FROM card), 'verite', 'A style of documentary that aims for realism', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20405002-0000-4000-8000-000405000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What is the role of film festivals in shaping the global film industry?',
    'Analyze discovery, distribution, prestige, and cultural gatekeeping.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'film festival', 'A curated event showcasing films', 1),
  ((SELECT id FROM card), 'curation', 'The selection and organization of content', 2),
  ((SELECT id FROM card), 'gatekeeping', 'Controlling access to opportunities', 3),
  ((SELECT id FROM card), 'distribution deal', 'An agreement to release a movie', 4),
  ((SELECT id FROM card), 'premiere', 'The first public screening of a film', 5),
  ((SELECT id FROM card), 'jury', 'A panel that judges films at a festival', 6),
  ((SELECT id FROM card), 'Palme d''Or', 'The top prize at the Cannes Film Festival', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20405003-0000-4000-8000-000405000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does auteur theory influence the way we analyze and evaluate movies?',
    'Discuss director authorship, signature style, and the debate about collaborative nature of cinema.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'auteur theory', 'The idea that the director is the film''s author', 1),
  ((SELECT id FROM card), 'authorship', 'The creative ownership of a work', 2),
  ((SELECT id FROM card), 'signature', 'A distinctive style characteristic of a director', 3),
  ((SELECT id FROM card), 'collaborative', 'Involving multiple creative contributions', 4),
  ((SELECT id FROM card), 'mise-en-scene', 'The arrangement of visual elements in a shot', 5),
  ((SELECT id FROM card), 'montage', 'The editing and assembly of shots', 6),
  ((SELECT id FROM card), 'film grammar', 'The visual language and conventions of cinema', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20405004-0000-4000-8000-000405000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How might artificial intelligence change the process of screenwriting and movie production?',
    'Consider AI-generated scripts, virtual actors, and the future of creative work.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'screenwriting', 'The craft of writing scripts for movies', 1),
  ((SELECT id FROM card), 'generative AI', 'AI that creates content like text and images', 2),
  ((SELECT id FROM card), 'deepfake', 'AI-generated video that mimics real people', 3),
  ((SELECT id FROM card), 'digital actor', 'A computer-generated performer', 4),
  ((SELECT id FROM card), 'synthetic performance', 'An AI-generated acting performance', 5),
  ((SELECT id FROM card), 'intellectual property', 'Legal rights over creative content', 6),
  ((SELECT id FROM card), 'creative disruption', 'Fundamental change to creative industries', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20405005-0000-4000-8000-000405000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How do different national cinema movements reflect their country''s political and social history?',
    'Examine Italian neorealism, French New Wave, Japanese cinema, or other movements.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'neorealism', 'A post-war Italian film movement focusing on everyday life', 1),
  ((SELECT id FROM card), 'New Wave', 'A French film movement emphasizing artistic expression', 2),
  ((SELECT id FROM card), 'national cinema', 'The film industry and culture of a country', 3),
  ((SELECT id FROM card), 'movement', 'A group of artists with shared goals', 4),
  ((SELECT id FROM card), 'counterculture', 'A cultural movement opposing mainstream values', 5),
  ((SELECT id FROM card), 'social realism', 'A style focusing on social issues and real life', 6),
  ((SELECT id FROM card), 'avant-garde', 'Experimental and innovative filmmaking', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20405006-0000-4000-8000-000405000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What ethical responsibilities do filmmakers have when depicting real people and events?',
    'Discuss privacy, consent, defamation, and the impact on real individuals.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'defamation', 'Damaging someone''s reputation through false statements', 1),
  ((SELECT id FROM card), 'informed consent', 'Permission given with full understanding', 2),
  ((SELECT id FROM card), 'exploitation', 'Using someone unfairly for benefit', 3),
  ((SELECT id FROM card), 'dramatization', 'Making real events more dramatic', 4),
  ((SELECT id FROM card), 'right of publicity', 'Control over the commercial use of one''s identity', 5),
  ((SELECT id FROM card), 'harm', 'Physical or emotional damage', 6),
  ((SELECT id FROM card), 'revisionism', 'Reinterpreting historical events', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20405007-0000-4000-8000-000405000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How has the shift from film to digital changed the aesthetics and economics of cinema?',
    'Analyze image quality, production costs, distribution, and preservation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'analog', 'Traditional film-based recording', 1),
  ((SELECT id FROM card), 'digital cinema', 'Movies created and projected digitally', 2),
  ((SELECT id FROM card), 'resolution', 'The clarity and detail of an image', 3),
  ((SELECT id FROM card), 'preservation', 'The conservation of films for the future', 4),
  ((SELECT id FROM card), 'grain', 'The visible texture of film stock', 5),
  ((SELECT id FROM card), 'color grading', 'Adjusting colors in post-production', 6),
  ((SELECT id FROM card), 'archival', 'Relating to the long-term storage of films', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20405008-0000-4000-8000-000405000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the business of product placement affect the artistic integrity of movies?',
    'Discuss financing, creative decisions, audience manipulation, and regulation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'product placement', 'Integrating branded products into a movie', 1),
  ((SELECT id FROM card), 'artistic integrity', 'The commitment to artistic values over commerce', 2),
  ((SELECT id FROM card), 'commercial', 'Relating to profit and business', 3),
  ((SELECT id FROM card), 'sponsorship', 'Financial support from a brand', 4),
  ((SELECT id FROM card), 'organic integration', 'When products fit naturally into the story', 5),
  ((SELECT id FROM card), 'disclosure', 'Revealing a financial relationship', 6),
  ((SELECT id FROM card), 'synergy', 'Cooperation between media and brands', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20405009-0000-4000-8000-000405000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What factors contribute to a film''s cultural legacy and lasting impact?',
    'Examine innovation, cultural resonance, critical reception, and influence on future filmmakers.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'legacy', 'What a work leaves behind for future generations', 1),
  ((SELECT id FROM card), 'canon', 'A collection of works considered important', 2),
  ((SELECT id FROM card), 'resonance', 'The ability to evoke emotion or connection', 3),
  ((SELECT id FROM card), 'cult film', 'A movie with a passionate but niche following', 4),
  ((SELECT id FROM card), 'zeitgeist', 'The defining spirit of a particular era', 5),
  ((SELECT id FROM card), 'influential', 'Having the power to shape others', 6),
  ((SELECT id FROM card), 'rediscovery', 'Finding value in a previously overlooked work', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040500a-0000-4000-8000-000405000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the casting of actors from different backgrounds affect the authenticity of a story?',
    'Discuss colorblind casting, authenticity, cultural accuracy, and audience expectations.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'colorblind casting', 'Casting without considering race or ethnicity', 1),
  ((SELECT id FROM card), 'authentic representation', 'Truthful depiction of a group''s experience', 2),
  ((SELECT id FROM card), 'cultural appropriation', 'Adopting elements of another culture without respect', 3),
  ((SELECT id FROM card), 'whitewashing', 'Casting white actors for non-white roles', 4),
  ((SELECT id FROM card), 'typecasting', 'Always casting an actor in similar roles', 5),
  ((SELECT id FROM card), 'authenticity', 'The quality of being genuine', 6),
  ((SELECT id FROM card), 'cultural consultant', 'An expert advising on cultural accuracy', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040500b-0000-4000-8000-000405000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'To what extent should film education be considered essential for developing critical thinking?',
    'Discuss visual literacy, narrative analysis, and the value of studying cinema.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'visual literacy', 'The ability to interpret visual media', 1),
  ((SELECT id FROM card), 'critical thinking', 'Analyzing information to form judgments', 2),
  ((SELECT id FROM card), 'film theory', 'Academic frameworks for analyzing movies', 3),
  ((SELECT id FROM card), 'semiotics', 'The study of signs and symbols in media', 4),
  ((SELECT id FROM card), 'diegesis', 'The fictional world of the film', 5),
  ((SELECT id FROM card), 'gaze', 'The perspective from which a film is made', 6),
  ((SELECT id FROM card), 'deconstruction', 'Analyzing a work to reveal hidden assumptions', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040500c-0000-4000-8000-000405000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the economics of the film industry affect what types of stories are told?',
    'Analyze risk aversion, market research, global appeal, and the dominance of intellectual property.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'risk aversion', 'Avoiding uncertain or unconventional projects', 1),
  ((SELECT id FROM card), 'market research', 'Studying audience preferences to guide decisions', 2),
  ((SELECT id FROM card), 'intellectual property', 'Legally owned creative content', 3),
  ((SELECT id FROM card), 'bankability', 'The commercial appeal of a star or concept', 4),
  ((SELECT id FROM card), 'packaging', 'Assembling talent and script for a project', 5),
  ((SELECT id FROM card), 'development hell', 'A project stuck in long pre-production', 6),
  ((SELECT id FROM card), 'vertical integration', 'Owning production, distribution, and exhibition', 7);

-- -----------------------------------------------------------
-- MOVIES — C2 (level 06)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20406001-0000-4000-8000-000406000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically evaluate the proposition that cinema is the most complete art form, synthesizing all others.',
    'Examine the relationship between film, literature, theater, music, painting, and photography.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'synthesis', 'The combination of different elements into a whole', 1),
  ((SELECT id FROM card), 'Gesamtkunstwerk', 'A total work of art combining multiple forms', 2),
  ((SELECT id FROM card), 'intermediality', 'The relationship between different media', 3),
  ((SELECT id FROM card), 'multimodality', 'Using multiple modes of communication', 4),
  ((SELECT id FROM card), 'synesthesia', 'The stimulation of one sense through another', 5),
  ((SELECT id FROM card), 'artistic medium', 'The material or form used by an artist', 6),
  ((SELECT id FROM card), 'cross-pollination', 'The exchange of ideas across art forms', 7),
  ((SELECT id FROM card), 'transmediation', 'Adapting a story across different media', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20406002-0000-4000-8000-000406000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How does the concept of the "male gaze" in film theory explain systemic gender inequalities in cinema?',
    'Analyze visual pleasure, identification, representation, and counter-cinema movements.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'male gaze', 'The perspective of a heterosexual male viewer in film', 1),
  ((SELECT id FROM card), 'scopophilia', 'The pleasure of looking', 2),
  ((SELECT id FROM card), 'identification', 'The process of relating to a character', 3),
  ((SELECT id FROM card), 'objectification', 'Treating a person as an object', 4),
  ((SELECT id FROM card), 'patriarchy', 'A social system dominated by men', 5),
  ((SELECT id FROM card), 'counter-cinema', 'Film that challenges mainstream conventions', 6),
  ((SELECT id FROM card), 'feminist film theory', 'Analyzing film through feminist perspectives', 7),
  ((SELECT id FROM card), 'spectatorship', 'The relationship between viewer and film', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20406003-0000-4000-8000-000406000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Analyze the epistemological challenges of representing historical trauma through narrative film.',
    'Consider memory, testimony, ethics of spectatorship, and the limits of representation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'epistemological', 'Relating to the nature of knowledge', 1),
  ((SELECT id FROM card), 'historical trauma', 'Collective pain from past events', 2),
  ((SELECT id FROM card), 'testimony', 'First-hand account of an event', 3),
  ((SELECT id FROM card), 'unrepresentable', 'That which cannot be adequately shown', 4),
  ((SELECT id FROM card), 'witness', 'Someone who observes an event', 5),
  ((SELECT id FROM card), 'memorialization', 'The act of preserving memory', 6),
  ((SELECT id FROM card), 'vicarious trauma', 'Secondary trauma from witnessing suffering', 7),
  ((SELECT id FROM card), 'ethics of representation', 'Moral considerations in depicting trauma', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20406004-0000-4000-8000-000406000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How does the political economy of Hollywood''s global dominance affect local film industries worldwide?',
    'Examine cultural imperialism, protectionist policies, co-production treaties, and soft power.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'cultural imperialism', 'The dominance of one culture over others through media', 1),
  ((SELECT id FROM card), 'protectionism', 'Government policies to protect local industries', 2),
  ((SELECT id FROM card), 'co-production', 'A film produced by companies from different countries', 3),
  ((SELECT id FROM card), 'soft power', 'Persuasion through cultural influence', 4),
  ((SELECT id FROM card), 'dubbing', 'Replacing original dialogue with translated voices', 5),
  ((SELECT id FROM card), 'localization', 'Adapting content for a specific market', 6),
  ((SELECT id FROM card), 'market saturation', 'When a market has too many similar products', 7),
  ((SELECT id FROM card), 'cultural discount', 'The reduced appeal of foreign content', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20406005-0000-4000-8000-000406000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'To what extent can interactive cinema and video games be considered a new form of storytelling?',
    'Analyze agency, narrative structure, immersion, and the evolution of audience participation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'interactive cinema', 'A film where the audience influences the story', 1),
  ((SELECT id FROM card), 'agency', 'The capacity to make choices that affect outcomes', 2),
  ((SELECT id FROM card), 'branching narrative', 'A story with multiple possible paths', 3),
  ((SELECT id FROM card), 'immersion', 'Deep involvement in a fictional world', 4),
  ((SELECT id FROM card), 'ludology', 'The study of games and play', 5),
  ((SELECT id FROM card), 'narratology', 'The study of narrative structures', 6),
  ((SELECT id FROM card), 'procedural rhetoric', 'Persuasion through interactive processes', 7),
  ((SELECT id FROM card), 'emergent storytelling', 'Stories arising from player actions', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20406006-0000-4000-8000-000406000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Assess the argument that streaming algorithms are homogenizing film culture and reducing diversity.',
    'Examine recommendation systems, filter bubbles, content discovery, and the long tail.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'homogenization', 'The process of becoming uniform', 1),
  ((SELECT id FROM card), 'filter bubble', 'An algorithmically limited information environment', 2),
  ((SELECT id FROM card), 'long tail', 'The large number of niche products with low demand', 3),
  ((SELECT id FROM card), 'algorithmic curation', 'Software selection of content', 4),
  ((SELECT id FROM card), 'discoverability', 'The ease of finding content', 5),
  ((SELECT id FROM card), 'serendipity', 'The chance discovery of valuable content', 6),
  ((SELECT id FROM card), 'echo chamber', 'An environment where existing beliefs are reinforced', 7),
  ((SELECT id FROM card), 'cultural fragmentation', 'The division of audiences into smaller segments', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20406007-0000-4000-8000-000406000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How might post-cinematic media forms reshape what we understand as the cinematic experience?',
    'Analyze vertical video, VR, AR, ephemeral content, and distributed narratives.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'post-cinema', 'Media forms that go beyond traditional film', 1),
  ((SELECT id FROM card), 'virtual reality', 'A simulated three-dimensional environment', 2),
  ((SELECT id FROM card), 'augmented reality', 'Digital elements overlaid on the real world', 3),
  ((SELECT id FROM card), 'vertical video', 'Video formatted for portrait screens', 4),
  ((SELECT id FROM card), 'ephemeral content', 'Content that disappears after a short time', 5),
  ((SELECT id FROM card), 'distributed narrative', 'A story told across multiple platforms', 6),
  ((SELECT id FROM card), 'transmedia', 'A story unfolding across multiple media', 7),
  ((SELECT id FROM card), 'ambient media', 'Media experienced in the background of daily life', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20406008-0000-4000-8000-000406000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically analyze the concept of "quality television" and how prestige TV has blurred boundaries with cinema.',
    'Examine cinematic aesthetics, narrative complexity, auteur showrunners, and cultural status.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'prestige TV', 'High-quality television with cinematic production values', 1),
  ((SELECT id FROM card), 'showrunner', 'The leading creator and manager of a TV series', 2),
  ((SELECT id FROM card), 'binge-watching', 'Watching multiple episodes in succession', 3),
  ((SELECT id FROM card), 'serialized', 'A story that continues across multiple episodes', 4),
  ((SELECT id FROM card), 'cinematic', 'Having the qualities of a film', 5),
  ((SELECT id FROM card), 'watercooler moment', 'A show that generates widespread discussion', 6),
  ((SELECT id FROM card), 'Peak TV', 'An era of unprecedented television production', 7),
  ((SELECT id FROM card), 'diegetic', 'Existing within the world of the story', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20406009-0000-4000-8000-000406000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How do the philosophical implications of time in cinema challenge our perception of temporality?',
    'Explore duration, flashbacks, slow cinema, and the manipulation of time through editing.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'temporality', 'The experience of time', 1),
  ((SELECT id FROM card), 'duration', 'The length of time something lasts', 2),
  ((SELECT id FROM card), 'slow cinema', 'A film style with long takes and minimal action', 3),
  ((SELECT id FROM card), 'flashback', 'A scene showing events from the past', 4),
  ((SELECT id FROM card), 'ellipsis', 'A gap in the timeline of a narrative', 5),
  ((SELECT id FROM card), 'real time', 'Events shown at their actual duration', 6),
  ((SELECT id FROM card), 'temporal distortion', 'Manipulating the perception of time', 7),
  ((SELECT id FROM card), 'chronology', 'The arrangement of events in time', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040600a-0000-4000-8000-000406000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Evaluate the claim that film criticism is dying along with the institutions that sustained it.',
    'Examine the democratization of critique, social media, aggregators, and the amateur critic.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'film criticism', 'The analysis and evaluation of films', 1),
  ((SELECT id FROM card), 'democratization', 'Making something accessible to everyone', 2),
  ((SELECT id FROM card), 'amateur critic', 'A non-professional person evaluating films', 3),
  ((SELECT id FROM card), 'blind spot', 'An area of knowledge one lacks', 4),
  ((SELECT id FROM card), 'cultural gatekeeper', 'A person who controls what is considered valuable', 5),
  ((SELECT id FROM card), 'critical consensus', 'The prevailing opinion among critics', 6),
  ((SELECT id FROM card), 'hot take', 'A quickly produced opinion for engagement', 7),
  ((SELECT id FROM card), 'long-form criticism', 'In-depth, detailed analysis of a film', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040600b-0000-4000-8000-000406000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'What are the ontological implications of a fully AI-generated film for our understanding of authorship?',
    'Consider creativity, intentionality, the nature of art, and the role of the artist.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'ontology', 'The nature of being and existence', 1),
  ((SELECT id FROM card), 'intentionality', 'The quality of being deliberate and purposeful', 2),
  ((SELECT id FROM card), 'authorship', 'The origin and ownership of a creative work', 3),
  ((SELECT id FROM card), 'algorithmic creativity', 'The generation of art through algorithms', 4),
  ((SELECT id FROM card), 'death of the author', 'A theory separating the work from its creator', 5),
  ((SELECT id FROM card), 'latent space', 'The abstract space where AI learns patterns', 6),
  ((SELECT id FROM card), 'anthropomorphism', 'Attributing human traits to machines', 7),
  ((SELECT id FROM card), 'creative agency', 'The capacity to make artistic choices', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2040600c-0000-4000-8000-000406000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How should societies balance the preservation of film heritage with the commercial interests of studios?',
    'Examine public domain, copyright extension, restoration, accessibility, and orphan works.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'public domain', 'Creative works not protected by copyright', 1),
  ((SELECT id FROM card), 'copyright extension', 'Lengthening the term of copyright protection', 2),
  ((SELECT id FROM card), 'film restoration', 'Recovering and preserving the original quality', 3),
  ((SELECT id FROM card), 'orphan work', 'A copyrighted work whose owner is unknown', 4),
  ((SELECT id FROM card), 'fair use', 'Limited use of copyrighted material without permission', 5),
  ((SELECT id FROM card), 'cultural patrimony', 'Cultural heritage that belongs to a nation', 6),
  ((SELECT id FROM card), 'nitrate film', 'Early film stock that is highly flammable', 7),
  ((SELECT id FROM card), 'vinegar syndrome', 'A chemical decay of acetate film stock', 8);

-- ============================================================
-- NOTE: Topics Sports and Business continue the same pattern.
-- For file size reasons, the complete data for all 6 topics
-- is provided across multiple files.
-- ============================================================

-- ============================================================
-- STATISTICS (for this extension file — Part 2)
-- ============================================================
-- Languages: 1 (English)
-- Levels: 6 (A1, A2, B1, B2, C1, C2)
-- Topics: 2 (Technology, Movies)
-- Cards Added: 144 (12 per combination × 6 levels × 2 topics)
-- Vocabulary Words Added: ~864 (6 avg per card × 144 cards)
-- Card-Vocabulary Relations: ~864
-- ============================================================
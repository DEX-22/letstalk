-- ============================================================
-- Let's Talk — Extended Seed Data — Part 3b (Business completion)
-- ============================================================
-- This file completes the Business topic for Part 3.
-- Run AFTER db/seed-extension-part3.sql:
--   psql -f db/seed-extension-part3b.sql
-- ============================================================

-- ============================================================
-- ID REFERENCE
-- ============================================================
-- English: a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
-- A1: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
-- A2: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12
-- B1: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13
-- B2: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14
-- C1: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15
-- C2: e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16
-- Business: f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16
-- ============================================================

-- -----------------------------------------------------------
-- BUSINESS — B2 (level 04)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20604001-0000-4000-8000-000604000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How does corporate culture affect employee satisfaction and productivity?',
    'Discuss values, work environment, leadership style, and company policies.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'corporate culture', 'The values and behaviors of a company', 1),
  ((SELECT id FROM card), 'employee engagement', 'The level of commitment from workers', 2),
  ((SELECT id FROM card), 'retention', 'Keeping employees in the company', 3),
  ((SELECT id FROM card), 'turnover', 'The rate at which employees leave', 4),
  ((SELECT id FROM card), 'morale', 'The confidence and enthusiasm of a team', 5),
  ((SELECT id FROM card), 'workplace', 'The environment where people work', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20604002-0000-4000-8000-000604000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the challenges and opportunities of international trade for small businesses?',
    'Discuss tariffs, logistics, cultural differences, and market expansion.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'international trade', 'Buying and selling across borders', 1),
  ((SELECT id FROM card), 'tariff', 'A tax on imported goods', 2),
  ((SELECT id FROM card), 'export', 'Sending goods to another country', 3),
  ((SELECT id FROM card), 'import', 'Bringing goods from another country', 4),
  ((SELECT id FROM card), 'logistics', 'The management of transport and storage', 5),
  ((SELECT id FROM card), 'supply chain', 'The network of production and delivery', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20604003-0000-4000-8000-000604000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do businesses use market research to understand their customers?',
    'Discuss surveys, focus groups, data analysis, and consumer behavior.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'market research', 'Gathering information about customers', 1),
  ((SELECT id FROM card), 'demographics', 'Statistical data about population groups', 2),
  ((SELECT id FROM card), 'consumer behavior', 'How people make buying decisions', 3),
  ((SELECT id FROM card), 'survey', 'A questionnaire to collect opinions', 4),
  ((SELECT id FROM card), 'focus group', 'A small group providing feedback', 5),
  ((SELECT id FROM card), 'segmentation', 'Dividing customers into groups', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20604004-0000-4000-8000-000604000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the ethical implications of outsourcing production to countries with lower labor costs?',
    'Discuss working conditions, fair wages, local economies, and corporate responsibility.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'outsourcing', 'Contracting work to external companies', 1),
  ((SELECT id FROM card), 'labor rights', 'Legal protections for workers', 2),
  ((SELECT id FROM card), 'sweatshop', 'A workplace with poor conditions', 3),
  ((SELECT id FROM card), 'fair wage', 'A reasonable payment for work', 4),
  ((SELECT id FROM card), 'offshoring', 'Moving operations to another country', 5),
  ((SELECT id FROM card), 'corporate responsibility', 'A company''s duty to society', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20604005-0000-4000-8000-000604000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How has e-commerce transformed traditional retail business models?',
    'Discuss online stores, payment systems, delivery, and customer experience.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'e-commerce', 'Buying and selling online', 1),
  ((SELECT id FROM card), 'brick and mortar', 'A physical store location', 2),
  ((SELECT id FROM card), 'omnichannel', 'Selling through multiple channels', 3),
  ((SELECT id FROM card), 'checkout', 'The process of completing a purchase', 4),
  ((SELECT id FROM card), 'cart', 'A virtual container for selected items', 5),
  ((SELECT id FROM card), 'fulfillment', 'Processing and delivering orders', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20604006-0000-4000-8000-000604000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the key factors that investors consider before funding a startup?',
    'Discuss business plans, market size, team, traction, and financial projections.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'investor', 'A person who provides capital', 1),
  ((SELECT id FROM card), 'funding', 'Money provided for a business', 2),
  ((SELECT id FROM card), 'valuation', 'The estimated worth of a company', 3),
  ((SELECT id FROM card), 'equity', 'Ownership shares in a company', 4),
  ((SELECT id FROM card), 'pitch', 'A presentation to attract investment', 5),
  ((SELECT id FROM card), 'due diligence', 'Investigation before investment', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20604007-0000-4000-8000-000604000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do companies protect their intellectual property in a global market?',
    'Discuss patents, trademarks, copyrights, and trade secrets.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'intellectual property', 'Creations of the mind protected by law', 1),
  ((SELECT id FROM card), 'patent', 'Exclusive rights to an invention', 2),
  ((SELECT id FROM card), 'trademark', 'A symbol identifying a brand', 3),
  ((SELECT id FROM card), 'copyright', 'Legal rights over creative works', 4),
  ((SELECT id FROM card), 'trade secret', 'Confidential business information', 5),
  ((SELECT id FROM card), 'infringement', 'Unauthorized use of protected material', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20604008-0000-4000-8000-000604000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the benefits and drawbacks of mergers and acquisitions?',
    'Discuss market power, cost savings, culture clash, and integration challenges.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'merger', 'The combining of two companies', 1),
  ((SELECT id FROM card), 'acquisition', 'One company buying another', 2),
  ((SELECT id FROM card), 'synergy', 'The combined benefit of merging', 3),
  ((SELECT id FROM card), 'integration', 'Combining operations after a merger', 4),
  ((SELECT id FROM card), 'hostile takeover', 'An acquisition against the target''s wishes', 5),
  ((SELECT id FROM card), 'antitrust', 'Laws preventing unfair market dominance', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20604009-0000-4000-8000-000604000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How does the sharing economy create new business opportunities?',
    'Discuss platforms like Uber, Airbnb, and the monetization of underused assets.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'sharing economy', 'Peer-to-peer access to goods and services', 1),
  ((SELECT id FROM card), 'platform', 'A digital marketplace connecting users', 2),
  ((SELECT id FROM card), 'peer-to-peer', 'Direct exchange between individuals', 3),
  ((SELECT id FROM card), 'asset', 'A valuable resource owned by a business', 4),
  ((SELECT id FROM card), 'monetization', 'Generating revenue from something', 5),
  ((SELECT id FROM card), 'disruption', 'Radical change to an industry', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060400a-0000-4000-8000-000604000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What role does networking play in career development and business growth?',
    'Discuss professional relationships, events, social media, and mentorship.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'networking', 'Building professional relationships', 1),
  ((SELECT id FROM card), 'mentor', 'An experienced advisor', 2),
  ((SELECT id FROM card), 'referral', 'A recommendation for business', 3),
  ((SELECT id FROM card), 'connection', 'A professional contact', 4),
  ((SELECT id FROM card), 'LinkedIn', 'A professional social network', 5),
  ((SELECT id FROM card), 'alumni', 'Former members of an organization', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060400b-0000-4000-8000-000604000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'How do businesses use data analytics to improve decision-making?',
    'Discuss KPIs, dashboards, predictive analytics, and data-driven strategy.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'KPI', 'Key performance indicator', 1),
  ((SELECT id FROM card), 'dashboard', 'A visual display of key metrics', 2),
  ((SELECT id FROM card), 'predictive analytics', 'Using data to forecast trends', 3),
  ((SELECT id FROM card), 'data-driven', 'Making decisions based on data', 4),
  ((SELECT id FROM card), 'metric', 'A measurable value', 5),
  ((SELECT id FROM card), 'benchmark', 'A standard for comparison', 6);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060400c-0000-4000-8000-000604000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
    'What are the main causes of business failure and how can they be avoided?',
    'Discuss cash flow, market fit, competition, management, and planning.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'cash flow', 'The movement of money in and out', 1),
  ((SELECT id FROM card), 'insolvency', 'Inability to pay debts', 2),
  ((SELECT id FROM card), 'bankruptcy', 'Legal declaration of inability to pay', 3),
  ((SELECT id FROM card), 'market fit', 'How well a product meets market demand', 4),
  ((SELECT id FROM card), 'burn rate', 'The speed at which a company spends money', 5),
  ((SELECT id FROM card), 'pivot', 'A strategic change in business direction', 6);

-- -----------------------------------------------------------
-- BUSINESS — C1 (level 05)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20605001-0000-4000-8000-000605000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the concept of stakeholder capitalism challenge the traditional shareholder primacy model?',
    'Analyze corporate purpose, ESG, long-term value, and multi-stakeholder governance.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'stakeholder capitalism', 'A business model serving all stakeholders', 1),
  ((SELECT id FROM card), 'shareholder primacy', 'The principle of prioritizing shareholders', 2),
  ((SELECT id FROM card), 'ESG', 'Environmental, social, and governance criteria', 3),
  ((SELECT id FROM card), 'fiduciary duty', 'Legal obligation to act in others'' interests', 4),
  ((SELECT id FROM card), 'externalities', 'Indirect costs or benefits of business activity', 5),
  ((SELECT id FROM card), 'triple bottom line', 'Measuring social, environmental, and financial performance', 6),
  ((SELECT id FROM card), 'impact investing', 'Investing for both profit and social good', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20605002-0000-4000-8000-000605000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What are the implications of cryptocurrency and decentralized finance for traditional banking?',
    'Discuss blockchain, regulation, volatility, financial inclusion, and disintermediation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'cryptocurrency', 'A digital currency using cryptography', 1),
  ((SELECT id FROM card), 'decentralized finance', 'Financial services without intermediaries', 2),
  ((SELECT id FROM card), 'blockchain', 'A distributed digital ledger', 3),
  ((SELECT id FROM card), 'disintermediation', 'Removing middlemen from transactions', 4),
  ((SELECT id FROM card), 'volatility', 'Rapid and unpredictable price changes', 5),
  ((SELECT id FROM card), 'regulation', 'Government rules for financial systems', 6),
  ((SELECT id FROM card), 'financial inclusion', 'Access to financial services for all', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20605003-0000-4000-8000-000605000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How should companies balance the pursuit of profit with environmental sustainability?',
    'Examine green innovation, carbon pricing, circular economy, and greenwashing risks.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'green innovation', 'Environmentally friendly business practices', 1),
  ((SELECT id FROM card), 'carbon pricing', 'Putting a cost on carbon emissions', 2),
  ((SELECT id FROM card), 'circular economy', 'An economic system eliminating waste', 3),
  ((SELECT id FROM card), 'greenwashing', 'False claims about environmental practices', 4),
  ((SELECT id FROM card), 'lifecycle assessment', 'Evaluating environmental impact across a product''s life', 5),
  ((SELECT id FROM card), 'net-zero', 'Achieving no net greenhouse gas emissions', 6),
  ((SELECT id FROM card), 'sustainable development', 'Meeting present needs without compromising the future', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20605004-0000-4000-8000-000605000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does behavioral economics explain irrational decision-making in business and investing?',
    'Analyze cognitive biases, heuristics, loss aversion, and framing effects.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'behavioral economics', 'The study of psychological effects on economic decisions', 1),
  ((SELECT id FROM card), 'cognitive bias', 'A systematic pattern of deviation from rationality', 2),
  ((SELECT id FROM card), 'loss aversion', 'The tendency to prefer avoiding losses over gains', 3),
  ((SELECT id FROM card), 'heuristic', 'A mental shortcut for decision-making', 4),
  ((SELECT id FROM card), 'anchoring', 'Relying too heavily on the first piece of information', 5),
  ((SELECT id FROM card), 'confirmation bias', 'Seeking information that confirms existing beliefs', 6),
  ((SELECT id FROM card), 'overconfidence', 'Excessive belief in one''s own abilities', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20605005-0000-4000-8000-000605000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What are the economic and social consequences of increasing income inequality within countries?',
    'Discuss wealth concentration, social mobility, political stability, and policy responses.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'income inequality', 'The uneven distribution of income', 1),
  ((SELECT id FROM card), 'wealth concentration', 'The accumulation of wealth by a small group', 2),
  ((SELECT id FROM card), 'social mobility', 'The ability to move between social classes', 3),
  ((SELECT id FROM card), 'Gini coefficient', 'A measure of income inequality', 4),
  ((SELECT id FROM card), 'progressive taxation', 'Higher tax rates for higher incomes', 5),
  ((SELECT id FROM card), 'redistribution', 'Reallocating wealth through policy', 6),
  ((SELECT id FROM card), 'meritocracy', 'A system based on ability and effort', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20605006-0000-4000-8000-000605000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How might automation and AI reshape the global labor market and employment patterns?',
    'Examine job displacement, new job creation, skills requirements, and universal basic income.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'automation', 'The use of technology to perform tasks', 1),
  ((SELECT id FROM card), 'job displacement', 'The loss of jobs due to technology', 2),
  ((SELECT id FROM card), 'reskilling', 'Learning new skills for changing jobs', 3),
  ((SELECT id FROM card), 'gig economy', 'A labor market with short-term contracts', 4),
  ((SELECT id FROM card), 'universal basic income', 'A regular payment to all citizens', 5),
  ((SELECT id FROM card), 'labor participation', 'The percentage of people working or seeking work', 6),
  ((SELECT id FROM card), 'structural unemployment', 'Joblessness caused by economic changes', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20605007-0000-4000-8000-000605000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What are the strategic advantages and risks of first-mover versus fast-follower business strategies?',
    'Analyze innovation, market timing, brand loyalty, and competitive response.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'first-mover', 'The first company to enter a market', 1),
  ((SELECT id FROM card), 'fast-follower', 'A company that quickly imitates innovators', 2),
  ((SELECT id FROM card), 'competitive advantage', 'A condition that enables superior performance', 3),
  ((SELECT id FROM card), 'barrier to entry', 'Obstacles that make it hard to enter a market', 4),
  ((SELECT id FROM card), 'market timing', 'Entering a market at the optimal moment', 5),
  ((SELECT id FROM card), 'incumbent', 'An established company in a market', 6),
  ((SELECT id FROM card), 'late-mover', 'A company that enters a market after others', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20605008-0000-4000-8000-000605000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How do multinational corporations navigate different legal and regulatory environments across countries?',
    'Discuss compliance, corruption laws, tax strategies, and jurisdictional challenges.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'multinational', 'A company operating in multiple countries', 1),
  ((SELECT id FROM card), 'compliance', 'Following laws and regulations', 2),
  ((SELECT id FROM card), 'jurisdiction', 'The authority of a legal system', 3),
  ((SELECT id FROM card), 'bribery', 'Offering money for dishonest favors', 4),
  ((SELECT id FROM card), 'tax avoidance', 'Legally minimizing tax payments', 5),
  ((SELECT id FROM card), 'transfer pricing', 'Pricing goods between subsidiaries', 6),
  ((SELECT id FROM card), 'regulatory arbitrage', 'Exploiting differences between regulations', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20605009-0000-4000-8000-000605000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What is the role of central banks in managing inflation and economic stability?',
    'Discuss monetary policy, interest rates, quantitative easing, and inflation targeting.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'central bank', 'A national institution managing currency and interest rates', 1),
  ((SELECT id FROM card), 'monetary policy', 'Actions to control money supply and interest rates', 2),
  ((SELECT id FROM card), 'inflation', 'The general increase in prices', 3),
  ((SELECT id FROM card), 'quantitative easing', 'Creating money to stimulate the economy', 4),
  ((SELECT id FROM card), 'interest rate', 'The cost of borrowing money', 5),
  ((SELECT id FROM card), 'deflation', 'A decrease in general price levels', 6),
  ((SELECT id FROM card), 'fiscal policy', 'Government decisions about spending and taxation', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060500a-0000-4000-8000-000605000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How does the gig economy challenge traditional employment laws and worker protections?',
    'Examine worker classification, benefits, collective bargaining, and platform regulation.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'worker classification', 'The legal status of a worker', 1),
  ((SELECT id FROM card), 'independent contractor', 'A self-employed worker', 2),
  ((SELECT id FROM card), 'employee benefits', 'Non-wage compensation like health insurance', 3),
  ((SELECT id FROM card), 'collective bargaining', 'Negotiation by a group of workers', 4),
  ((SELECT id FROM card), 'portability', 'The ability to transfer benefits across jobs', 5),
  ((SELECT id FROM card), 'minimum wage', 'The lowest legal hourly pay', 6),
  ((SELECT id FROM card), 'platform economy', 'Economic activity through digital platforms', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060500b-0000-4000-8000-000605000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'How should businesses approach the challenge of data privacy and cybersecurity in the digital age?',
    'Discuss GDPR, data breaches, customer trust, and security investment.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'data privacy', 'The protection of personal information', 1),
  ((SELECT id FROM card), 'GDPR', 'The EU General Data Protection Regulation', 2),
  ((SELECT id FROM card), 'data breach', 'An incident exposing confidential data', 3),
  ((SELECT id FROM card), 'cybersecurity', 'Protection against digital attacks', 4),
  ((SELECT id FROM card), 'encryption', 'Encoding data to prevent unauthorized access', 5),
  ((SELECT id FROM card), 'consent', 'Permission to collect and use data', 6),
  ((SELECT id FROM card), 'data minimization', 'Collecting only necessary data', 7);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060500c-0000-4000-8000-000605000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
    'What are the economic implications of trade wars and protectionist policies on global supply chains?',
    'Analyze tariffs, reshoring, trade agreements, and economic nationalism.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'trade war', 'A conflict of tariffs and trade barriers', 1),
  ((SELECT id FROM card), 'protectionism', 'Shielding domestic industries from competition', 2),
  ((SELECT id FROM card), 'reshoring', 'Bringing manufacturing back to the home country', 3),
  ((SELECT id FROM card), 'trade deficit', 'When imports exceed exports', 4),
  ((SELECT id FROM card), 'WTO', 'The World Trade Organization', 5),
  ((SELECT id FROM card), 'sanction', 'A penalty imposed on a country', 6),
  ((SELECT id FROM card), 'supply chain resilience', 'The ability to withstand supply disruptions', 7);

-- -----------------------------------------------------------
-- BUSINESS — C2 (level 06)
-- -----------------------------------------------------------

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20606001-0000-4000-8000-000606000100',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically evaluate the proposition that the corporation is a fundamentally undemocratic institution incompatible with political democracy.',
    'Examine corporate governance, shareholder voting, worker representation, and the nature of economic power.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'corporate governance', 'The system of rules and practices for directing a company', 1),
  ((SELECT id FROM card), 'shareholder democracy', 'The voting rights of shareholders', 2),
  ((SELECT id FROM card), 'board of directors', 'A group elected to oversee a company', 3),
  ((SELECT id FROM card), 'agency problem', 'Conflicts of interest between managers and shareholders', 4),
  ((SELECT id FROM card), 'stakeholder theory', 'The view that companies should serve all stakeholders', 5),
  ((SELECT id FROM card), 'industrial democracy', 'Worker participation in company decisions', 6),
  ((SELECT id FROM card), 'co-determination', 'A system where workers have board representation', 7),
  ((SELECT id FROM card), 'economic democracy', 'The democratic control of economic institutions', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20606002-0000-4000-8000-000606000200',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Analyze the philosophical foundations of capitalism and how they have evolved in the 21st century.',
    'Examine classical liberalism, neoliberalism, creative destruction, and the moral limits of markets.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'classical liberalism', 'An ideology emphasizing individual rights and free markets', 1),
  ((SELECT id FROM card), 'neoliberalism', 'A modern form of capitalism emphasizing deregulation', 2),
  ((SELECT id FROM card), 'creative destruction', 'The process of innovation replacing old industries', 3),
  ((SELECT id FROM card), 'market fundamentalism', 'The belief that markets solve all problems', 4),
  ((SELECT id FROM card), 'moral economy', 'An economy based on ethical principles', 5),
  ((SELECT id FROM card), 'embeddedness', 'The idea that economies are part of social systems', 6),
  ((SELECT id FROM card), 'commodification', 'Turning goods, services, or relationships into commodities', 7),
  ((SELECT id FROM card), 'disembeddedness', 'The separation of economy from society', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20606003-0000-4000-8000-000606000300',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How does the concept of "too big to fail" create moral hazard in the financial system?',
    'Examine systemic risk, bailouts, regulation, and the ethical dimensions of financial safety nets.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'too big to fail', 'The idea that some companies are too large to be allowed to collapse', 1),
  ((SELECT id FROM card), 'moral hazard', 'Taking risks because the cost of failure is borne by others', 2),
  ((SELECT id FROM card), 'systemic risk', 'Risk that threatens the entire financial system', 3),
  ((SELECT id FROM card), 'bailout', 'Government financial rescue of a failing company', 4),
  ((SELECT id FROM card), 'systemically important', 'An institution whose failure would cause widespread damage', 5),
  ((SELECT id FROM card), 'regulatory capture', 'When regulators act in the interest of the regulated industry', 6),
  ((SELECT id FROM card), 'too interconnected', 'The risk from complex financial relationships', 7),
  ((SELECT id FROM card), 'resolution authority', 'The power to wind down failing financial firms', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20606004-0000-4000-8000-000606000400',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Evaluate the argument that economic growth is incompatible with ecological sustainability.',
    'Analyze degrowth, steady-state economics, green growth, and the decoupling debate.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'degrowth', 'An economic approach prioritizing well-being over growth', 1),
  ((SELECT id FROM card), 'steady-state economy', 'An economy with stable population and consumption', 2),
  ((SELECT id FROM card), 'decoupling', 'Separating economic growth from environmental impact', 3),
  ((SELECT id FROM card), 'Jevons paradox', 'When efficiency gains lead to increased consumption', 4),
  ((SELECT id FROM card), 'planetary boundaries', 'Environmental limits within which humanity can thrive', 5),
  ((SELECT id FROM card), 'ecological economics', 'An economic field integrating ecology and economics', 6),
  ((SELECT id FROM card), 'post-growth', 'An economic model that does not prioritize growth', 7),
  ((SELECT id FROM card), 'doughnut economics', 'A model balancing social foundations and ecological ceilings', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20606005-0000-4000-8000-000606000500',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How should societies regulate the concentration of economic power in digital platform monopolies?',
    'Examine antitrust, data regulation, interoperability, and public utility frameworks.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'platform monopoly', 'A dominant digital platform with market power', 1),
  ((SELECT id FROM card), 'network effects', 'When a service becomes more valuable as more people use it', 2),
  ((SELECT id FROM card), 'data network effects', 'When more data improves a service, attracting more users', 3),
  ((SELECT id FROM card), 'interoperability', 'The ability to work with competing platforms', 4),
  ((SELECT id FROM card), 'data portability', 'The ability to move data between services', 5),
  ((SELECT id FROM card), 'essential facility', 'A resource necessary for competition', 6),
  ((SELECT id FROM card), 'public utility regulation', 'Treating platforms as essential services', 7),
  ((SELECT id FROM card), 'digital sovereignty', 'A nation''s control over its digital infrastructure', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20606006-0000-4000-8000-000606000600',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically assess the claim that corporate social responsibility is merely a form of strategic reputation management.',
    'Examine genuine altruism, greenwashing, stakeholder pressure, and the business case for ethics.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'corporate social responsibility', 'A company''s commitment to ethical practices', 1),
  ((SELECT id FROM card), 'window dressing', 'Making a company appear more ethical than it is', 2),
  ((SELECT id FROM card), 'enlightened self-interest', 'Acting ethically because it benefits the company', 3),
  ((SELECT id FROM card), 'shared value', 'Creating economic value while addressing social needs', 4),
  ((SELECT id FROM card), 'philanthropy', 'Charitable giving by corporations', 5),
  ((SELECT id FROM card), 'sustainability reporting', 'Disclosing environmental and social performance', 6),
  ((SELECT id FROM card), 'impact measurement', 'Quantifying social and environmental outcomes', 7),
  ((SELECT id FROM card), 'greenwashing', 'Deceptive claims about environmental practices', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20606007-0000-4000-8000-000606000700',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How does the political economy of tax havens and offshore finance undermine democratic accountability?',
    'Analyze tax avoidance, secrecy jurisdictions, capital flight, and global tax reform efforts.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'tax haven', 'A jurisdiction with very low tax rates', 1),
  ((SELECT id FROM card), 'offshore finance', 'Financial activities outside one''s home country', 2),
  ((SELECT id FROM card), 'secrecy jurisdiction', 'A place with strict financial secrecy laws', 3),
  ((SELECT id FROM card), 'capital flight', 'The rapid movement of money out of a country', 4),
  ((SELECT id FROM card), 'base erosion', 'The reduction of a country''s tax base', 5),
  ((SELECT id FROM card), 'profit shifting', 'Moving profits to low-tax jurisdictions', 6),
  ((SELECT id FROM card), 'BEPS', 'Base erosion and profit shifting', 7),
  ((SELECT id FROM card), 'tax transparency', 'Openness about tax payments and structures', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20606008-0000-4000-8000-000606000800',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'What are the epistemological limitations of using GDP as a measure of economic and social progress?',
    'Examine alternative metrics, well-being indices, natural capital accounting, and beyond GDP frameworks.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'GDP', 'Gross domestic product, a measure of economic output', 1),
  ((SELECT id FROM card), 'beyond GDP', 'Alternative frameworks for measuring progress', 2),
  ((SELECT id FROM card), 'GNH', 'Gross national happiness', 3),
  ((SELECT id FROM card), 'HDI', 'Human development index', 4),
  ((SELECT id FROM card), 'natural capital', 'The value of natural resources', 5),
  ((SELECT id FROM card), 'genuine progress indicator', 'A metric accounting for environmental and social costs', 6),
  ((SELECT id FROM card), 'externalities', 'Costs not reflected in market prices', 7),
  ((SELECT id FROM card), 'well-being economy', 'An economic system focused on human welfare', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('20606009-0000-4000-8000-000606000900',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How might the rise of algorithmic management and AI-driven decision-making transform organizational hierarchy?',
    'Examine flat organizations, algorithmic control, human judgment, and the future of management.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'algorithmic management', 'Using algorithms to direct and evaluate workers', 1),
  ((SELECT id FROM card), 'flat organization', 'An organization with few levels of management', 2),
  ((SELECT id FROM card), 'hierarchy', 'A system of ranking and authority', 3),
  ((SELECT id FROM card), 'holacracy', 'A system of self-organizing teams', 4),
  ((SELECT id FROM card), 'bureaucracy', 'A system of rules and procedures', 5),
  ((SELECT id FROM card), 'managerialism', 'The dominance of managerial authority', 6),
  ((SELECT id FROM card), 'technocracy', 'Decision-making by technical experts', 7),
  ((SELECT id FROM card), 'organizational design', 'The structure and culture of an organization', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060600a-0000-4000-8000-000606000a00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Evaluate the proposition that the modern corporation has become a political actor that must be democratically accountable.',
    'Examine corporate lobbying, political spending, constitutional rights, and public purpose.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'corporate lobbying', 'Attempting to influence government decisions', 1),
  ((SELECT id FROM card), 'political spending', 'Money spent on political campaigns', 2),
  ((SELECT id FROM card), 'corporate personhood', 'The legal status of corporations as persons', 3),
  ((SELECT id FROM card), 'Citizens United', 'A US Supreme Court case on corporate political spending', 4),
  ((SELECT id FROM card), 'revolving door', 'Movement between government and corporate roles', 5),
  ((SELECT id FROM card), 'public purpose', 'The obligation of corporations to serve society', 6),
  ((SELECT id FROM card), 'benefit corporation', 'A company legally required to consider social impact', 7),
  ((SELECT id FROM card), 'regulatory accountability', 'The responsibility of corporations to follow rules', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060600b-0000-4000-8000-000606000b00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'How does the concept of "financialization" explain the shift from productive investment to speculative finance?',
    'Analyze shareholder value, short-termism, asset inflation, and the decoupling of finance from production.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'financialization', 'The increasing role of finance in the economy', 1),
  ((SELECT id FROM card), 'shareholder value', 'The principle of maximizing stock price', 2),
  ((SELECT id FROM card), 'short-termism', 'Focusing on short-term results over long-term value', 3),
  ((SELECT id FROM card), 'asset inflation', 'The rise in prices of financial assets', 4),
  ((SELECT id FROM card), 'securitization', 'Pooling assets into tradable securities', 5),
  ((SELECT id FROM card), 'derivative', 'A financial contract based on an underlying asset', 6),
  ((SELECT id FROM card), 'speculation', 'Trading for profit from price changes', 7),
  ((SELECT id FROM card), 'casino capitalism', 'A financial system dominated by speculation', 8);

WITH card AS (
  INSERT INTO cards (id, topic_id, language_id, level_id, question, context)
  VALUES ('2060600c-0000-4000-8000-000606000c00',
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
    'Critically analyze the argument that free trade agreements primarily benefit capital at the expense of labor.',
    'Examine comparative advantage, wage effects, labor standards, and the distribution of trade gains.')
  RETURNING id
)
INSERT INTO card_vocabulary (card_id, word, definition, sort_order) VALUES
  ((SELECT id FROM card), 'free trade', 'International trade without barriers', 1),
  ((SELECT id FROM card), 'comparative advantage', 'The ability to produce at lower opportunity cost', 2),
  ((SELECT id FROM card), 'trade liberalization', 'The removal of trade barriers', 3),
  ((SELECT id FROM card), 'factor price equalization', 'The theory that trade equalizes wages across countries', 4),
  ((SELECT id FROM card), 'race to the bottom', 'Competition to lower labor and environmental standards', 5),
  ((SELECT id FROM card), 'trade adjustment', 'Support for workers displaced by trade', 6),
  ((SELECT id FROM card), 'labor arbitrage', 'Exploiting wage differences between countries', 7),
  ((SELECT id FROM card), 'distributive justice', 'The fair allocation of economic benefits', 8);

-- ============================================================
-- FINAL STATISTICS (all extension files combined)
-- ============================================================
--
-- Part 1 (seed-extension.sql):
--   Topics: Travel, Food
--   Cards: 144 (12 per level × 6 levels × 2 topics)
--   Vocabulary: ~864
--
-- Part 2 (seed-extension-part2.sql):
--   Topics: Technology, Movies
--   Cards: 144
--   Vocabulary: ~864
--
-- Part 3 (seed-extension-part3.sql + part3b.sql):
--   Topics: Sports, Business
--   Cards: 144
--   Vocabulary: ~864
--
-- Total from all extension files:
--   Languages: 1 (English)
--   Levels: 6 (A1, A2, B1, B2, C1, C2)
--   Topics: 6 (Travel, Food, Technology, Movies, Sports, Business)
--   Cards Added: 432 (12 per combination × 6 levels × 6 topics)
--   Vocabulary Words Added: ~2,592 (6 avg per card × 432 cards)
--   Card-Vocabulary Relations: ~2,592
--
-- Combined with existing seed (36 cards, ~108 vocabulary):
--   Total Cards: 468
--   Total Vocabulary Relations: ~2,700
-- ============================================================
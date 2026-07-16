# Functional Requirements

## Authentication

- Continue as Guest
- Sign in with Google

---

## Rooms

Users can:

- Create a room
- Join a room
- Leave a room

Each room has:

- Name
- Language
- Topic
- Level
- Turn duration
- Maximum participants

---

## Participants

Each participant has:

- Name
- Avatar
- Status
- Role

Roles:

- Host
- Participant

---

## Session

The host starts the session.

The system:

- Randomizes participants
- Creates turns
- Starts timer
- Moves automatically to the next participant

---

## Conversation Cards

Each card contains:

- Topic
- Vocabulary
- Question

Only the active participant can see their card.

---

## Realtime

Realtime updates for:

- Joining
- Leaving
- Timer
- Turns
- Room state

---

## Non Functional Requirements

- Responsive
- PWA
- Mobile First
- Offline support (basic)
- Fast loading
- Clean Architecture
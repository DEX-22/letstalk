export interface VocabularyItem {
  word: string
  definition: string | null
}

export interface ConversationCard {
  topic: string
  vocabulary: VocabularyItem[]
  question: string
  context: string | null
}

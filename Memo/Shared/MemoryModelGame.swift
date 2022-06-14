import Foundation

struct MemoryModelGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<MemoryCards>

    private var indexOfOnlyFaceUpCard: Int?

    mutating func chooseMemory(_ card: MemoryCards) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfOnlyFaceUpCard = chosenIndex
            }

            cards[chosenIndex].isFaceUp.toggle()
        }


    }


    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<MemoryCards>()

        for pairIndex in 0..<numberOfPairOfCards {

            let content = createCardContent(pairIndex)

            cards.append(MemoryCards(content: content, id: pairIndex * 2))
            cards.append(MemoryCards(content: content, id: pairIndex * 2 + 1))
        }
    }


    struct MemoryCards: Identifiable {

        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }

}


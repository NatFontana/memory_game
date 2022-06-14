import SwiftUI

class MemoryViewModelGame: ObservableObject  {

    static let emojis = ["🐶", "🐱", "🦁", "🐯", "🐨", "🐮", "🐷", "🐸", "🦄", "🪱",
                         "🦋", "🦆", "🦉", "🐴", "🪲", "🐦", "🐛", "🐍", "🦑", "🐌",
                         "🕷", "🐼", "🐣", "🐙", "🐞", "🦖", "🐡", "🦟", "🦀", "🐳"]

    static func createMemoryGame() -> MemoryModelGame<String> {
        MemoryModelGame(numberOfPairOfCards: 8,
                createCardContent: { pairIndex in emojis[pairIndex] })
    }


    @Published private var model: MemoryModelGame<String> = createMemoryGame()

    var cards: Array<MemoryModelGame<String>.MemoryCards> {
        model.cards
    }

    func chooseMemory(_ card: MemoryModelGame<String>.MemoryCards){
        model.chooseMemory(card)
    }
}
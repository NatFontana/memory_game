import SwiftUI

struct MemoryCard: View {

    let cards: MemoryModelGame<String>.MemoryCards


    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 30)
            if cards.isFaceUp {
                shape.fill()
                        .foregroundColor(.white)
                shape.strokeBorder(lineWidth: 4)
                Text(cards.content).font(.largeTitle)
            } else {
                if cards.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
}

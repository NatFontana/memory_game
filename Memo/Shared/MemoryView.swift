import SwiftUI

struct MemoryView: View {

    @ObservedObject var viewModel = MemoryViewModelGame()
    var body: some View {

        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], content: {
                ForEach(viewModel.cards, content: { cards in
                    MemoryCard(cards: cards).aspectRatio(2 / 3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.chooseMemory(cards)
                            }
                })
            })
        }

                .padding()
                .foregroundColor(Color.pink)
    }


    struct ContentView_Previews: PreviewProvider {

        static var previews: some View {

            let game = MemoryViewModelGame()

            MemoryView(viewModel: game).preferredColorScheme(.dark)
            MemoryView(viewModel: game).preferredColorScheme(.light)
        }
    }

}


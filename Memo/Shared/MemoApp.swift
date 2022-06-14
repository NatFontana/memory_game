import SwiftUI

@main
struct MemoApp: App {
    let game = MemoryViewModelGame()

    var body: some Scene {
        WindowGroup {
            MemoryView(viewModel: game)
        }
    }
}

import SwiftUI

@main
struct AILifeOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TransactionModel())
        }
    }
}

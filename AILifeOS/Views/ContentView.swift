import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: TransactionModel
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.95, green: 0.97, blue: 1.0),
                    Color(red: 0.98, green: 0.99, blue: 1.0)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            TabView(selection: $selectedTab) {
                DashboardView()
                    .tabItem {
                        Label("Dashboard", systemImage: "house.fill")
                    }
                    .tag(0)
                
                TransactionsListView()
                    .tabItem {
                        Label("Transactions", systemImage: "list.bullet")
                    }
                    .tag(1)
                
                InsightsView()
                    .tabItem {
                        Label("Insights", systemImage: "chart.pie.fill")
                    }
                    .tag(2)
                
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(3)
            }
        }
    }
}

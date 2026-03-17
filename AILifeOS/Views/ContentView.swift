import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: TransactionModel
    @State private var selectedTab = 0
    
    var body: some View {
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

#Preview {
    ContentView()
        .environmentObject(TransactionModel())
}

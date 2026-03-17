import SwiftUI

struct SearchView: View {
    @EnvironmentObject var model: TransactionModel
    @State private var searchText = ""
    
    var filteredTransactions: [Transaction] {
        if searchText.isEmpty {
            return model.transactions
        }
        return model.transactions.filter { transaction in
            transaction.merchant.localizedCaseInsensitiveContains(searchText) ||
            transaction.category.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                        
                        Text("Search Transactions")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                    }
                    
                    Text("Find your expenses quickly")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                // Search Bar
                SearchBar(text: $searchText)
                    .padding()
                
                // Results
                if filteredTransactions.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                        
                        Text("No transactions found")
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        Text("Try searching for a merchant or category")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxHeight: .infinity)
                    .padding()
                } else {
                    List {
                        ForEach(filteredTransactions.sorted { $0.datetime > $1.datetime }) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(radius: 2)
                        )
                        .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.grouped)
                }
            }
            .scrollContentBackground(.hidden)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.95, green: 0.97, blue: 1.0),
                        Color(red: 0.98, green: 0.99, blue: 1.0)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .navigationTitle("Search")
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search merchant or category", text: $text)
                .textFieldStyle(.roundedBorder)
            
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    SearchView()
        .environmentObject(TransactionModel())
}

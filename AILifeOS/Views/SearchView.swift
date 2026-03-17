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
                SearchBar(text: $searchText)
                    .padding()
                
                if filteredTransactions.isEmpty {
                    VStack {
                        Text("No transactions found")
                            .foregroundColor(.gray)
                        
                        Text("Try searching for a merchant or category")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxHeight: .infinity)
                } else {
                    List {
                        ForEach(filteredTransactions.sorted { $0.datetime > $1.datetime }) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
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
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

#Preview {
    SearchView()
        .environmentObject(TransactionModel())
}

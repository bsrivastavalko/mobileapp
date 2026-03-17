import SwiftUI

struct TransactionsListView: View {
    @EnvironmentObject var model: TransactionModel
    @State private var showAddTransaction = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(model.transactions.sorted { $0.datetime > $1.datetime }) { transaction in
                    TransactionRow(transaction: transaction)
                }
            }
            .navigationTitle("Transactions")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddTransaction = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTransaction) {
                AddTransactionView(model: model)
            }
        }
    }
}

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: transaction.type == .credit ? "arrow.down.circle.fill" : "arrow.up.circle.fill")
                .font(.system(size: 24))
                .foregroundColor(transaction.type == .credit ? .green : .red)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.merchant)
                    .font(.headline)
                
                Text(transaction.category)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(formatDate(transaction.datetime))
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(transaction.type == .credit ? "+" : "-")₹\(String(format: "%.0f", transaction.amount))")
                    .font(.headline)
                    .foregroundColor(transaction.type == .credit ? .green : .red)
                
                Text(transaction.source)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: date)
    }
}

#Preview {
    TransactionsListView()
        .environmentObject(TransactionModel())
}

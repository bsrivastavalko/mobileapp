import SwiftUI

struct TransactionsListView: View {
    @EnvironmentObject var model: TransactionModel
    @State private var showAddTransaction = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(model.transactions.sorted { $0.datetime > $1.datetime }) { transaction in
                        TransactionRow(transaction: transaction)
                    }
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(radius: 2)
                    )
                    .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                    .listRowSeparator(.hidden)
                } header: {
                    HStack(spacing: 8) {
                        Image(systemName: "list.bullet.circle.fill")
                            .foregroundColor(.blue)
                        Text("All Transactions")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                }
            }
            .listStyle(.grouped)
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
            .navigationTitle("Transactions")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddTransaction = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
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
            ZStack {
                Circle()
                    .fill(
                        transaction.type == .credit ?
                        Color(red: 0.85, green: 0.95, blue: 0.85) :
                        Color(red: 0.95, green: 0.85, blue: 0.85)
                    )
                    .frame(width: 50, height: 50)
                
                Image(systemName: transaction.type == .credit ? "arrow.down.circle.fill" : "arrow.up.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(transaction.type == .credit ? .green : .red)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.merchant)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.black)
                
                HStack(spacing: 8) {
                    Text(transaction.category)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Color.blue.opacity(0.7))
                        .cornerRadius(4)
                    
                    Text(formatDate(transaction.datetime))
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(transaction.type == .credit ? "+" : "-")₹\(String(format: "%.0f", transaction.amount))")
                    .font(.system(.headline, design: .rounded))
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
        formatter.dateFormat = "MMM dd"
        return formatter.string(from: date)
    }
}

#Preview {
    TransactionsListView()
        .environmentObject(TransactionModel())
}

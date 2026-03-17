import Foundation

class TransactionModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var searchText: String = ""
    
    init() {
        loadSampleData()
    }
    
    func loadSampleData() {
        let calendar = Calendar.current
        let now = Date()
        
        let sampleTransactions = [
            Transaction(
                datetime: calendar.date(byAdding: .day, value: -5, to: now)!,
                type: .debit,
                amount: 1500,
                merchant: "Amazon",
                category: "Shopping",
                source: "Gmail"
            ),
            Transaction(
                datetime: calendar.date(byAdding: .day, value: -3, to: now)!,
                type: .credit,
                amount: 50000,
                merchant: "Employer Ltd",
                category: "Salary",
                source: "Gmail"
            ),
            Transaction(
                datetime: calendar.date(byAdding: .day, value: -2, to: now)!,
                type: .debit,
                amount: 800,
                merchant: "Starbucks",
                category: "Food",
                source: "Manual"
            ),
            Transaction(
                datetime: calendar.date(byAdding: .day, value: -1, to: now)!,
                type: .debit,
                amount: 3000,
                merchant: "HDFC Bank",
                category: "EMI",
                source: "Gmail"
            ),
            Transaction(
                datetime: now,
                type: .debit,
                amount: 2500,
                merchant: "Swiggy",
                category: "Food",
                source: "Manual"
            )
        ]
        
        self.transactions = sampleTransactions
    }
    
    func addTransaction(_ transaction: Transaction) {
        transactions.append(transaction)
    }
    
    var filteredTransactions: [Transaction] {
        if searchText.isEmpty {
            return transactions
        }
        return transactions.filter { transaction in
            transaction.merchant.localizedCaseInsensitiveContains(searchText) ||
            transaction.category.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var monthlyIncome: Double {
        transactions
            .filter { $0.type == .credit }
            .reduce(0) { $0 + $1.amount }
    }
    
    var monthlyExpense: Double {
        transactions
            .filter { $0.type == .debit }
            .reduce(0) { $0 + $1.amount }
    }
    
    var netBalance: Double {
        monthlyIncome - monthlyExpense
    }
    
    var topCategories: [(category: String, amount: Double)] {
        var categoryMap: [String: Double] = [:]
        
        transactions
            .filter { $0.type == .debit }
            .forEach { transaction in
                categoryMap[transaction.category, default: 0] += transaction.amount
            }
        
        return categoryMap
            .sorted { $0.value > $1.value }
            .prefix(5)
            .map { ($0.key, $0.value) }
    }
    
    var topMerchants: [(merchant: String, amount: Double)] {
        var merchantMap: [String: Double] = [:]
        
        transactions
            .filter { $0.type == .debit }
            .forEach { transaction in
                merchantMap[transaction.merchant, default: 0] += transaction.amount
            }
        
        return merchantMap
            .sorted { $0.value > $1.value }
            .prefix(5)
            .map { ($0.key, $0.value) }
    }
}

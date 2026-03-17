import Foundation

struct Transaction: Identifiable, Codable {
    let id: UUID
    let datetime: Date
    let type: TransactionType
    let amount: Double
    let merchant: String
    let category: String
    let source: String
    
    init(
        id: UUID = UUID(),
        datetime: Date = Date(),
        type: TransactionType,
        amount: Double,
        merchant: String,
        category: String,
        source: String
    ) {
        self.id = id
        self.datetime = datetime
        self.type = type
        self.amount = amount
        self.merchant = merchant
        self.category = category
        self.source = source
    }
}

enum TransactionType: String, Codable {
    case credit = "Credit"
    case debit = "Debit"
}

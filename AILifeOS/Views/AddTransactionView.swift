import SwiftUI

struct AddTransactionView: View {
    @Environment(\.dismiss) var dismiss
    let model: TransactionModel
    
    @State private var amount = ""
    @State private var merchant = ""
    @State private var category = "Food"
    @State private var type: TransactionType = .debit
    @State private var selectedDate = Date()
    
    let categories = ["Food", "Shopping", "EMI", "Salary", "Utilities", "Entertainment", "Transport"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Transaction Details") {
                    Picker("Type", selection: $type) {
                        Text("Debit").tag(TransactionType.debit)
                        Text("Credit").tag(TransactionType.credit)
                    }
                    
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Merchant", text: $merchant)
                    
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { cat in
                            Text(cat).tag(cat)
                        }
                    }
                    
                    DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                }
                
                Section {
                    Button(action: save) {
                        if amount.isEmpty || merchant.isEmpty {
                            Text("Save")
                                .foregroundColor(.gray)
                        } else {
                            Text("Save")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                        }
                    }
                    .disabled(amount.isEmpty || merchant.isEmpty)
                    .listRowBackground(Color.blue)
                }
            }
            .navigationTitle("Add Transaction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func save() {
        guard let amountValue = Double(amount) else { return }
        
        let transaction = Transaction(
            datetime: selectedDate,
            type: type,
            amount: amountValue,
            merchant: merchant,
            category: category,
            source: "Manual"
        )
        
        model.addTransaction(transaction)
        dismiss()
    }
}

#Preview {
    AddTransactionView(model: TransactionModel())
}

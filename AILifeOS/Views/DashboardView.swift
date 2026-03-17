import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var model: TransactionModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Financial Overview")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    // Income Card
                    DashboardCard(
                        title: "Monthly Income",
                        amount: model.monthlyIncome,
                        backgroundColor: Color.green.opacity(0.1),
                        textColor: .green
                    )
                    
                    // Expense Card
                    DashboardCard(
                        title: "Monthly Expense",
                        amount: model.monthlyExpense,
                        backgroundColor: Color.red.opacity(0.1),
                        textColor: .red
                    )
                    
                    // Net Balance Card
                    let balanceColor = model.netBalance >= 0 ? Color.blue : Color.orange
                    DashboardCard(
                        title: "Net Balance",
                        amount: model.netBalance,
                        backgroundColor: balanceColor.opacity(0.1),
                        textColor: balanceColor
                    )
                    
                    Spacer()
                }
                .padding(.vertical)
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct DashboardCard: View {
    let title: String
    let amount: Double
    let backgroundColor: Color
    let textColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Text("₹\(String(format: "%.0f", amount))")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
                
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

#Preview {
    DashboardView()
        .environmentObject(TransactionModel())
}

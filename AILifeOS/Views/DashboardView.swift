import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var model: TransactionModel
    @State private var showGmailConnect = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 8) {
                            Image(systemName: "dollarsign.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.blue)
                            
                            Text("Financial Overview")
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .foregroundColor(.black)
                        }
                        
                        Text("Track your transactions smartly")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top)
                    
                    // Gmail Connect Button
                    Button(action: { showGmailConnect = true }) {
                        HStack(spacing: 12) {
                            Image(systemName: "envelope.fill")
                                .font(.system(size: 18))
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Connect Gmail")
                                    .font(.headline)
                                Text("Import banking emails")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.98, green: 0.85, blue: 0.85),
                                    Color(red: 1.0, green: 0.90, blue: 0.90)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                    }
                    
                    // Stats Cards
                    VStack(spacing: 12) {
                        DashboardCard(
                            title: "Monthly Income",
                            amount: model.monthlyIncome,
                            icon: "arrow.down.circle.fill",
                            backgroundColor: Color(red: 0.85, green: 0.95, blue: 0.85),
                            textColor: Color(red: 0.2, green: 0.7, blue: 0.2)
                        )
                        
                        DashboardCard(
                            title: "Monthly Expense",
                            amount: model.monthlyExpense,
                            icon: "arrow.up.circle.fill",
                            backgroundColor: Color(red: 0.95, green: 0.85, blue: 0.85),
                            textColor: Color(red: 0.8, green: 0.1, blue: 0.1)
                        )
                        
                        let balanceColor = model.netBalance >= 0 ? Color(red: 0.85, green: 0.90, blue: 0.98) : Color(red: 0.98, green: 0.90, blue: 0.80)
                        let textColor = model.netBalance >= 0 ? Color(red: 0.0, green: 0.3, blue: 0.8) : Color(red: 0.8, green: 0.5, blue: 0.0)
                        
                        DashboardCard(
                            title: "Net Balance",
                            amount: model.netBalance,
                            icon: "chart.pie.fill",
                            backgroundColor: balanceColor,
                            textColor: textColor
                        )
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.vertical)
            }
            .navigationTitle("Dashboard")
        }
        .sheet(isPresented: $showGmailConnect) {
            GmailConnectView(isPresented: $showGmailConnect)
        }
    }
}

struct DashboardCard: View {
    let title: String
    let amount: Double
    let icon: String
    let backgroundColor: Color
    let textColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(textColor)
            }
            
            Text("₹\(String(format: "%.0f", amount))")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(textColor)
        }
        .padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(16)
    }
}

#Preview {
    DashboardView()
        .environmentObject(TransactionModel())
}

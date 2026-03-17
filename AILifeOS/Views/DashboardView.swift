import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var model: TransactionModel
    @State private var showGmailConnect = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 14) {
                    // Header
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 8) {
                            Image(systemName: "dollarsign.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                            
                            Text("Financial Overview")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.black)
                        }
                        
                        Text("Track your transactions smartly")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    
                    // Gmail Connect Button
                    Button(action: { showGmailConnect = true }) {
                        HStack(spacing: 12) {
                            Image(systemName: "envelope.fill")
                                .font(.system(size: 16))
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Connect Gmail")
                                    .font(.system(size: 15, weight: .semibold))
                                Text("Import banking emails")
                                    .font(.system(size: 11))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 14)
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
                        .padding(.horizontal, 16)
                        .foregroundColor(.black)
                    }
                    
                    // Stats Cards
                    VStack(spacing: 10) {
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
                    .padding(.horizontal, 16)
                    
                    Spacer().frame(height: 20)
                }
                .frame(maxWidth: .infinity)
            }
            .ignoresSafeArea(edges: .bottom)
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
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundColor(textColor)
            }
            
            Text("₹\(String(format: "%.0f", amount))")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(textColor)
        }
        .padding(14)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(14)
    }
}

#Preview {
    DashboardView()
        .environmentObject(TransactionModel())
}

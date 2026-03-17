import SwiftUI

struct InsightsView: View {
    @EnvironmentObject var model: TransactionModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("📊 Financial Insights")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                        
                        Text("See where your money goes")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top)
                    
                    // Top Categories
                    VStack(alignment: .leading, spacing: 12) {
                        Text("💰 Top Spending Categories")
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        if model.topCategories.isEmpty {
                            Text("No spending data available")
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            VStack(spacing: 8) {
                                ForEach(Array(model.topCategories.enumerated()), id: \.element.category) { index, item in
                                    InsightCard(
                                        rank: index + 1,
                                        title: item.category,
                                        amount: item.amount
                                    )
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    // Top Merchants
                    VStack(alignment: .leading, spacing: 12) {
                        Text("🏪 Top Merchants")
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        if model.topMerchants.isEmpty {
                            Text("No merchant data available")
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            VStack(spacing: 8) {
                                ForEach(Array(model.topMerchants.enumerated()), id: \.element.merchant) { index, item in
                                    InsightCard(
                                        rank: index + 1,
                                        title: item.merchant,
                                        amount: item.amount
                                    )
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
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
            .navigationTitle("Insights")
        }
    }
}

struct InsightCard: View {
    let rank: Int
    let title: String
    let amount: Double
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 0.0, green: 0.3, blue: 0.8).opacity(0.2),
                                Color(red: 0.0, green: 0.5, blue: 1.0).opacity(0.3)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 45, height: 45)
                
                Text("\(rank)")
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.blue)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Text("₹\(String(format: "%.0f", amount))")
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}

#Preview {
    InsightsView()
        .environmentObject(TransactionModel())
}

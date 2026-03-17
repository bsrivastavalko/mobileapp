import SwiftUI

struct InsightsView: View {
    @EnvironmentObject var model: TransactionModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Top Categories
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Top Spending Categories")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        if model.topCategories.isEmpty {
                            Text("No spending data available")
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            VStack(spacing: 8) {
                                ForEach(Array(model.topCategories.enumerated()), id: \.element.category) { index, item in
                                    HStack {
                                        Text("\(index + 1). \(item.category)")
                                            .font(.subheadline)
                                        
                                        Spacer()
                                        
                                        Text("₹\(String(format: "%.0f", item.amount))")
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    // Top Merchants
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Top Merchants")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        if model.topMerchants.isEmpty {
                            Text("No merchant data available")
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            VStack(spacing: 8) {
                                ForEach(Array(model.topMerchants.enumerated()), id: \.element.merchant) { index, item in
                                    HStack {
                                        Text("\(index + 1). \(item.merchant)")
                                            .font(.subheadline)
                                        
                                        Spacer()
                                        
                                        Text("₹\(String(format: "%.0f", item.amount))")
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
            }
            .navigationTitle("Insights")
        }
    }
}

#Preview {
    InsightsView()
        .environmentObject(TransactionModel())
}

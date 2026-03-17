# AI Life OS - iOS MVP

## 📱 Project Structure

```
AILifeOS/
├── AILifeOSApp.swift                 # Main app entry point
├── Models/
│   ├── Transaction.swift             # Transaction data model
│   └── TransactionModel.swift        # View model with logic
├── Views/
│   ├── ContentView.swift             # Tab navigation
│   ├── DashboardView.swift           # Financial overview dashboard
│   ├── TransactionsListView.swift    # Transaction history
│   ├── InsightsView.swift            # Spending analytics
│   ├── SearchView.swift              # Transaction search
│   └── AddTransactionView.swift      # Add manual transactions
└── Info.plist                        # App configuration
```

## ✨ Features Implemented (MVP)

### 1. **Dashboard**
- Monthly Income (all credit transactions)
- Monthly Expense (all debit transactions)
- Net Balance (income - expense)
- Color-coded cards for quick visualization

### 2. **Transactions List**
- View all transactions sorted by date (newest first)
- Transaction details: merchant, category, amount, datetime
- Add new transaction button
- Type indicator (credit/debit) with visual icons

### 3. **Insights**
- Top 5 spending categories with amounts
- Top 5 merchants with amounts
- Ranked list view

### 4. **Search**
- Search transactions by merchant name
- Search by category
- Real-time filtering
- Clear button for quick reset

### 5. **Manual Entry**
- Add new transactions manually
- Select transaction type (credit/debit)
- Choose category from predefined list
- Set date and amount
- All data stored locally

## 🚀 How to Run

### Prerequisites
- Mac with Xcode 15.0 or later
- iOS 16.0+ deployment target

### Setup

1. **Open in Xcode**
```bash
open AILifeOS.xcodeproj
```

2. **Select Target**
- Choose "AILifeOS" from the scheme dropdown

3. **Select Simulator**
- Choose iPhone 15 Pro or any iOS 16+ simulator

4. **Build & Run**
- Press Cmd + R or click the Play button

### Code Structure

**Data Model (Transaction.swift)**
```swift
struct Transaction {
    let id: UUID
    let datetime: Date
    let type: TransactionType  // .credit or .debit
    let amount: Double
    let merchant: String
    let category: String
    let source: String
}
```

**View Model (TransactionModel.swift)**
- `@Published transactions` - array of all transactions
- Computed properties for income, expense, balance
- Top categories and merchants calculation
- Search filtering

## 📊 Sample Data

The app comes with 5 sample transactions:
- Amazon purchase (₹1500)
- Salary credit (₹50000)
- Starbucks (₹800)
- EMI payment (₹3000)
- Food order (₹2500)

## 🔐 Privacy-First Design

✅ All data stored locally on device
✅ No cloud sync (Phase 1 MVP)
✅ No sensitive raw data stored
✅ Only structured insights preserved
✅ No internet requests

## 📝 Next Steps (Phase 2+)

- [ ] Gmail API integration with OAuth
- [ ] PDF statement parsing
- [ ] Encrypted local database (SQLite)
- [ ] Cloud sync with encryption
- [ ] Scam detection engine
- [ ] Behavior tracking
- [ ] Android version

## 🛠️ Tech Stack

- **Language**: Swift
- **UI Framework**: SwiftUI
- **Architecture**: MVVM
- **Data Storage**: In-memory (Phase 1)
- **iOS Support**: iOS 16.0+

## 📱 UI Navigation

```
┌─ Dashboard
│  └─ Financial overview cards
├─ Transactions
│  ├─ List view
│  └─ Add transaction modal
├─ Insights
│  ├─ Top categories
│  └─ Top merchants
└─ Search
   └─ Merchant/category search
```

## ✅ MVP Checklist

- [x] Dashboard with income/expense/balance
- [x] Transactions list view
- [x] Add transaction manually
- [x] Insights (top categories & merchants)
- [x] Search functionality
- [x] Privacy-first local storage
- [x] Sample data for testing
- [ ] Gmail integration (Phase 2)
- [ ] PDF upload (Phase 2)
- [ ] Persistent storage (Phase 2)

---

**Version**: 1.0 (MVP)  
**Platform**: iOS 16.0+  
**Status**: Ready for Testing ✅

# AI Life OS - Quick Reference Guide

## 📱 App Features at a Glance

### 🏠 Dashboard
- **What it shows**: Financial overview
- **Key metrics**: Income, Expense, Balance
- **Calculations**: Sum of all credit/debit transactions
- **Interactions**: View-only
- **Data source**: TransactionModel

### 💳 Transactions
- **What it shows**: List of all transactions
- **Sorting**: Newest first (by date)
- **Actions**: Add new transaction
- **Form fields**: Type, Amount, Merchant, Category, Date
- **Validation**: Amount & Merchant required

### 📊 Insights
- **What it shows**: Spending analytics
- **Metrics**: 
  - Top 5 categories
  - Top 5 merchants
- **Calculations**: Sum of debits by category/merchant
- **Interactions**: View-only

### 🔍 Search
- **What it shows**: Filtered transaction list
- **Search by**: Merchant name or category
- **Case sensitivity**: Insensitive
- **Real-time**: Yes
- **Clear button**: Resets filter

---

## 🔧 Code Quick Reference

### File Locations

```swift
// App entry point
AILifeOSApp.swift

// Models
Models/Transaction.swift
Models/TransactionModel.swift

// Views
Views/ContentView.swift
Views/DashboardView.swift
Views/TransactionsListView.swift
Views/InsightsView.swift
Views/SearchView.swift
Views/AddTransactionView.swift

// Config
Info.plist
AILifeOS.xcodeproj/
```

### Key Classes/Structs

```swift
@main
struct AILifeOSApp { ... }

struct Transaction: Identifiable, Codable { ... }

class TransactionModel: ObservableObject {
    @Published var transactions: [Transaction]
    var monthlyIncome: Double { ... }
    var monthlyExpense: Double { ... }
    var netBalance: Double { ... }
    var topCategories: [(String, Double)] { ... }
    var topMerchants: [(String, Double)] { ... }
}
```

### Common Methods

```swift
// Add transaction
model.addTransaction(transaction)

// Filter transactions
model.filteredTransactions

// Get calculations
let income = model.monthlyIncome
let expense = model.monthlyExpense
let balance = model.netBalance
```

---

## 📋 Data Schema

```json
{
  "id": "UUID",
  "datetime": "Date",
  "type": "credit|debit",
  "amount": 1500.0,
  "merchant": "Amazon",
  "category": "Shopping",
  "source": "Gmail|Manual|PDF"
}
```

### Categories (Available)

```
Food
Shopping
EMI
Salary
Utilities
Entertainment
Transport
```

### Transaction Types

```
Credit  → Money coming in (income)
Debit   → Money going out (expense)
```

---

## 🎨 UI Components

### DashboardCard
```swift
DashboardCard(
    title: "Monthly Income",
    amount: 50000,
    backgroundColor: Color.green.opacity(0.1),
    textColor: .green
)
```

### TransactionRow
- Shows merchant, category, date
- Displays amount with +/- indicator
- Color-coded by type
- Dynamic icon (up/down arrow)

### SearchBar
- Magnifying glass icon
- Text input field
- Clear button (X)
- Rounded background

---

## 🚀 Common Tasks

### Add New Category

**File**: `Views/AddTransactionView.swift`

```swift
let categories = [
    "Food",
    "Shopping",
    "EMI",
    "Salary",
    "Utilities",
    "Entertainment",
    "Transport",
    "YOUR_NEW_CATEGORY"  // Add here
]
```

### Modify Dashboard Cards

**File**: `Views/DashboardView.swift`

```swift
DashboardCard(
    title: "Custom Title",
    amount: model.someValue,
    backgroundColor: Color.blue.opacity(0.1),
    textColor: .blue
)
```

### Change Tab Order

**File**: `Views/ContentView.swift`

```swift
TabView(selection: $selectedTab) {
    YourView1() // First tab
        .tabItem { Label("Tab1", systemImage: "icon") }
        .tag(0)
    
    YourView2() // Second tab
        .tabItem { Label("Tab2", systemImage: "icon") }
        .tag(1)
    // Add/remove tabs here
}
```

### Update Sample Data

**File**: `Models/TransactionModel.swift` → `loadSampleData()`

```swift
let sampleTransactions = [
    Transaction(
        datetime: Date(),
        type: .debit,
        amount: 1000,
        merchant: "Your Merchant",
        category: "Category",
        source: "Manual"
    )
    // Add more here
]
```

---

## 🐛 Debugging Tips

### Check if data is loading
```swift
print("Transactions count: \(model.transactions.count)")
```

### Verify calculations
```swift
print("Income: \(model.monthlyIncome)")
print("Expense: \(model.monthlyExpense)")
print("Balance: \(model.netBalance)")
```

### View filtered results
```swift
print("Search results: \(filteredTransactions.count)")
```

### Monitor state changes
```swift
@State private var debugMode = false
// Add debug info to UI
```

---

## 📊 Data Flow Examples

### Adding a Transaction

```
User fills form (AddTransactionView)
    ↓
User taps Save
    ↓
model.addTransaction(transaction)
    ↓
@Published array updates
    ↓
Views refresh automatically
    ↓
TransactionRow appears in list
```

### Searching

```
User types "Amazon"
    ↓
$searchText updates
    ↓
filteredTransactions computed property runs
    ↓
Results filter in real-time
    ↓
List updates to show matches
```

### Dashboard Calculation

```
TransactionModel initializes
    ↓
loadSampleData() populates transactions
    ↓
monthlyIncome property computed (sum of credits)
    ↓
DashboardView reads value
    ↓
Card displays calculated amount
```

---

## 🔐 Privacy Checklist

- [x] No raw email/SMS storage
- [x] Only structured data stored
- [x] All local processing
- [x] No external API calls (Phase 1)
- [x] No user tracking
- [x] No analytics
- [x] Encrypted ready (Phase 2)

---

## 🎯 Testing Checklist

### Quick Test (5 mins)
- [ ] App launches
- [ ] Dashboard shows numbers
- [ ] Can add transaction
- [ ] Search works

### Full Test (15 mins)
- [ ] All 4 tabs work
- [ ] Transactions display correctly
- [ ] Math is accurate
- [ ] Forms validate
- [ ] No crashes

### Deep Test (30 mins)
- [ ] Edge cases (0 amount, long names)
- [ ] Memory usage
- [ ] Performance (scroll, search)
- [ ] Cross-tab consistency

---

## 📱 Simulator Controls

| Action | Key |
|--------|-----|
| Launch | Cmd+R |
| Stop | Cmd+. |
| Build | Cmd+B |
| Clean | Cmd+Shift+K |
| Run Tests | Cmd+U |
| Minimize | Esc |
| Device rotation | Cmd+← / Cmd+→ |
| Toggle keyboard | Cmd+K |

---

## 🎨 Color Palette

| Element | Color | Opacity |
|---------|-------|---------|
| Income | Green | 0.1 |
| Expense | Red | 0.1 |
| Balance | Blue | 0.1 |
| Text | Primary/Gray | 1.0 |
| Background | System | 0.6 |

---

## 📐 Font Sizes

```
Title:       .title2
Heading:     .headline
Subheading:  .subheadline
Body:        .body
Caption:     .caption
Caption 2:   .caption2
```

---

## 🔗 Common Imports

```swift
import SwiftUI
import Foundation
```

---

## ⌨️ Keyboard Shortcuts (Xcode)

| Action | Shortcut |
|--------|----------|
| Format | Ctrl+I |
| Comment | Cmd+/ |
| Find | Cmd+F |
| Find & Replace | Cmd+Option+F |
| Rename | Cmd+Option+R |
| Move Up/Down | Cmd+Option+↑/↓ |

---

## 📚 Resources

- [Apple Swift Docs](https://swift.org)
- [SwiftUI Docs](https://developer.apple.com/tutorials/swiftui)
- [Xcode Help](https://help.apple.com/xcode)

---

**Version**: 1.0  
**Last Updated**: March 17, 2026  
**Status**: MVP Complete ✅

# AI Life OS - Development & Testing Guide

## 🧪 Testing the MVP

### Manual Testing Scenarios

#### 1. Dashboard Testing
- [ ] App launches and shows Dashboard tab first
- [ ] Monthly Income shows ₹50,000 (from salary)
- [ ] Monthly Expense shows ₹7,800
- [ ] Net balance shown in blue
- [ ] Colors are correct (green for income, red for expense)

#### 2. Transactions Testing
- [ ] All 5 sample transactions visible
- [ ] Sorted by date (newest first)
- [ ] Click + button opens "Add Transaction" form
- [ ] Add a new transaction and verify it appears
- [ ] Transaction icons show correct type (up/down)
- [ ] Merchant and category visible in list

#### 3. Add Transaction Form
- [ ] Type selector works (Debit/Credit)
- [ ] Amount field accepts numbers only
- [ ] Merchant field accepts text
- [ ] Category picker shows all options
- [ ] Date picker shows current date
- [ ] Save button disabled until amount & merchant filled
- [ ] Cancel closes form without saving
- [ ] Save button adds transaction to list

#### 4. Insights Testing
- [ ] Shows "Top Spending Categories"
  - Food ₹3,300
  - Shopping ₹1,500
  - EMI ₹3,000
- [ ] Shows "Top Merchants"
  - Swiggy ₹2,500
  - Amazon ₹1,500
  - Others...
- [ ] Ranked with numbers (1, 2, 3...)
- [ ] Amounts are correct

#### 5. Search Testing
- [ ] Search by merchant name (e.g., "Amazon")
- [ ] Search by category (e.g., "Food")
- [ ] Case-insensitive search works
- [ ] Clear button (X) resets search
- [ ] "No transactions found" when no matches
- [ ] Empty search shows all transactions

#### 6. Tab Navigation
- [ ] All 4 tabs visible at bottom
- [ ] Tab switching works smoothly
- [ ] Tab icons are clear
- [ ] Active tab highlighted

### Unit Testing (Future)

Create unit tests for:
```swift
// TransactionModel tests
- testMonthlyIncomeCalculation()
- testMonthlyExpenseCalculation()
- testNetBalanceCalculation()
- testTopCategoriesOrdering()
- testSearchFiltering()
```

## 🔍 Code Review Checklist

### Views
- [x] DashboardView - displays cards correctly
- [x] TransactionsListView - shows all transactions
- [x] InsightsView - shows top categories/merchants
- [x] SearchView - filters transactions
- [x] AddTransactionView - form validation

### Models
- [x] Transaction struct - complete data schema
- [x] TransactionModel - calculations correct
- [x] ObservableObject - state management working

### Data Flow
- [x] App initializes with sample data
- [x] Adding transaction updates UI
- [x] Search filters live update
- [x] All calculations are real-time

## 🎨 UI/UX Testing

### Visual Verification
- [ ] Font sizes are readable
- [ ] Colors match design (green/red/blue)
- [ ] Spacing is consistent
- [ ] Rounded corners on cards
- [ ] List separators visible
- [ ] Icons are clear and sized correctly

### Responsive Design
- [ ] Works on iPhone 14 Pro
- [ ] Works on iPhone 15
- [ ] Works on iPad (portrait)
- [ ] Text wraps correctly
- [ ] No overlapping elements

### Navigation
- [ ] No crashes on tab switching
- [ ] Back button works for modals
- [ ] modal closes properly when saving
- [ ] Can add multiple transactions in sequence

## 🐛 Known Issues / Limitations (Phase 1)

1. **No Persistent Storage**
   - Data resets on app restart
   - Solution: Local database (Phase 2)

2. **No Gmail Integration**
   - Manual entry only
   - Solution: OAuth + Gmail API (Phase 2)

3. **No PDF Upload**
   - No statement parsing
   - Solution: Vision API + PDF parsing (Phase 2)

4. **No Cloud Sync**
   - Single device only
   - Solution: Encrypted sync (Phase 3)

5. **No Encryption**
   - In-memory storage only
   - Solution: Encrypted KeyChain (Phase 2)

## 📊 Performance Notes

- Sample data loads instantly
- Search filters in real-time
- No lag in transitions
- Font rendering smooth
- Memory footprint minimal

## 🔒 Security Review

**Current State (MVP)**
- Data stored in-memory (not persisted)
- No API calls
- No external data transmission
- No user tracking
- All processing on-device ✅

**Future Considerations**
- Implement Keychain for sensitive data
- Use Codable for encrypted persistence
- Validate all user inputs
- Implement certificate pinning for APIs

## 📋 Testing Report Template

```
Date: __________
Tester: __________
Device: __________
iOS Version: __________

Dashboard Test: ✅ / ❌
Transactions Test: ✅ / ❌
Add Transaction Test: ✅ / ❌
Insights Test: ✅ / ❌
Search Test: ✅ / ❌

Issues Found:
1. ________________________________________
2. ________________________________________

Comments:
________________________________________
```

## 🚀 Building for TestFlight

When ready for beta testing:

```bash
# Create archive
Cmd + Shift + K   # Clean build

# Select "Any iOS Device" and build

# In Organizer:
Window → Organizer → App Archives
Right-click → Distribute App
```

## 💻 Running on Physical Device

1. Connect iPhone via USB
2. Select device in Xcode
3. Sign with Apple ID
4. Press Cmd + R to run

---

**MVP Test Status**: Ready for testing ✅
**Last Updated**: March 17, 2026

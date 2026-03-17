# AI Life OS - Developer Setup Guide

## 📦 Project Setup

### Folder Structure

Your workspace should now have:

```
/workspaces/codespaces-blank/
├── AILifeOS/                              # Main app folder
│   ├── AILifeOSApp.swift                 # App entry point
│   ├── Info.plist                        # App configuration
│   ├── Models/
│   │   ├── Transaction.swift             # Data model
│   │   └── TransactionModel.swift        # ViewModel
│   └── Views/
│       ├── ContentView.swift             # Main tab view
│       ├── DashboardView.swift
│       ├── TransactionsListView.swift
│       ├── InsightsView.swift
│       ├── SearchView.swift
│       └── AddTransactionView.swift
├── AILifeOS.xcodeproj/                   # Xcode project
├── readme.md                             # Original requirements
├── MVP_README.md                         # MVP overview
└── TESTING_GUIDE.md                      # Testing instructions
```

## ⚙️ System Requirements

- **macOS**: 12.0 or later
- **Xcode**: 15.0 or later
- **Swift**: 5.8+
- **iOS Target**: 16.0+

## 🎯 Quick Start

### 1. Open Project in Xcode

```bash
cd /workspaces/codespaces-blank
open AILifeOS.xcodeproj
```

### 2. Select Target & Simulator

- Target: AILifeOS
- Device: iPhone 15 Pro Simulator (or any iOS 16+ device)

### 3. Build & Run

```
Cmd + R   (in Xcode)
```

OR from terminal:
```bash
xcodebuild -scheme AILifeOS -destination generic/platform=iOS
```

## 🔧 Build Configuration

### Debug Build
- Optimizations: Disabled
- Debug Info: Full
- Symbol Stripping: None
- Perfect for development

### Release Build
- Optimizations: Enabled
- Debug Info: Stripped
- Symbol Stripping: Yes
- For TestFlight/App Store

## 📝 Code Style Guidelines

### Swift Style
```swift
// Good
var monthlyIncome: Double {
    transactions
        .filter { $0.type == .credit }
        .reduce(0) { $0 + $1.amount }
}

// File organization
// 1. Headers/Documentation
// 2. Imports
// 3. Type definitions
// 4. MARK: - Properties
// 5. MARK: - Lifecycle
// 6. MARK: - View Body
// 7. MARK: - Private Methods
```

### SwiftUI View Template
```swift
struct MyView: View {
    @EnvironmentObject var model: TransactionModel
    @State private var someState = ""
    
    var body: some View {
        // UI code
    }
    
    // MARK: - Private Methods
    
    // MARK: - Preview
}

#Preview {
    MyView()
        .environmentObject(TransactionModel())
}
```

## 🔄 Development Workflow

### Adding New Feature

1. **Create Model** (if needed)
   ```swift
   // Models/NewFeature.swift
   struct NewFeature { ... }
   ```

2. **Create View**
   ```swift
   // Views/NewFeatureView.swift
   struct NewFeatureView: View { ... }
   ```

3. **Add to Navigation**
   ```swift
   // ContentView.swift
   .tabItem {
       Label("Feature", systemImage: "icon")
   }
   ```

4. **Test**
   - Run on simulator
   - Test on device
   - Check performance

### Modifying Existing Code

1. Make changes
2. Cmd + B to build
3. Run tests
4. Cmd + R to run on simulator
5. Verify functionality

## 🐛 Common Issues & Solutions

### Issue: "Thread 1: SIGABRT" crash
**Solution**: Check that all @EnvironmentObject are provided correctly

### Issue: Build fails with "Cannot find 'X' in scope"
**Solution**: Ensure file is added to target in Xcode
- Select file → File Inspector → Target Membership

### Issue: Simulator shows blank screen
**Solution**: 
1. Cmd + Shift + K (Clean Build Folder)
2. Cmd + B (Build)
3. Cmd + R (Run)

### Issue: Changes not reflecting in simulator
**Solution**: 
1. Stop running app
2. Clean build folder (Cmd + Shift + K)
3. Run again

## 📈 Performance Optimization Tips

1. **Use @State wisely**
   - Only for local UI state
   - Use @EnvironmentObject for shared data

2. **Avoid heavy computations in body**
   - Use computed properties instead
   - Cache results when possible

3. **List Performance**
   - ForEach with id: parameter
   - Avoid complex calculations in list rows

4. **Memory Management**
   - Use weak self in closures
   - Release resources in deinit

## 🧪 Running Tests

Create tests in `AILifeOSTests/`:

```swift
import XCTest
@testable import AILifeOS

class TransactionModelTests: XCTestCase {
    var sut: TransactionModel!
    
    override func setUp() {
        super.setUp()
        sut = TransactionModel()
    }
    
    func testMonthlyIncomeCalculation() {
        XCTAssertEqual(sut.monthlyIncome, 50000)
    }
}
```

Run tests:
```
Cmd + U   (in Xcode)
```

## 📱 Device Testing

### Prepare Device
1. Connect iPhone via USB
2. Trust the computer
3. Open Xcode → Window → Devices and Simulators
4. Sign Apple ID

### Deploy
1. Select device in Xcode dropdown
2. Press Cmd + R
3. App installs on device

## 🔐 Code Signing

For local development:
- Automatic signing is enabled
- Xcode manages certificates automatically

For App Store submission:
- Use Paid Apple Developer Account
- Create certificates manually
- Set up provisioning profiles

## 📚 Useful Xcode Shortcuts

| Action | Shortcut |
|--------|----------|
| Build | Cmd + B |
| Run | Cmd + R |
| Stop | Cmd + . |
| Clean Build | Cmd + Shift + K |
| Run Tests | Cmd + U |
| Jump to Definition | Cmd + Click |
| Find in Project | Cmd + Shift + F |
| Format Code | Ctrl + I |
| Comment/Uncomment | Cmd + / |

## 🚀 Deployment Checklist

- [ ] All tests passing
- [ ] No build warnings
- [ ] Privacy policy created
- [ ] App icons added
- [ ] Screenshots ready
- [ ] Demo video recorded
- [ ] TestFlight build successful
- [ ] Beta testers invited

## 📞 Support Resources

- [Apple Swift Docs](https://swift.org/documentation)
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [Xcode Help](https://help.apple.com/xcode)
- [iOS Development Guide](https://developer.apple.com/design)

---

**Last Updated**: March 17, 2026
**MVP Version**: 1.0
**Status**: Ready for Development ✅

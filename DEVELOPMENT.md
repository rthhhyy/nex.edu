# Development Guide - nex.edu

## Project Setup & Configuration

### 1. Environment Setup

#### Install Flutter & Dart
```bash
# macOS (using Homebrew)
brew install flutter

# Or download from: https://flutter.dev/docs/get-started/install

# Verify installation
flutter --version
dart --version
```

#### Clone the Repository
```bash
git clone https://github.com/rthhhyy/nex.edu.git
cd nex.edu

# Checkout feature branch
git checkout feature/ai-educator-complete
```

#### Install Dependencies
```bash
# Get Flutter packages
flutter pub get
flutter pub upgrade

# Upgrade Flutter SDK
flutter upgrade
```

### 2. Firebase Configuration

#### Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Create Project"
3. Enter project name: "nex-edu"
4. Enable Google Analytics (optional)
5. Create project

#### Android Setup
1. In Firebase Console, add Android app
2. Enter package name: `com.nexedu.app`
3. Download `google-services.json`
4. Place in `android/app/` directory

#### iOS Setup
1. In Firebase Console, add iOS app
2. Enter bundle ID: `com.nexedu.app`
3. Download `GoogleService-Info.plist`
4. Place in `ios/Runner/` and add to Xcode

#### Enable Services in Firebase
- ✅ Authentication (Email/Password)
- ✅ Firestore Database
- ✅ Cloud Storage
- ✅ Realtime Database (optional)

### 3. Run the Application

#### Android
```bash
# List connected devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Run in debug mode
flutter run

# Run in release mode
flutter run --release
```

#### iOS
```bash
# Ensure Xcode is installed
flutter run -d "iPhone 15"

# Or use physical device
flutter devices
flutter run -d <device-id>
```

#### Web
```bash
flutter run -d chrome
flutter run -d firefox
flutter run -d edge
```

### 4. Code Organization Standards

#### Naming Conventions
- **Files**: `snake_case.dart` (e.g., `login_screen.dart`)
- **Classes**: `PascalCase` (e.g., `LoginScreen`)
- **Variables**: `camelCase` (e.g., `isLoading`)
- **Constants**: `camelCase` (e.g., `appTitle`)
- **Enums**: `PascalCase` (e.g., `GoalType`)

#### File Structure
```
lib/
├── screens/          # All UI screens
├── widgets/          # Reusable widgets
├── providers/        # State management (Provider)
├── services/         # API & Firebase services
├── models/           # Data models
├── theme/            # App theme & colors
├── utils/            # Utility functions
└── main.dart         # Entry point
```

### 5. State Management (Provider)

#### Creating a Provider
```dart
class MyProvider extends ChangeNotifier {
  String _data = '';
  
  String get data => _data;
  
  void updateData(String newData) {
    _data = newData;
    notifyListeners();
  }
}
```

#### Using Provider in Widgets
```dart
// Reading data
context.read<MyProvider>().updateData('new');

// Watching data (rebuilds on change)
Watch<MyProvider>()

// Building with Consumer
Consumer<MyProvider>(
  builder: (context, provider, child) {
    return Text(provider.data);
  },
)
```

### 6. Firebase Firestore Operations

#### Read Data
```dart
final doc = await FirebaseFirestore.instance
  .collection('users')
  .doc(userId)
  .get();
```

#### Write Data
```dart
await FirebaseFirestore.instance
  .collection('users')
  .doc(userId)
  .set({
    'name': 'John',
    'email': 'john@example.com',
  });
```

#### Real-time Listeners
```dart
FirebaseFirestore.instance
  .collection('users')
  .doc(userId)
  .snapshots()
  .listen((doc) {
    // Handle updates
  });
```

### 7. Testing

#### Unit Tests
```bash
flutter test test/unit_test.dart
```

#### Widget Tests
```bash
flutter test test/widget_test.dart
```

#### Integration Tests
```bash
flutter test integration_test/app_test.dart
```

### 8. Building for Release

#### Android Release
```bash
# Generate keystore (first time only)
keytool -genkey -v -keystore ~/key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias key

# Build APK
flutter build apk

# Build App Bundle
flutter build appbundle
```

#### iOS Release
```bash
# Build IPA
flutter build ios --release

# Archive for App Store
open ios/Runner.xcworkspace
```

### 9. Debugging Tips

#### Hot Reload
```bash
# Press 'r' in terminal after `flutter run`
# Or press Ctrl+Backspace (Cmd+Backspace on Mac)
```

#### Debug Output
```dart
import 'dart:developer' as developer;

developer.log('Message', level: 800);
```

#### Device Logs
```bash
flutter logs
adb logcat  # Android
xcode logs  # iOS
```

### 10. Performance Optimization

#### Common Issues & Solutions

**Issue**: Slow frame rate
**Solution**:
- Use `const` constructors
- Rebuild only necessary widgets
- Use `RepaintBoundary` for expensive widgets

**Issue**: Memory leaks
**Solution**:
- Dispose controllers and listeners
- Cancel subscriptions
- Use `StreamBuilder` for streams

**Issue**: Large APK size
**Solution**:
- Use ProGuard/R8 for Android
- Remove unused assets
- Enable shrinking

---

## Git Workflow

### Branching Strategy
```bash
# Create feature branch
git checkout -b feature/feature-name

# Create bugfix branch
git checkout -b bugfix/issue-name

# Create hotfix branch
git checkout -b hotfix/critical-issue
```

### Commit Messages
```bash
# Format: type(scope): subject
# Examples:
git commit -m "feat(auth): add login screen"
git commit -m "fix(quiz): fix timer bug"
git commit -m "docs(readme): update setup guide"

# Types: feat, fix, docs, style, refactor, test, chore
```

### Pull Requests
1. Push to feature branch
2. Create PR with description
3. Request review
4. Merge after approval
5. Delete feature branch

---

## Code Quality Standards

### Linting
```bash
flutter analyze
dart analyze
```

### Formatting
```bash
dart format lib/
dart fix --apply
```

### Coverage
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

---

## Useful Commands

```bash
# Clean build
flutter clean
flutter pub get

# Get all Flutter info
flutter doctor

# Generate app icon
# Use flutter_launcher_icons package

# Update dependencies
flutter pub upgrade

# Check for outdated packages
flutter pub outdated

# Generate project documentation
dartdoc
```

---

## Troubleshooting

### Common Issues

1. **"The SDK is not found in the expected location"**
   ```bash
   flutter config --android-sdk /path/to/android-sdk
   ```

2. **"Gradle task assembleDebug failed"**
   ```bash
   ./gradlew clean
   flutter clean
   flutter pub get
   ```

3. **"Pod install error" on iOS**
   ```bash
   rm -rf ios/Pods ios/Podfile.lock
   flutter pub get
   flutter run
   ```

4. **"FirebaseAuth not found"**
   - Ensure `google-services.json` and `GoogleService-Info.plist` are in correct locations
   - Run `flutter clean` and `flutter pub get`

---

## Next Steps

1. ✅ Complete onboarding screens
2. 🔄 Integrate Firebase
3. 📝 Implement quiz system
4. 📊 Add progress analytics
5. 🎨 Polish animations
6. 🧪 Write tests
7. 📱 Release to Play Store & App Store

---

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Firebase for Flutter](https://firebase.flutter.dev/)
- [Provider Package](https://pub.dev/packages/provider)
- [Material Design](https://material.io/design)

---

**Need help?** Open an issue or check the documentation! 🚀

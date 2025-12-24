# Troubleshooting Guide

## Common Issues & Solutions

### 1. Build Issues

#### "com.google.gms:google-services plugin not found"
**Problem**: Gradle can't find Google Services plugin
```
error: Plugin with id 'com.google.gms.google-services' not found
```

**Solution**:
```gradle
// android/build.gradle
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Make sure this line exists
        classpath 'com.google.gms:google-services:4.3.15'
    }
}

// android/app/build.gradle
plugins {
    id 'com.android.application'
    // Add this line
    id 'com.google.gms.google-services'
}
```

#### "google-services.json file is missing"
**Problem**: Android can't find Firebase credentials
```
Error: google-services.json not found
```

**Solution**:
1. Go to Firebase Console → Project Settings
2. Click "Download google-services.json"
3. Place it at: `mobile/android/app/google-services.json`
4. Run `flutter clean && flutter pub get`

---

### 2. Firebase Issues

#### "FirebaseApp not initialized"
**Problem**: App crashes on startup with Firebase initialization error

**Android Solution**:
- Ensure `google-services.json` is in `android/app/`
- Add to `android/app/build.gradle`:
```gradle
apply plugin: 'com.google.gms.google-services'
```

**iOS Solution**:
- Open `ios/Runner.xcworkspace` (not .xcodeproj)
- Drag `GoogleService-Info.plist` into Xcode
- Check "Copy items if needed"
- Select "Runner" target only

#### "PlatformException: PERMISSION_DENIED"
**Problem**: Can't sign up/sign in, Firestore permission denied

**Solution**: Update Firestore security rules:
```firestore
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

#### Firebase Auth not responding
**Problem**: Signup/login hangs or times out

**Solution**:
1. Check Firebase project is active
2. Verify email/password auth is enabled
3. Check internet connection
4. Try restarting the app
5. Check Firebase logs in console

---

### 3. Riverpod Issues

#### "ProviderContainer not found in context"
**Problem**: Provider watch fails

**Solution**: Make sure you're using ConsumerWidget:
```dart
// ❌ Wrong
class MyScreen extends StatelessWidget {
  Widget build(context) {
    ref.watch(myProvider);  // ERROR
  }
}

// ✅ Correct
class MyScreen extends ConsumerWidget {
  Widget build(context, ref) {
    ref.watch(myProvider);  // OK
  }
}
```

#### "Provider not rebuilding when data changes"
**Problem**: UI doesn't update when provider changes

**Solution**: Always use `ref.watch` not `ref.read`:
```dart
// ❌ Won't rebuild
final data = ref.read(myProvider);

// ✅ Will rebuild
final data = ref.watch(myProvider);
```

---

### 4. Network Issues

#### "Connection refused" (API not responding)
**Problem**: 
```
ConnectionRefusedException: Connection refused at localhost:8000
```

**Solution**:
1. Ensure backend is running: `python -m uvicorn main:app --reload`
2. Check backend is on localhost:8000
3. For Android emulator, use `10.0.2.2:8000` instead of `localhost:8000`
4. Update `ApiService` baseUrl:
```dart
// lib/services/api_service.dart
static const String baseUrl = 'http://10.0.2.2:8000';  // For emulator
// or
static const String baseUrl = 'http://localhost:8000';  // For device
```

#### "Timeout waiting for API response"
**Problem**: API takes too long to respond

**Solution**: Increase timeout in ApiService:
```dart
// lib/services/api_service.dart
Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),  // Increase this
    receiveTimeout: const Duration(seconds: 30),   // And this
  ),
);
```

#### CORS errors when calling API
**Problem**: 
```
error: CORS header 'access-control-allow-origin' missing
```

**Solution**: Backend needs CORS headers. Update FastAPI:
```python
# backend/main.py
from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allow all origins (dev only)
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

---

### 5. Navigation Issues

#### "Undefined route '/home'"
**Problem**: GoRouter doesn't recognize route

**Solution**: Check `lib/config/routes.dart` has the route defined:
```dart
GoRoute(
  path: '/home',  // This path must exist
  builder: (context, state) => const HomeScreen(),
),
```

#### "Infinite redirect loop"
**Problem**: App keeps redirecting back and forth

**Solution**: Check redirect logic in GoRouter:
```dart
// lib/config/routes.dart
redirect: (context, state) {
  final isAuth = ref.watch(isAuthenticatedProvider);
  
  // Make sure logic doesn't create circular redirects
  if (!isAuth) {
    if (state.matchedLocation == '/login') return null;  // Allow login
    return '/login';  // Redirect to login
  }
  
  if (isAuth) {
    if (state.matchedLocation == '/home') return null;  // Allow home
    // Don't redirect authenticated users away from home to login
  }
  
  return null;  // No redirect needed
}
```

---

### 6. UI Issues

#### "Text overflows the screen"
**Problem**: Long text extends beyond widget bounds

**Solution**: Use `Expanded` or `Flexible`:
```dart
// ❌ Wrong
Text('Very long text that overflows...')

// ✅ Correct
Expanded(
  child: Text(
    'Very long text',
    overflow: TextOverflow.ellipsis,  // Add ellipsis
  ),
)
```

#### "Buttons not responding to taps"
**Problem**: Button appears disabled or doesn't respond

**Solution**: Check if `onPressed` is null:
```dart
// ❌ Wrong - disabled when loading
ElevatedButton(
  onPressed: isLoading ? null : _handleTap,  // null = disabled
  child: const Text('Submit'),
)

// ✅ Correct - provide feedback
ElevatedButton(
  onPressed: isLoading ? null : _handleTap,
  child: isLoading 
    ? CircularProgressIndicator()  // Show spinner
    : const Text('Submit'),
)
```

#### "Images not loading from network"
**Problem**: Network image shows error instead of image

**Solution**: Use Image.network with error handling:
```dart
Image.network(
  imageUrl,
  errorBuilder: (context, error, stackTrace) {
    return Container(
      color: Colors.grey[300],
      child: Icon(Icons.image_not_supported),
    );
  },
)
```

---

### 7. State Issues

#### "AuthStateNotifier keeps reloading"
**Problem**: Continuous rebuilds causing flicker

**Solution**: Check if you're reading or watching correctly:
```dart
// In screen
ref.watch(authStateNotifierProvider);  // OK - will rebuild on changes

// In other provider
ref.read(authStateNotifierProvider);   // OK - read once

// Avoid inside build method (can cause rebuilds)
// Instead, use separate provider for logic
```

#### "Can't access authStateNotifierProvider.notifier"
**Problem**: 
```
error: The property 'notifier' isn't defined
```

**Solution**: StateNotifierProvider automatically exposes `.notifier`:
```dart
// ✅ Correct
ref.read(authStateNotifierProvider.notifier).signIn(...)

// ❌ Wrong
ref.read(authStateNotifierProvider).notifier.signIn(...)
```

---

### 8. Form Issues

#### "Form validation not showing errors"
**Problem**: Validator returns error but UI doesn't show it

**Solution**: Ensure FormField is properly wrapped:
```dart
Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) return 'Required';
          return null;
        },
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {  // Important!
            // Form is valid
          }
        },
        child: const Text('Submit'),
      ),
    ],
  ),
)
```

#### "Cannot update widget while building"
**Problem**: 
```
error: setState() called during build
```

**Solution**: Don't modify state during build. Use proper lifecycle:
```dart
// ❌ Wrong
Widget build(context) {
  setState(() { ... });  // ERROR
  return Container();
}

// ✅ Correct
@override
void initState() {
  super.initState();
  // Initialize here
}

Widget build(context) {
  // Don't modify state here
  return Container();
}
```

---

### 9. Debugging

#### "Enable verbose logging"
```bash
flutter run -v  # Verbose output

# or in code
import 'package:flutter/foundation.dart';
debugPrint('Debug message');
```

#### "Check Firestore data"
1. Go to Firebase Console
2. Click "Firestore Database"
3. Click "Collections" to browse data
4. View documents and fields

#### "Check Firebase Auth users"
1. Go to Firebase Console
2. Click "Authentication"
3. Click "Users" tab
4. See all signed-up users

#### "Monitor API requests"
1. Check backend logs: `flutter run -v`
2. Or use network inspector:
```dart
// Add to ApiService for logging
dio.interceptors.add(LoggingInterceptor());
```

---

### 10. Performance Issues

#### "App is slow to load"
**Problem**: Long startup time

**Solution**:
1. Check if Firebase initialization is blocking
2. Split screen building into smaller widgets
3. Use lazy loading for lists:
```dart
ListView.builder(  // Not ListView
  itemCount: items.length,
  itemBuilder: (context, index) => ItemTile(items[index]),
)
```

#### "Memory leaks"
**Problem**: App uses more and more memory

**Solution**: Dispose controllers properly:
```dart
class MyScreen extends StatefulWidget {
  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();  // Important!
    super.dispose();
  }

  @override
  Widget build(context) => TextField(controller: _controller);
}
```

---

## Testing Checklist

Before deploying:

```
Functionality
☐ Signup creates user in Firebase
☐ Login authenticates user
☐ Logout clears session
☐ Can access protected routes when logged in
☐ Redirected to login when logged out
☐ Home screen displays correctly
☐ Navigation to all sections works
☐ Filters work correctly
☐ Search functionality works

UI/UX
☐ App doesn't crash on startup
☐ Loading spinners show during API calls
☐ Error messages display properly
☐ Forms validate correctly
☐ Buttons respond to taps
☐ Text doesn't overflow
☐ Images load correctly
☐ Navigation works smoothly

Network
☐ API requests succeed
☐ Slow network handled gracefully
☐ Connection loss shows error
☐ Token refresh works

Device Specific
☐ Tested on Android
☐ Tested on iOS
☐ Tested on different screen sizes
☐ Tested with slow internet
☐ Tested with offline mode
```

---

## Quick Help Commands

```bash
# Clean everything
flutter clean && flutter pub get && flutter pub upgrade

# Run app with verbose output
flutter run -v

# Build APK
flutter build apk

# Build iOS
flutter build ios

# Check for issues
flutter doctor

# Format code
dart format lib/

# Analyze code
flutter analyze

# Run tests
flutter test

# Upgrade Flutter
flutter upgrade
```

---

## Getting Help

1. **Check Flutter docs**: https://flutter.dev/docs
2. **Riverpod guide**: https://riverpod.dev
3. **Firebase setup**: https://firebase.flutter.dev
4. **Go Router docs**: https://gorouter.dev
5. **Dart docs**: https://dart.dev/guides

---

Still stuck? Check the logs! 🔍

```bash
# Show all logs
flutter run -v

# Search for specific error
flutter run 2>&1 | grep -i "error"

# Save logs to file
flutter run > app.log 2>&1
```

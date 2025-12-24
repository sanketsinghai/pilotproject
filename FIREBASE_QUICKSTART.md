# Running the Jain App with Firebase

## Prerequisites

1. **Flutter SDK** (3.0+)
   ```bash
   flutter --version
   ```

2. **Firebase CLI**
   ```bash
   npm install -g firebase-tools
   firebase login
   ```

3. **Firebase Project**
   - Create at [Firebase Console](https://console.firebase.google.com)
   - Enable Email/Password authentication
   - Create a Firestore database

---

## Android Setup

### 1. Download google-services.json
- Go to Firebase Console → Project Settings
- Download google-services.json
- Place at: `mobile/android/app/google-services.json`

### 2. Update android/build.gradle
Add Google Services plugin:
```gradle
buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.3.15'
    }
}
```

### 3. Update android/app/build.gradle
Apply plugin and add dependencies:
```gradle
apply plugin: 'com.google.gms.google-services'

dependencies {
    implementation 'com.google.firebase:firebase-auth:22.1.2'
    implementation 'com.google.firebase:firebase-firestore:24.8.1'
    implementation 'com.google.firebase:firebase-storage:20.2.1'
}
```

---

## iOS Setup

### 1. Download GoogleService-Info.plist
- Go to Firebase Console → Project Settings
- Download GoogleService-Info.plist
- Open Xcode: `open ios/Runner.xcworkspace`
- Drag GoogleService-Info.plist into Xcode project
- Check "Copy items if needed"
- Select "Runner" target

### 2. Update iOS/Podfile
Uncomment (at bottom of Podfile):
```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
    target.build_configurations.each do |config|
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
        '$(inherited)',
        'FIREBASE_CORE_VERSION=@"10.6.0"',
      ]
    end
  end
end
```

### 3. Update minimum iOS version
In `ios/Podfile`:
```ruby
platform :ios, '12.0'  # Firebase requires at least 12.0
```

---

## Running the App

### 1. Get dependencies
```bash
cd mobile
flutter pub get
```

### 2. Build and run
```bash
# Development
flutter run -d <device_id>

# Or use desktop for testing
flutter run -d chrome

# Production build
flutter build apk     # Android
flutter build ios     # iOS
```

### 3. Test Authentication Flow
1. Click "Create Account" or go to signup
2. Enter email, password, and display name
3. Firebase Auth will create user
4. App redirects to home screen
5. User greeting shows your display name
6. Click logout to test signout

---

## Environment Variables

Create `mobile/.env` (optional):
```env
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_API_KEY=your-api-key
BACKEND_URL=http://localhost:8000
```

Load in `mobile/lib/main.dart`:
```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}
```

---

## Running the Backend

The app expects FastAPI backend at `http://localhost:8000`:

```bash
cd backend
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
uvicorn main:app --reload
```

Check that endpoints are accessible:
- GET http://localhost:8000/temples
- GET http://localhost:8000/granths
- GET http://localhost:8000/dharamshalas
- GET http://localhost:8000/trips
- GET http://localhost:8000/pathshala/lessons

---

## Troubleshooting

### "com.google.gms:google-services not found"
```bash
flutter clean
flutter pub get
# Update gradle in android/build.gradle
```

### "FirebaseApp not initialized"
- Ensure GoogleService-Info.plist is in Xcode (iOS)
- Ensure google-services.json is in android/app/ (Android)
- Run `flutter clean` and rebuild

### "Firestore permission denied"
Update Firestore rules:
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

### "Connection to backend fails"
- Ensure backend is running on localhost:8000
- Check ApiService baseUrl in `lib/services/api_service.dart`
- For Android emulator, use `10.0.2.2:8000` instead of `localhost:8000`

---

## Firestore Structure

Expected collections after app runs:

```
users/
  ├── {uid}/
  │   ├── email: string
  │   ├── displayName: string
  │   ├── createdAt: timestamp
  │   └── favorites: array

temples/
  ├── {id}/
  │   ├── name: string
  │   ├── location: object
  │   ├── description: string
  │   └── images: array

granths/
  ├── {id}/
  │   ├── title: string
  │   ├── author: string
  │   ├── category: string
  │   └── pdfUrl: string

trips/
  ├── {id}/
  │   ├── userId: string
  │   ├── name: string
  │   ├── temples: array
  │   └── status: string

pathsalaLessons/
  ├── {id}/
  │   ├── title: string
  │   ├── ageGroup: string
  │   ├── content: string
  │   └── quiz: array
```

---

## Next Steps

1. ✅ Run the app with `flutter run`
2. ✅ Test signup/login flows
3. ✅ Verify home screen displays
4. ⏳ Build content screens (temples, granths, etc.)
5. ⏳ Integrate with Firestore for data
6. ⏳ Deploy backend to production
7. ⏳ Build APK/IPA for app store submission

---

## Useful Commands

```bash
# Clean everything
flutter clean && flutter pub get

# Run on specific device
flutter run -d <device_name>

# List available devices
flutter devices

# Run with verbose logging
flutter run -v

# Build APK for Android
flutter build apk --split-per-abi

# Build app bundle for Play Store
flutter build appbundle

# Build IPA for iOS
flutter build ios

# Check for issues
flutter doctor
```

---

## Support & Debugging

Enable Riverpod logging in `main.dart`:
```dart
final riverpodLogger = Logger(
  level: Level.debug,
);

ProviderContainer(
  overrides: [
    // Add override if needed
  ],
  observers: [riverpodLogger], // Add logger
);
```

Check Firebase logs:
```bash
firebase functions:log  # If using cloud functions
```

View Firestore data:
- Firebase Console → Cloud Firestore → Browse collections

---

**Happy coding! 🚀**

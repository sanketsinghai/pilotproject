# Flutter Mobile App - Digamber Jain

Project structure for iOS & Android cross-platform app using Flutter.

## Quick Start

```bash
# Create Flutter project
flutter create --org com.digamberjain digamber_jain_app

# Install dependencies
flutter pub get

# Run on device/emulator
flutter run
```

## Directory Structure

```
lib/
├── main.dart                  # App entry point
├── config/
│   ├── constants.dart         # App constants
│   ├── theme.dart             # Theme & colors
│   └── routes.dart            # Named routes
├── models/
│   ├── temple.dart
│   ├── granth.dart
│   ├── trip.dart
│   ├── user.dart
│   └── responses.dart
├── services/
│   ├── api_service.dart       # HTTP client
│   ├── firestore_service.dart # Firestore
│   ├── storage_service.dart   # Local storage (Hive)
│   ├── auth_service.dart      # Firebase Auth
│   └── location_service.dart  # Geolocation
├── providers/                 # Riverpod state management
│   ├── auth_provider.dart
│   ├── temple_provider.dart
│   ├── granth_provider.dart
│   └── trip_provider.dart
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── temples/
│   │   ├── temples_list_screen.dart
│   │   ├── temple_detail_screen.dart
│   │   └── temple_map_screen.dart
│   ├── granths/
│   │   ├── granths_list_screen.dart
│   │   ├── granth_reader_screen.dart
│   │   └── granth_search_screen.dart
│   ├── pathshala/
│   │   ├── pathshala_home_screen.dart
│   │   ├── lesson_screen.dart
│   │   └── quiz_screen.dart
│   ├── trips/
│   │   ├── trips_list_screen.dart
│   │   ├── trip_planner_screen.dart
│   │   └── trip_map_screen.dart
│   ├── profile/
│   │   └── profile_screen.dart
│   └── settings/
│       └── settings_screen.dart
├── widgets/
│   ├── temple_card.dart
│   ├── granth_card.dart
│   ├── bottom_nav_bar.dart
│   └── custom_app_bar.dart
├── utils/
│   ├── validators.dart
│   ├── formatters.dart
│   └── offline_helper.dart
└── generated/              # Auto-generated files

android/
  ├── app/
  │   ├── build.gradle
  │   └── src/main/AndroidManifest.xml
  └── gradle/build.gradle

ios/
  ├── Runner/
  │   ├── GeneratedPluginRegistrant.swift
  │   └── Info.plist
  └── Podfile

pubspec.yaml               # Dependencies
pubspec.lock              # Lockfile

assets/
├── images/
├── fonts/
└── data/
```

## Key Dependencies

See `pubspec.yaml` for complete list.

## Setup Instructions

1. **Clone Repository**
   ```bash
   git clone <repo>
   cd mobile
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Add `google-services.json` (Android)
   - Add `GoogleService-Info.plist` (iOS)
   - Update bundle IDs

4. **Run App**
   ```bash
   flutter run
   ```

5. **Build Release**
   ```bash
   # Android APK
   flutter build apk --release

   # Android App Bundle (for Play Store)
   flutter build appbundle --release

   # iOS
   flutter build ios --release
   ```

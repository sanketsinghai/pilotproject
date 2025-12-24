# Digamber Jain App - Complete Setup Guide

**Project Status**: Zero-Budget Architecture Designed ✅  
**Target**: Android + iOS (Flutter)  
**Backend**: FastAPI + Firestore  
**Estimated MVP Timeline**: 8-12 weeks

---

## 📋 Table of Contents

1. [Project Overview](#project-overview)
2. [Tech Stack Summary](#tech-stack-summary)
3. [Free Services Used](#free-services-used)
4. [Prerequisites & Setup](#prerequisites--setup)
5. [Backend Setup](#backend-setup)
6. [Mobile App Setup](#mobile-app-setup)
7. [Firebase Configuration](#firebase-configuration)
8. [Development Workflow](#development-workflow)
9. [Deployment Steps](#deployment-steps)
10. [Troubleshooting](#troubleshooting)

---

## 🎯 Project Overview

### App Goals
- Discover and visit Jain temples across India (state-wise)
- Access sacred texts (Granths) with offline reading, search, TTS
- Plan multi-temple trips with route optimization
- Learn Jain teachings through interactive pathshala (kids learning)
- Connect with Jain Munis, Dharamshalas, and community

### Key Features
| Feature | Status | Free Service |
|---------|--------|-------------|
| Temple Directory (50+ temples) | MVP | Firestore |
| Granth Library (10+ texts) | MVP | Cloud Storage + Hive |
| Offline Granth Reading | MVP | Hive (local) |
| Trip Planner (A→B with temples) | MVP | GraphHopper + OSM |
| Kids Pathshala (20 lessons) | MVP | Firestore + Hive |
| Muni Directory | Phase 2 | Firestore |
| Social Features | Phase 3 | Firestore + Cloud Functions |

---

## 🛠️ Tech Stack Summary

```
┌─────────────────────────────┐
│  Flutter App (iOS & Android)│
│  - Riverpod (State Mgmt)    │
│  - Hive (Offline Storage)   │
│  - flutter_map (Maps)       │
└────────────┬────────────────┘
             │ REST API
             ▼
┌─────────────────────────────┐
│   FastAPI Backend           │
│   - Async/await             │
│   - Pydantic validation      │
└────────────┬────────────────┘
             │ Firestore SDK
             ▼
┌─────────────────────────────┐
│  Firebase Suite             │
│  - Firestore (Database)     │
│  - Cloud Storage (Docs)     │
│  - Auth (Users)             │
│  - Cloud Functions (Tasks)  │
└─────────────────────────────┘
```

---

## 💰 Free Services Used

### 1. **Firestore** (Primary Database)
- **Free Tier**: 50,000 reads/day, 20,000 writes/day, 1GB storage
- **Cost**: $0 for MVP phase
- **Docs**: https://firebase.google.com/docs/firestore

### 2. **Cloud Storage** (Document Storage)
- **Free Tier**: 5GB/month download, 1GB/day upload
- **Cost**: $0 for phase 1-2
- **Docs**: https://firebase.google.com/docs/storage

### 3. **Firebase Authentication** (User Auth)
- **Free Tier**: Unlimited users
- **Cost**: $0
- **Methods**: Email/password, phone, Google OAuth

### 4. **Deta Space** (Backend Hosting)
- **Free Tier**: 10GB disk, 512MB RAM, 1 app, custom domain
- **Cost**: $0 (upgrade to $3-5/month if needed)
- **Site**: https://deta.space

### 5. **GraphHopper** (Route Optimization)
- **Free Tier**: 1,000 requests/day
- **Cost**: $0 for MVP
- **Docs**: https://graphhopper.com/api/1/docs

### 6. **OpenStreetMap** (Maps)
- **Free Tier**: Unlimited
- **Cost**: $0
- **Library**: flutter_map

### 7. **GitHub** (Version Control)
- **Free Tier**: Unlimited repos, CI/CD via Actions
- **Cost**: $0

### 8. **Cloudinary** (Optional Image CDN)
- **Free Tier**: 25GB storage, 25GB bandwidth
- **Cost**: $0
- **Alternative**: Use Cloud Storage directly

---

## 🔧 Prerequisites & Setup

### System Requirements
```
- macOS/Linux/Windows 10+
- 6GB free disk space
- Git
- Flutter 3.13+ (stable)
- Python 3.10+
- Node.js 18+ (optional, for admin panel)
```

### Install Flutter
```bash
# Download from https://flutter.dev/docs/get-started/install
# Extract and add to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Verify installation
flutter doctor
```

### Install Python
```bash
# macOS (Homebrew)
brew install python3

# Linux (Ubuntu)
sudo apt install python3 python3-pip

# Verify
python3 --version
```

### Clone Repository
```bash
git clone https://github.com/sanketsinghai/pilotproject.git
cd pilotproject
```

---

## ⚙️ Backend Setup

### 1. Create Firebase Project
```
1. Go to https://console.firebase.google.com
2. Click "Create Project" → Name: "DigamberJain"
3. Enable Firestore, Auth, Storage, Cloud Functions
4. Generate Service Account key (Settings → Service Accounts)
5. Save as backend/firebase-service-account.json
```

### 2. Setup Backend Environment

```bash
# Navigate to backend
cd backend

# Create virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Copy and configure .env
cp .env.example .env
# Edit .env with your Firebase credentials
```

### 3. Configure .env File

Edit `backend/.env`:
```
FIREBASE_PROJECT_ID=digamber-jain-xxxxx
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----..."
FIREBASE_CLIENT_EMAIL=firebase-adminsdk@...
FIREBASE_STORAGE_BUCKET=digamber-jain.appspot.com
GRAPHHOPPER_API_KEY=your_api_key_here
JWT_SECRET=your_super_secret_key_change_this
APP_ENV=development
```

### 4. Initialize Firestore Database

```bash
# From backend directory
python3 scripts/create_indexes.py

# Seed sample data (optional)
python3 scripts/seed_data.py
```

### 5. Run Backend Locally

```bash
cd backend
source venv/bin/activate

# Start development server
python3 -m uvicorn main:app --reload --host 0.0.0.0 --port 8000

# API Docs available at: http://localhost:8000/docs
```

---

## 📱 Mobile App Setup

### 1. Create Flutter Project

```bash
cd mobile

# Get dependencies
flutter pub get

# Generate models (if using code generation)
flutter pub run build_runner build
```

### 2. Configure Firebase for Mobile

**For Android**:
```bash
# Download google-services.json from Firebase Console
# Save to: android/app/google-services.json
```

**For iOS**:
```bash
# Download GoogleService-Info.plist from Firebase Console
# Save to: ios/Runner/GoogleService-Info.plist

# Open Xcode and ensure CocoaPods dependencies are updated
cd ios && pod install && cd ..
```

### 3. Update Bundle Identifiers

**Android** (`android/app/build.gradle`):
```gradle
applicationId "com.digamberjain.app"
```

**iOS** (`ios/Runner.xcodeproj`):
```
- Target: Digamber Jain App
- Bundle Identifier: com.digamberjain.app
```

### 4. Run Flutter App

```bash
cd mobile

# Run on Android emulator
flutter run -d emulator-5554

# Run on iOS simulator
flutter run -d iPhone

# Run on physical device
flutter run
```

### 5. Build Release Versions

**Android APK**:
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

**Android App Bundle** (for Play Store):
```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

**iOS** (requires Apple Developer account):
```bash
flutter build ios --release
# Upload to TestFlight via Xcode or Apple Transporter
```

---

## 🔐 Firebase Configuration

### Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Public read access for temples, granths, etc.
    match /temples/{document=**} {
      allow read: if true;
      allow write: if request.auth.token.admin == true;
    }
    
    match /granths/{document=**} {
      allow read: if true;
      allow write: if request.auth.token.admin == true;
    }
    
    // User-specific data
    match /users/{userId} {
      allow read, write: if request.auth.uid == userId;
    }
    
    match /trips/{tripId} {
      allow read, write: if request.auth.uid == resource.data.userId;
    }
  }
}
```

### Firebase Storage Rules

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /granths/{allPaths=**} {
      allow read: if true;
      allow write: if request.auth.token.admin == true;
    }
    
    match /users/{userId}/{allPaths=**} {
      allow read, write: if request.auth.uid == userId;
    }
  }
}
```

---

## 🔄 Development Workflow

### Local Development Loop

```bash
# Terminal 1: Backend
cd backend
source venv/bin/activate
python3 -m uvicorn main:app --reload

# Terminal 2: Mobile
cd mobile
flutter run

# Terminal 3: Admin Panel (optional)
cd admin-panel
streamlit run app.py
```

### API Testing

```bash
# Using curl
curl -X GET "http://localhost:8000/api/v1/temples" \
  -H "accept: application/json"

# Using Postman
# Import: http://localhost:8000/openapi.json
# Or visit: http://localhost:8000/docs
```

### Git Workflow

```bash
# Create feature branch
git checkout -b feature/temple-search

# Make changes & commit
git add .
git commit -m "feat: add temple search endpoint"

# Push & create PR
git push origin feature/temple-search
```

---

## 🚀 Deployment Steps

### Deploy Backend to Deta Space

```bash
# Install Deta CLI
curl -fsSL https://get.deta.dev/cli.sh | sh

# Login
deta login

# Navigate to backend
cd backend

# Deploy
deta new

# View logs
deta logs

# Get deployed URL
deta info
```

### Publish Android App to Play Store

```bash
1. Create Google Play Developer account ($25 one-time)
2. Build signed APK/App Bundle:
   flutter build appbundle --release
3. Upload to Google Play Console
4. Fill store listing, screenshots, description
5. Submit for review (24-48 hours)
```

### Publish iOS App to App Store

```bash
1. Enroll Apple Developer Program ($99/year)
2. Create App ID and certificates in Xcode
3. Build and archive:
   flutter build ios --release
4. Upload to App Store Connect using Transporter
5. Fill app information, screenshots, description
6. Submit for review (1-3 days)
```

---

## 🐛 Troubleshooting

### Backend Issues

**Issue**: "Firebase not initialized"
```
Solution: Check firebase-service-account.json exists and .env has correct paths
```

**Issue**: "Firestore permission denied"
```
Solution: Update security rules in Firebase Console to allow reads
```

**Issue**: "CORS error in mobile app"
```
Solution: Ensure FastAPI has CORS middleware configured for your app's domain
```

### Mobile App Issues

**Issue**: "Flutter SDK not found"
```bash
flutter doctor
# Follow instructions to fix any issues
```

**Issue**: "Firebase initialization fails"
```
Solution: Verify google-services.json (Android) or GoogleService-Info.plist (iOS)
```

**Issue**: "Firestore not syncing offline"
```
Solution: Enable offline persistence in Firestore initialization
```

### Firebase Issues

**Issue**: "Quota exceeded"
```
Solution: Check billing settings, upgrade plan, or wait for quota reset
```

---

## 📞 Support & Resources

- **Flutter Docs**: https://flutter.dev/docs
- **Firebase Docs**: https://firebase.google.com/docs
- **FastAPI Docs**: https://fastapi.tiangolo.com
- **Community Forums**: Stack Overflow, r/FlutterDev, Firebase Slack

---

## 📝 Next Steps

1. ✅ **Week 1-2**: Setup development environment, create Firebase project
2. ✅ **Week 2-3**: Implement backend APIs (temples, granths, auth)
3. ✅ **Week 3-4**: Build mobile UI (home, temples, granths screens)
4. ✅ **Week 4-5**: Integrate Firestore, offline sync, local storage
5. **Week 5-6**: Implement trip planner, maps, route optimization
6. **Week 6-7**: Build pathshala (kids learning) module
7. **Week 7-8**: Testing, bug fixes, performance optimization
8. **Week 8-9**: Prepare for app store submission
9. **Week 9-12**: Deploy backend, publish apps, post-launch support

---

## 💡 Key Design Decisions

| Decision | Reason |
|----------|--------|
| Flutter | Single codebase for iOS & Android, excellent offline support |
| Firestore | No backend DB setup needed, real-time sync, free tier |
| Deta Space | Free hosting, simple deployment, no DevOps knowledge needed |
| Hive | Fast local storage, supports Dart objects, offline-first |
| Riverpod | Type-safe state management, better than Provider |
| FastAPI | Python friendly, auto-generated docs, async support |

---

**Happy Coding! 🙏**

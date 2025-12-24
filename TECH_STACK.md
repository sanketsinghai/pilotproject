# Digamber Jain App - Zero-Budget Tech Stack

## Architecture Overview
```
┌─────────────────┐
│  Flutter Mobile │ (iOS & Android)
│  (Offline-First)│
└────────┬────────┘
         │ (Sync)
         ▼
┌─────────────────┐
│   FastAPI       │
│   Backend       │
└────────┬────────┘
         │ (API calls)
         ▼
┌─────────────────┐
│  Firebase Suite │
│  (Firestore,    │
│   Storage,      │
│   Auth, Cloud   │
│   Functions)    │
└─────────────────┘
```

## Tech Stack & Free Services

### Frontend (Mobile)
- **Framework**: Flutter 3.x
  - Single codebase for iOS & Android
  - Built-in offline support with Hive/GetStorage
  - Excellent performance & native feel
- **State Management**: Riverpod (lightweight, scalable)
- **Offline Database**: Hive + Local JSON for Granths
- **Maps**: OpenStreetMap (via flutter_map package) + GraphHopper API (free tier: 1K requests/day)
- **TTS/Reader**: flutter_tts (native iOS & Android support)

### Backend (API Server)
- **Framework**: FastAPI (Python 3.10+)
  - Auto-generated API docs (Swagger UI)
  - Async/await support
  - Built-in validation (Pydantic)
- **Database**: Firestore (free tier: 50K reads/day, 20K writes/day, 1GB storage)
- **Authentication**: Firebase Auth + Custom JWT tokens
- **File Storage**: Firebase Cloud Storage (free: 5GB/month)
- **Hosting**: Deta Space (free tier: 10GB disk, 512MB RAM) OR Railway (free: $5/month credit)

### Backend Services
- **Admin Panel**: Streamlit (local or Deta deployment)
- **Background Jobs**: Firebase Cloud Functions (free tier: 125K invocations/month)
- **Email/SMS**: Firebase Cloud Functions + free SMTP/Twilio sandbox

## Free Tier Limits & Alternatives

| Service         | Free Tier                    | Alternative                |
|-----------------|------------------------------|----------------------------|
| Firestore       | 50K reads, 20K writes/day    | Supabase (free tier better) |
| Cloud Storage   | 5GB/month                    | Cloudinary free (25GB)      |
| Cloud Functions | 125K invocations/month       | Deta Crons (unlimited)      |
| Maps API        | GraphHopper (1K req/day)     | OSM Routing (self-hosted)   |
| TTS             | Native OS (free)             | Google Cloud TTS (90K/month)|
| Hosting         | Deta Space or Railway        | Fly.io, Render             |

## Recommended Free Services for Digamber Jain App

1. **Firebase Firestore** ✅ (Primary DB)
   - Collections: temples, dharamshalas, munis, granths, pathshala_lessons
   - Real-time sync with Flutter
   - Offline-first support out of box

2. **Firebase Cloud Storage** ✅ (Document Storage)
   - Upload Granth PDFs, images, audio files
   - Free 5GB/month (plenty for phase 1)

3. **Firebase Authentication** ✅ (User Auth)
   - Email/phone sign-in
   - Anonymous auth for guest access
   - Free unlimited users

4. **FastAPI on Deta Space** ✅ (Backend)
   - Free hosting, no credit card needed
   - PostgreSQL addon (free 5GB)
   - Environment variables, custom domains

5. **GraphHopper API** (Trip Planning)
   - Free tier: 1,000 requests/day
   - Backup: Use Open Route Service (unlimited)

6. **OpenStreetMap (Leaflet/flutter_map)** (Maps)
   - Completely free, self-hosted tiles
   - No API key required

## API Response Structure

```json
{
  "status": "success|error",
  "code": 200,
  "data": {},
  "message": "Human-readable message",
  "timestamp": "2025-12-24T10:30:00Z"
}
```

## Security Best Practices (Zero-Cost)

1. **Firestore Security Rules** - Role-based access (user, admin, viewer)
2. **Firebase Auth** - Built-in JWT tokens
3. **CORS** - Configured in FastAPI
4. **Rate Limiting** - FastAPI SlowAPI (free package)
5. **Input Validation** - Pydantic models
6. **Environment Variables** - Deta Secrets, .env.local (never commit)

## Deployment Pipeline (Zero-Cost)

```
GitHub → (push to main)
  ├─ Mobile: GitHub Actions → Build APK/IPA → (Manual upload to TestFlight/Play Store)
  ├─ Backend: Deta Deploy → Auto-deploys FastAPI
  └─ Admin Panel: Streamlit Cloud (free)
```

## Phase-Based Rollout

### Phase 1 (MVP - 4-6 weeks)
- Core temple/dharamshala listing with filters
- Basic Granth reader (offline)
- Trip planner (simple)
- Kids pathshala (10 lessons)

### Phase 2 (Extended - 2 months)
- Muni directory with WhatsApp integration
- Chaturmas calendar
- Social features (sharing, ratings)
- Advanced trip itinerary builder

### Phase 3 (Scale)
- Offline Granth sync (background)
- Push notifications
- Backend optimization
- Paid features (premium content)

---

## Cost Estimation (First Year)

| Item                | Cost         |
|---------------------|--------------|
| Domains (optional)  | $12          |
| PlayStore account   | $25 (one-time)|
| Apple Dev account   | $99/year     |
| Firebase/Deta       | FREE         |
| **Total**           | **$136/year**|

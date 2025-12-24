# Digamber Jain App - Project README

> A zero-budget, scalable mobile app for Jain community featuring temples, sacred texts (Granths), trip planning, and kids learning platform.

## 🎯 Quick Overview

| Component | Tech | Status |
|-----------|------|--------|
| **Frontend** | Flutter (iOS & Android) | ⏳ In Progress |
| **Backend** | FastAPI + Firestore | ⏳ In Progress |
| **Admin Panel** | Streamlit | 📋 Planned |
| **Database** | Firestore (free tier) | ✅ Configured |
| **Hosting** | Deta Space (free tier) | ✅ Ready |

## 📦 What's Included

```
pilotproject/
├── README.md                  # This file
├── TECH_STACK.md              # Complete tech stack & services
├── DATA_SCHEMA.md             # Firestore collections schema
├── SETUP_GUIDE.md             # Step-by-step setup instructions
├── backend/                   # FastAPI server
│   ├── main.py
│   ├── models.py
│   ├── config.py
│   ├── database.py
│   ├── routes_temples.py
│   ├── requirements.txt
│   └── .env.example
├── mobile/                    # Flutter app
│   ├── pubspec.yaml
│   └── README.md
├── admin-panel/               # Streamlit admin dashboard
│   └── README.md
└── docs/                      # Documentation
```

## 🚀 Quick Start

### 1️⃣ Backend Setup (5 min)

```bash
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
# Edit .env with Firebase credentials
python3 -m uvicorn main:app --reload
```

**API Docs**: http://localhost:8000/docs

### 2️⃣ Mobile App Setup (5 min)

```bash
cd mobile
flutter pub get
# Add Firebase config files
flutter run
```

### 3️⃣ Full Setup Guide

See [SETUP_GUIDE.md](SETUP_GUIDE.md) for detailed step-by-step instructions.

## 💰 Zero-Budget Architecture

**No credit card required!** All services have free tiers:

- ✅ **Firestore**: 50K reads/day, 20K writes/day, 1GB
- ✅ **Cloud Storage**: 5GB/month
- ✅ **Firebase Auth**: Unlimited users
- ✅ **Deta Space**: 10GB disk, 512MB RAM
- ✅ **GraphHopper**: 1K requests/day
- ✅ **OpenStreetMap**: Unlimited

**Estimated Year 1 Cost**: $136 (domain + app store accounts only)

## 📱 App Features

### Phase 1: MVP (Weeks 1-8)
- **Temple Directory**: Browse temples state-wise
- **Granth Library**: Access sacred texts offline with search & TTS
- **Trip Planner**: Multi-temple itineraries with route optimization
- **Kids Pathshala**: 20+ interactive lessons with quizzes

### Phase 2: Extended
- Muni directory with WhatsApp/YouTube integration
- Chaturmas calendar
- Community ratings & reviews
- Social sharing

### Phase 3: Scale
- Advanced offline sync
- Push notifications
- Social messaging
- Premium content

## 📊 Data Supported

- **Temples**: All Jain temples by state/city
- **Granths**: Complete texts, chapters, full-text search
- **Dharamshalas**: Contact info, amenities, availability
- **Munis**: Biography, discourses, WhatsApp, YouTube
- **Pathshala**: Lessons by age group with videos & quizzes
- **Trips**: Multi-day temple tour planning

## 📖 Documentation Files

- **[TECH_STACK.md](TECH_STACK.md)** - Complete tech choices & free services
- **[DATA_SCHEMA.md](DATA_SCHEMA.md)** - Firestore collections & relationships
- **[SETUP_GUIDE.md](SETUP_GUIDE.md)** - Detailed setup steps with examples
- **[backend/README.md](backend/README.md)** - FastAPI setup
- **[mobile/README.md](mobile/README.md)** - Flutter app setup

## 🏗️ Architecture

```
┌─────────────────┐
│  Flutter App    │ (iOS & Android)
│  (Offline-first)│
└────────┬────────┘
         │ REST API
         ▼
┌─────────────────┐
│   FastAPI       │ (Python)
│   Backend       │
└────────┬────────┘
         │ Firestore SDK
         ▼
┌─────────────────┐
│  Firebase Suite │
│  (Firestore DB, │
│   Storage,      │
│   Auth, etc.)   │
└─────────────────┘
```

## 🔒 Security

- Role-based Firestore rules (user, admin)
- Firebase Auth (email, phone, OAuth)
- JWT tokens for API
- Built-in encryption
- No sensitive data in app

## 🛠️ Development

**Prerequisites**:
- Flutter 3.13+
- Python 3.10+
- Firebase account
- Git

**Quick Dev Commands**:

```bash
# Backend
cd backend && python3 -m uvicorn main:app --reload

# Mobile
cd mobile && flutter run

# Admin Panel
cd admin-panel && streamlit run app.py
```

## 📤 Deployment

- **Backend**: Deta Space (free tier)
- **Mobile**: Play Store & App Store
- **Admin Panel**: Streamlit Cloud (free)

See [SETUP_GUIDE.md](SETUP_GUIDE.md) for step-by-step deployment.

## 📞 Support & Resources

- **Flutter**: https://flutter.dev/docs
- **Firebase**: https://firebase.google.com/docs
- **FastAPI**: https://fastapi.tiangolo.com
- **Stack Overflow**: Tag your questions

## 📄 License

MIT License

---

**Made with ❤️ for the Jain Community**

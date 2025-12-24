# FastAPI Backend Scaffold - Digamber Jain App

```
backend/
├── main.py                    # Entry point
├── requirements.txt           # Dependencies
├── .env.example               # Environment template
├── config.py                  # Configuration & secrets
├── database.py                # Firestore connection
├── auth.py                    # JWT & Firebase Auth
├── models/
│   ├── __init__.py
│   ├── temple.py
│   ├── dharamshala.py
│   ├── muni.py
│   ├── granth.py
│   ├── pathshala.py
│   ├── trip.py
│   └── user.py
├── routes/
│   ├── __init__.py
│   ├── temples.py            # GET /temples, /temples/{id}, etc.
│   ├── dharamshalas.py
│   ├── munis.py
│   ├── granths.py
│   ├── pathshala.py
│   ├── trips.py              # Trip planning endpoints
│   ├── auth.py               # Login, signup
│   └── admin.py              # Admin endpoints
├── services/
│   ├── __init__.py
│   ├── firestore_service.py  # Firestore CRUD
│   ├── storage_service.py    # Cloud Storage
│   ├── trip_planner.py       # GraphHopper integration
│   └── cache_service.py      # Redis/in-memory caching
├── utils/
│   ├── __init__.py
│   ├── validators.py         # Custom validators
│   ├── exceptions.py         # Custom exceptions
│   └── helpers.py            # Helper functions
├── middleware/
│   ├── __init__.py
│   └── cors.py               # CORS configuration
└── scripts/
    ├── seed_data.py          # Populate initial data
    └── create_indexes.py     # Create Firestore indexes
```

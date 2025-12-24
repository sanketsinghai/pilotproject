"""Configuration and environment variables"""
import os
from dotenv import load_dotenv

load_dotenv()

# Firebase Configuration
FIREBASE_PROJECT_ID = os.getenv("FIREBASE_PROJECT_ID")
FIREBASE_PRIVATE_KEY = os.getenv("FIREBASE_PRIVATE_KEY")
FIREBASE_CLIENT_EMAIL = os.getenv("FIREBASE_CLIENT_EMAIL")
FIREBASE_STORAGE_BUCKET = os.getenv("FIREBASE_STORAGE_BUCKET")

# API Keys
GRAPHHOPPER_API_KEY = os.getenv("GRAPHHOPPER_API_KEY")
GOOGLE_MAPS_API_KEY = os.getenv("GOOGLE_MAPS_API_KEY", "")  # Optional

# JWT Configuration
JWT_SECRET = os.getenv("JWT_SECRET", "your-secret-key-change-in-production")
JWT_ALGORITHM = "HS256"
JWT_EXPIRATION_HOURS = 24

# Database
FIRESTORE_DATABASE = os.getenv("FIRESTORE_DATABASE", "main")

# App Settings
APP_ENV = os.getenv("APP_ENV", "development")
DEBUG = APP_ENV == "development"
CORS_ORIGINS = os.getenv("CORS_ORIGINS", "*").split(",")

# Pagination
DEFAULT_PAGE_SIZE = 10
MAX_PAGE_SIZE = 100

# File Upload Limits
MAX_FILE_SIZE_MB = 100
ALLOWED_FILE_TYPES = {"pdf", "jpg", "jpeg", "png", "mp3", "mp4"}

# Cache (optional Redis)
REDIS_URL = os.getenv("REDIS_URL", None)

# Service Endpoints
TRIP_PLANNER_API = "https://api.graphhopper.com/route"

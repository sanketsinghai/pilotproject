"""Firestore database initialization and connection"""
import firebase_admin
from firebase_admin import credentials, firestore
from config import FIREBASE_PROJECT_ID
import os
import json
import logging

logger = logging.getLogger(__name__)

# Initialize Firebase
try:
    # Check if running on Deta (environment variable)
    if os.getenv("DETA_RUNTIME"):
        # For Deta, use environment variables
        creds_dict = {
            "type": "service_account",
            "project_id": os.getenv("FIREBASE_PROJECT_ID"),
            "private_key_id": os.getenv("FIREBASE_PRIVATE_KEY_ID"),
            "private_key": os.getenv("FIREBASE_PRIVATE_KEY").replace('\\n', '\n'),
            "client_email": os.getenv("FIREBASE_CLIENT_EMAIL"),
            "client_id": os.getenv("FIREBASE_CLIENT_ID"),
            "auth_uri": "https://accounts.google.com/o/oauth2/auth",
            "token_uri": "https://oauth2.googleapis.com/token",
            "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
            "client_x509_cert_url": os.getenv("FIREBASE_CERT_URL"),
        }
        creds = credentials.Certificate(creds_dict)
    else:
        # Local development - use service account JSON file
        creds = credentials.Certificate("firebase-service-account.json")
    
    firebase_admin.initialize_app(creds)
    db = firestore.client()
    logger.info("✅ Firebase initialized successfully")
except Exception as e:
    logger.error(f"❌ Firebase initialization failed: {e}")
    raise

# Get Firestore client
def get_db():
    """Get Firestore database instance"""
    return firestore.client()

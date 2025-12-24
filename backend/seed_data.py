"""
Seed sample data into Firestore for testing and demo
Run: python3 seed_data.py
"""

from database import get_db
from datetime import datetime, timedelta
import json

def seed_temples():
    """Add sample Jain temples"""
    db = get_db()
    temples = [
        {
            "name": "Lal Mandir",
            "city": "Delhi",
            "state": "Delhi",
            "district": "New Delhi",
            "latitude": 28.6505,
            "longitude": 77.2303,
            "address": "Netaji Subhash Marg, Jama Masjid, Delhi",
            "phone": "+91-11-2326-0105",
            "email": "lalmandir@jain.org",
            "website": "https://lalmandir.org",
            "description": "Ancient Jain temple dedicated to Mahavira, one of the oldest temples in Delhi",
            "deity": "Mahavira",
            "tags": ["ancient", "pilgrimage", "accessible"],
            "createdAt": datetime.now(),
            "rating": 4.5,
            "reviews": 125
        },
        {
            "name": "Meenakshi Temple",
            "city": "Jaipur",
            "state": "Rajasthan",
            "district": "Jaipur",
            "latitude": 26.8124,
            "longitude": 75.8231,
            "address": "Sanganeri Gate Road, Jaipur",
            "phone": "+91-141-237-8901",
            "email": "meenakshi@jain.org",
            "website": "https://meenakshi-temple.org",
            "description": "Beautiful pink marble Jain temple with stunning architecture",
            "deity": "Parshvanatha",
            "tags": ["architecture", "pilgrimage"],
            "createdAt": datetime.now(),
            "rating": 4.8,
            "reviews": 340
        },
        {
            "name": "Dilwara Temples",
            "city": "Mount Abu",
            "state": "Rajasthan",
            "district": "Sirohi",
            "latitude": 24.5930,
            "longitude": 72.7197,
            "address": "Mount Abu, Rajasthan",
            "phone": "+91-2974-238-414",
            "email": "dilwara@jain.org",
            "website": "https://dilwaratemples.org",
            "description": "UNESCO World Heritage marble temples with intricate carvings",
            "deity": "Mahavira",
            "tags": ["unesco", "ancient", "famous"],
            "createdAt": datetime.now(),
            "rating": 4.9,
            "reviews": 567
        }
    ]
    
    for temple in temples:
        db.collection("temples").add(temple)
    
    print(f"✅ Added {len(temples)} temples")

def seed_granths():
    """Add sample Jain sacred texts"""
    db = get_db()
    granths = [
        {
            "title": "Shvetambara Agamas",
            "author": "Mahavira",
            "category": "Agam",
            "language": "Prakrit",
            "description": "The primary scriptures of Shvetambara Jainism containing teachings of Lord Mahavira",
            "pdfUrl": "gs://digamber-jain-app/granths/shvetambara-agamas.pdf",
            "totalPages": 450,
            "difficulty": "advanced",
            "tags": ["scripture", "philosophy"],
            "createdAt": datetime.now(),
            "offlineAvailable": True,
            "audioAvailable": False
        },
        {
            "title": "Tattvarthasutra",
            "author": "Umaswati",
            "category": "Philosophy",
            "language": "Sanskrit",
            "description": "Fundamental philosophical text explaining the core principles of Jainism",
            "pdfUrl": "gs://digamber-jain-app/granths/tattvarthasutra.pdf",
            "totalPages": 280,
            "difficulty": "intermediate",
            "tags": ["philosophy", "introduction"],
            "createdAt": datetime.now(),
            "offlineAvailable": True,
            "audioAvailable": True
        },
        {
            "title": "Bhaktamara Stotra",
            "author": "Mandara",
            "category": "Ritual",
            "language": "Sanskrit",
            "description": "Sacred hymn praising Lord Mahavira, commonly recited by Jain devotees",
            "pdfUrl": "gs://digamber-jain-app/granths/bhaktamara.pdf",
            "totalPages": 45,
            "difficulty": "beginner",
            "tags": ["prayers", "devotion"],
            "createdAt": datetime.now(),
            "offlineAvailable": True,
            "audioAvailable": True
        }
    ]
    
    for granth in granths:
        db.collection("granths").add(granth)
    
    print(f"✅ Added {len(granths)} Granths")

def seed_dharamshalas():
    """Add sample Dharamshalas"""
    db = get_db()
    dharamshalas = [
        {
            "name": "Jain Yatri Nivas",
            "city": "Varanasi",
            "state": "Uttar Pradesh",
            "address": "Assi Ghat, Varanasi",
            "latitude": 25.3268,
            "longitude": 82.9989,
            "phone": "+91-542-221-0555",
            "email": "yatrinivas@jain.org",
            "whatsapp": "+91-9876543210",
            "capacity": 50,
            "pricePerNight": 500,
            "amenities": ["wifi", "meals", "parking", "ac"],
            "rulesAndRegulations": "No alcohol, vegetarian food only, morning prayers at 6 AM",
            "createdAt": datetime.now(),
            "rating": 4.6,
            "availability": True
        },
        {
            "name": "Tirthankar Nivas",
            "city": "Jaipur",
            "state": "Rajasthan",
            "address": "C-Scheme, Jaipur",
            "latitude": 26.9023,
            "longitude": 75.8130,
            "phone": "+91-141-370-1234",
            "email": "tirthankar@jain.org",
            "whatsapp": "+91-9876543211",
            "capacity": 80,
            "pricePerNight": 600,
            "amenities": ["wifi", "meals", "parking", "ac", "library"],
            "rulesAndRegulations": "Vegetarian food only, respectful conduct required",
            "createdAt": datetime.now(),
            "rating": 4.7,
            "availability": True
        }
    ]
    
    for dh in dharamshalas:
        db.collection("dharamshalas").add(dh)
    
    print(f"✅ Added {len(dharamshalas)} Dharamshalas")

def seed_munis():
    """Add sample Munis"""
    db = get_db()
    munis = [
        {
            "name": "Acharya Mahapragya",
            "monkName": "Pragya Kumar",
            "status": "active",
            "sect": "Digamber",
            "bio": "Renowned Jain scholar and spiritual guide with 40+ years of experience",
            "profileImage": "gs://digamber-jain-app/munis/acharya-mahapragya.jpg",
            "chaturmasLocation": {
                "year": 2025,
                "city": "Delhi",
                "templeId": "temple-001",
                "start": "July 15, 2025",
                "end": "November 10, 2025"
            },
            "youtubeChannel": "https://youtube.com/@acharyamahapragya",
            "whatsapp": "+91-9876543210",
            "email": "mahapragya@jain.org",
            "isVerified": True,
            "followers": 15000,
            "createdAt": datetime.now()
        }
    ]
    
    for muni in munis:
        db.collection("munis").add(muni)
    
    print(f"✅ Added {len(munis)} Munis")

def seed_pathshala_lessons():
    """Add sample Pathshala lessons"""
    db = get_db()
    lessons = [
        {
            "title": "Introduction to Mahavira",
            "ageGroup": "5-8",
            "topic": "Great Souls",
            "description": "Learn about Lord Mahavira, the 24th Tirthankara",
            "videoUrl": "https://youtube.com/watch?v=example1",
            "duration": 600,
            "difficulty": "beginner",
            "estimatedReadTime": 10,
            "isPublished": True,
            "tags": ["biography", "beginner"],
            "content": "<h1>Mahavira</h1><p>Lord Mahavira was the 24th Tirthankara...</p>",
            "quiz": [
                {
                    "question": "In what year was Mahavira born?",
                    "options": ["599 BC", "500 BC", "400 BC", "300 BC"],
                    "correctAnswer": 0,
                    "explanation": "Mahavira was born in 599 BC"
                }
            ],
            "createdAt": datetime.now()
        },
        {
            "title": "Five Great Vows",
            "ageGroup": "9-12",
            "topic": "Core Principles",
            "description": "Understanding the five mahavratas of Jainism",
            "videoUrl": "https://youtube.com/watch?v=example2",
            "duration": 900,
            "difficulty": "intermediate",
            "estimatedReadTime": 15,
            "isPublished": True,
            "tags": ["philosophy", "ethics"],
            "content": "<h1>Five Great Vows</h1><p>The five vows are...</p>",
            "quiz": [],
            "createdAt": datetime.now()
        }
    ]
    
    for lesson in lessons:
        db.collection("pathshala_lessons").add(lesson)
    
    print(f"✅ Added {len(lessons)} Pathshala lessons")

def main():
    """Run all seed functions"""
    print("🌱 Seeding Firestore with sample data...")
    
    try:
        seed_temples()
        seed_granths()
        seed_dharamshalas()
        seed_munis()
        seed_pathshala_lessons()
        
        print("\n✅ All data seeded successfully!")
        print("📊 Sample data is now available in Firestore")
        print("🚀 You can test the API with this data")
    except Exception as e:
        print(f"❌ Error seeding data: {e}")
        raise

if __name__ == "__main__":
    main()

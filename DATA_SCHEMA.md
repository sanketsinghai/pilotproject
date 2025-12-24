# Firestore Data Schema - Digamber Jain App

## Collections Structure

### 1. `temples`
```
temples/{templeId}
├── name: string
├── city: string
├── state: string
├── district: string
├── latitude: number
├── longitude: number
├── address: string
├── phone: string
├── email: string
├── website: string
├── description: string
├── images: [string] (URLs)
├── foundedYear: number
├── deity: string (e.g., "Mahavira", "Parshvanatha")
├── timings: {
│   ├── arati: string (e.g., "06:00-07:00")
│   ├── puja: string
│   ├── darshan: string
│   └── festivals: [string]
├── facilities: [string] (e.g., ["parking", "langar", "rest-rooms"])
├── rating: number (0-5)
├── reviews: number
├── tags: [string] (e.g., ["ancient", "pilgrimage", "accessible"])
└── createdAt: timestamp
```

### 2. `dharamshalas`
```
dharamshalas/{dharamshalaId}
├── name: string
├── city: string
├── state: string
├── address: string
├── latitude: number
├── longitude: number
├── phone: string
├── email: string
├── whatsapp: string
├── capacity: number (rooms/beds)
├── pricePerNight: number
├── images: [string]
├── amenities: [string] (e.g., ["wifi", "meals", "ac", "parking"])
├── rulesAndRegulations: string
├── contact_person: {
│   ├── name: string
│   ├── phone: string
│   └── whatsapp: string
├── nearestTemples: [string] (temple IDs)
├── rating: number
├── createdAt: timestamp
└── availability: boolean
```

### 3. `munis`
```
munis/{muniId}
├── name: string
├── monkName: string (pre-ordination)
├── status: string (e.g., "active", "retired")
├── sect: string (e.g., "Digamber", "Shvetamber")
├── bio: string (biography)
├── profileImage: string (URL)
├── chaturmasLocation: {
│   ├── year: number
│   ├── city: string
│   ├── templeId: string
│   └── dates: { start: date, end: date }
├── youtubeChannel: string (URL)
├── whatsapp: string
├── email: string
├── phone: string
├── socialMedia: {
│   ├── instagram: string
│   ├── facebook: string
│   └── twitter: string
├── discourses: [string] (URLs to videos)
├── followers: number
├── createdAt: timestamp
└── isVerified: boolean
```

### 4. `granths` (Sacred Texts)
```
granths/{granthId}
├── title: string
├── author: string
├── category: string (e.g., "Agam", "Philosophy", "Ritual", "Narrative")
├── language: string (e.g., "Hindi", "English", "Prakrit", "Sanskrit")
├── description: string
├── pdfUrl: string (Cloud Storage)
├── audioUrl: string (Cloud Storage, optional)
├── totalPages: number
├── fileSize: number (bytes)
├── coverImage: string (URL)
├── chapters: [{
│   ├── id: string
│   ├── title: string
│   ├── pageStart: number
│   ├── pageEnd: number
│   └── summary: string
├── tags: [string] (e.g., ["meditation", "rituals", "philosophy"])
├── offlineAvailable: boolean
├── audioAvailable: boolean
├── isBookmarked: boolean (user-specific)
├── lastRead: timestamp (user-specific)
├── readProgress: number (0-100, user-specific)
├── searchIndex: string (for full-text search)
├── createdAt: timestamp
├── updatedAt: timestamp
└── difficulty: string (e.g., "beginner", "intermediate", "advanced")
```

### 5. `pathshala_lessons`
```
pathshala_lessons/{lessonId}
├── title: string
├── ageGroup: string (e.g., "5-8", "9-12", "13-16")
├── topic: string (e.g., "Jain Philosophy 101", "Rituals & Prayers")
├── description: string
├── videoUrl: string (YouTube or Cloud Storage)
├── duration: number (seconds)
├── content: string (HTML with images)
├── images: [string]
├── quiz: [{
│   ├── question: string
│   ├── options: [string]
│   ├── correctAnswer: number
│   └── explanation: string
├── difficulty: string
├── estimatedReadTime: number (minutes)
├── order: number (for sequencing)
├── createdAt: timestamp
├── updatedAt: timestamp
├── isPublished: boolean
└── tags: [string]
```

### 6. `trips`
```
trips/{tripId}
├── userId: string
├── title: string
├── startDate: date
├── endDate: date
├── startLocation: string
├── endLocation: string
├── budget: number
├── temples: [string] (temple IDs to visit)
├── dharamshalas: [string] (dharamshala IDs)
├── totalDistance: number (km)
├── estimatedDays: number
├── itinerary: [{
│   ├── day: number
│   ├── location: string
│   ├── activities: [string]
│   ├── templeIds: [string]
│   └── notes: string
├── status: string (e.g., "draft", "published", "completed")
├── isShared: boolean
├── sharedWith: [string] (user IDs)
├── createdAt: timestamp
└── updatedAt: timestamp
```

### 7. `users`
```
users/{userId}
├── uid: string (Firebase Auth UID)
├── email: string
├── phone: string
├── displayName: string
├── profileImage: string
├── role: string (e.g., "user", "admin", "moderator")
├── preferences: {
│   ├── language: string
│   ├── fontSize: number
│   ├── darkMode: boolean
│   ├── notifications: boolean
│   └── offlineSync: boolean
├── bookmarkedGranths: [string] (granth IDs)
├── savedTrips: [string] (trip IDs)
├── visitedTemples: [string] (temple IDs)
├── createdAt: timestamp
├── lastLogin: timestamp
├── subscription: {
│   ├── plan: string (e.g., "free", "premium")
│   ├── expiresAt: date
│   └── autoRenew: boolean
└── isActive: boolean
```

### 8. `admin_logs`
```
admin_logs/{logId}
├── userId: string
├── action: string (e.g., "CREATE_TEMPLE", "DELETE_USER")
├── resource: string (e.g., "temples", "users")
├── resourceId: string
├── changes: object
├── timestamp: timestamp
├── status: string (e.g., "success", "failure")
└── message: string
```

## Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow read/write to authenticated users
    match /users/{document=**} {
      allow read, write: if request.auth != null && request.auth.uid == document;
    }

    // Allow read to all for public collections
    match /temples/{document=**} {
      allow read: if request.auth != null || true; // Public read
      allow write: if hasRole('admin');
    }

    match /granths/{document=**} {
      allow read: if true; // Public
      allow write: if hasRole('admin');
    }

    match /pathshala_lessons/{document=**} {
      allow read: if true;
      allow write: if hasRole('admin');
    }

    match /admin_logs/{document=**} {
      allow read: if hasRole('admin');
      allow create: if hasRole('admin');
    }

    // Helper function for role checking
    function hasRole(role) {
      return get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == role;
    }
  }
}
```

## Indexes Required

1. **temples**: 
   - Composite: (state, city, name)
   - Composite: (state, rating DESC)

2. **dharamshalas**:
   - Composite: (state, city, pricePerNight)

3. **granths**:
   - Simple: category, language
   - Composite: (language, difficulty)

4. **pathshala_lessons**:
   - Simple: ageGroup, isPublished

5. **trips**:
   - Simple: userId, status

## Cloud Storage Structure

```
gs://digamber-jain-app/
├── granths/
│   ├── {granthId}/
│   │   ├── content.pdf
│   │   ├── audio.mp3
│   │   └── cover.jpg
├── temples/
│   ├── {templeId}/
│   │   ├── image_1.jpg
│   │   └── image_2.jpg
├── pathshala/
│   ├── {lessonId}/
│   │   ├── video.mp4
│   │   └── thumbnail.jpg
└── users/
    └── {userId}/
        └── profile.jpg
```

## Data Relationships Summary

```
Users (1) ──────┬──→ (M) Trips
                ├──→ (M) Bookmarked Granths
                └──→ (M) Visited Temples

Trips (1) ──────┬──→ (M) Temples
                └──→ (M) Dharamshalas

Temples (1) ←───┴──── (M) Dharamshalas (nearby)

Granths (1) ────────→ (M) Chapters/Sections
```

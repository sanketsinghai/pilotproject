# API Testing Guide - Digamber Jain App

Quick reference for testing all API endpoints after backend is running.

## Prerequisites

1. Backend running: `http://localhost:8000`
2. Swagger UI available at: `http://localhost:8000/docs`
3. Sample data seeded (run `python3 seed_data.py`)

## Using Swagger UI (Easiest)

Visit **http://localhost:8000/docs** and test endpoints directly!

Each endpoint has a "Try it out" button for easy testing.

---

## Testing with cURL

### 1. Health Check
```bash
curl http://localhost:8000/health
```

### 2. List Temples
```bash
# All temples
curl "http://localhost:8000/api/v1/temples"

# Filter by state
curl "http://localhost:8000/api/v1/temples?state=Rajasthan"

# Paginate
curl "http://localhost:8000/api/v1/temples?page=2&pageSize=5"
```

### 3. Get Single Temple
```bash
curl "http://localhost:8000/api/v1/temples/{temple_id}"
```

### 4. List Granths
```bash
# All Granths
curl "http://localhost:8000/api/v1/granths"

# Filter by language
curl "http://localhost:8000/api/v1/granths?language=Sanskrit"

# Filter by difficulty
curl "http://localhost:8000/api/v1/granths?difficulty=beginner"
```

### 5. Search Granths
```bash
curl "http://localhost:8000/api/v1/granths/search/fulltext?q=mahavira"
```

### 6. List Dharamshalas
```bash
curl "http://localhost:8000/api/v1/dharamshalas?state=Rajasthan"
```

### 7. List Pathshala Lessons
```bash
# All lessons
curl "http://localhost:8000/api/v1/pathshala/lessons"

# By age group
curl "http://localhost:8000/api/v1/pathshala/lessons?ageGroup=5-8"

# Recommended for age group
curl "http://localhost:8000/api/v1/pathshala/5-8/recommended"
```

### 8. Admin Stats
```bash
curl "http://localhost:8000/api/v1/admin/stats"
```

---

## Using Postman

1. **Import API**: 
   - Open Postman
   - Click "Import"
   - Enter: `http://localhost:8000/openapi.json`

2. **Collection will auto-generate** with all endpoints

3. **Test each endpoint** with "Send" button

---

## Creating Data

### Create Temple (POST)
```bash
curl -X POST "http://localhost:8000/api/v1/temples" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "New Temple",
    "city": "Ahmedabad",
    "state": "Gujarat",
    "district": "Ahmedabad",
    "latitude": 23.0225,
    "longitude": 72.5714,
    "address": "Temple Road, Ahmedabad",
    "phone": "+91-79-1234-5678",
    "description": "Beautiful ancient Jain temple",
    "deity": "Mahavira",
    "tags": ["ancient", "pilgrimage"]
  }'
```

### Create Granth (POST)
```bash
curl -X POST "http://localhost:8000/api/v1/granths" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Sample Granth",
    "author": "Sample Author",
    "category": "Philosophy",
    "language": "Hindi",
    "description": "Sample Jain text",
    "pdfUrl": "https://example.com/granth.pdf",
    "totalPages": 100,
    "difficulty": "beginner",
    "tags": ["philosophy"]
  }'
```

### Create Pathshala Lesson (POST)
```bash
curl -X POST "http://localhost:8000/api/v1/pathshala/lessons" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "New Lesson",
    "ageGroup": "5-8",
    "topic": "Basics",
    "description": "Learn basics of Jainism",
    "videoUrl": "https://youtube.com/watch?v=example",
    "duration": 600,
    "content": "<h1>Lesson</h1>",
    "difficulty": "beginner",
    "estimatedReadTime": 10,
    "isPublished": true,
    "tags": ["basics"],
    "quiz": []
  }'
```

### Create Trip (POST)
```bash
curl -X POST "http://localhost:8000/api/v1/trips?userId=user123" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Rajasthan Temple Tour",
    "startDate": "2025-01-15",
    "endDate": "2025-01-20",
    "startLocation": "Jaipur",
    "endLocation": "Delhi",
    "temples": ["temple-001", "temple-002"],
    "budget": 10000
  }'
```

---

## Updating Data

### Update Temple (PUT)
```bash
curl -X PUT "http://localhost:8000/api/v1/temples/{temple_id}" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Updated Temple Name",
    "city": "New City",
    ... (all fields)
  }'
```

### Update Granth (PUT)
```bash
curl -X PUT "http://localhost:8000/api/v1/granths/{granth_id}" \
  -H "Content-Type: application/json" \
  -d '{ ... }'
```

---

## Deleting Data

### Delete Temple
```bash
curl -X DELETE "http://localhost:8000/api/v1/temples/{temple_id}"
```

### Delete Granth
```bash
curl -X DELETE "http://localhost:8000/api/v1/granths/{granth_id}"
```

---

## Authentication Endpoints (Coming Soon)

```bash
# Signup
curl -X POST "http://localhost:8000/api/v1/auth/signup" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "displayName": "John Doe",
    "password": "password123"
  }'

# Login
curl -X POST "http://localhost:8000/api/v1/auth/login" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "password123"
  }'
```

---

## Admin Endpoints

### Get Stats
```bash
curl "http://localhost:8000/api/v1/admin/stats"
```

### Get Logs
```bash
curl "http://localhost:8000/api/v1/admin/logs"
```

### List Users
```bash
curl "http://localhost:8000/api/v1/admin/users"
```

### Ban User
```bash
curl -X PATCH "http://localhost:8000/api/v1/admin/users/{user_id}/ban"
```

### Unban User
```bash
curl -X PATCH "http://localhost:8000/api/v1/admin/users/{user_id}/unban"
```

---

## Response Format

All endpoints return JSON in this format:

```json
{
  "status": "success|error|info",
  "code": 200,
  "data": { ... },
  "message": "Human readable message",
  "timestamp": "2025-12-24T10:30:00Z"
}
```

For list endpoints:

```json
{
  "status": "success",
  "code": 200,
  "data": [ ... ],
  "total": 50,
  "page": 1,
  "pageSize": 10,
  "message": "Temples retrieved successfully"
}
```

---

## Common Status Codes

| Code | Meaning |
|------|---------|
| 200 | Success |
| 201 | Created |
| 400 | Bad request |
| 404 | Not found |
| 500 | Server error |
| 503 | Service unavailable |

---

## Debugging Tips

1. **Check Swagger UI** first at `http://localhost:8000/docs`
2. **View detailed errors** in terminal where backend is running
3. **Check Firestore Console** to verify data is being saved
4. **Use Postman's history** to track requests
5. **Look at response** carefully - it often explains the issue

---

## Next Steps

✅ All endpoints tested locally
→ Connect from mobile app
→ Add authentication
→ Deploy to Deta Space

---

**Need help?** Check [SETUP_GUIDE.md](../SETUP_GUIDE.md#troubleshooting) for troubleshooting

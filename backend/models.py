"""Pydantic models for data validation"""
from pydantic import BaseModel, EmailStr, Field
from typing import Optional, List, Dict
from datetime import datetime

# ============ TEMPLE MODEL ============
class TempleBase(BaseModel):
    name: str
    city: str
    state: str
    district: str
    latitude: float
    longitude: float
    address: str
    phone: str
    email: Optional[EmailStr] = None
    website: Optional[str] = None
    description: str
    deity: str
    tags: List[str] = []

class TempleCreate(TempleBase):
    pass

class Temple(TempleBase):
    id: str
    rating: float = 0.0
    reviews: int = 0
    createdAt: datetime

    class Config:
        from_attributes = True

# ============ DHARAMSHALA MODEL ============
class DharamshalaCOntact(BaseModel):
    name: str
    phone: str
    whatsapp: Optional[str] = None

class DharamshalaBase(BaseModel):
    name: str
    city: str
    state: str
    address: str
    latitude: float
    longitude: float
    phone: str
    email: Optional[EmailStr] = None
    whatsapp: Optional[str] = None
    capacity: int
    pricePerNight: float
    amenities: List[str] = []
    rulesAndRegulations: str

class DharamshalaCreate(DharamshalaBase):
    pass

class Dharamshala(DharamshalaBase):
    id: str
    rating: float = 0.0
    availability: bool = True
    createdAt: datetime

    class Config:
        from_attributes = True

# ============ GRANTH MODEL ============
class ChapterBase(BaseModel):
    title: str
    pageStart: int
    pageEnd: int
    summary: Optional[str] = None

class GranthBase(BaseModel):
    title: str
    author: str
    category: str
    language: str
    description: str
    totalPages: int
    difficulty: str = "beginner"
    tags: List[str] = []

class GranthCreate(GranthBase):
    pdfUrl: str
    audioUrl: Optional[str] = None

class Granth(GranthBase):
    id: str
    pdfUrl: str
    audioUrl: Optional[str] = None
    fileSize: int
    offlineAvailable: bool = True
    audioAvailable: bool = False
    createdAt: datetime

    class Config:
        from_attributes = True

# ============ PATHSHALA LESSON MODEL ============
class QuizQuestion(BaseModel):
    question: str
    options: List[str]
    correctAnswer: int
    explanation: str

class PathshalaLessonBase(BaseModel):
    title: str
    ageGroup: str
    topic: str
    description: str
    duration: int
    difficulty: str = "beginner"
    estimatedReadTime: int
    isPublished: bool = False
    tags: List[str] = []

class PathshalaLessonCreate(PathshalaLessonBase):
    videoUrl: Optional[str] = None
    content: str
    quiz: List[QuizQuestion] = []

class PathshalaLesson(PathshalaLessonBase):
    id: str
    videoUrl: Optional[str] = None
    content: str
    quiz: List[QuizQuestion] = []
    createdAt: datetime

    class Config:
        from_attributes = True

# ============ TRIP MODEL ============
class ItineraryDay(BaseModel):
    day: int
    location: str
    activities: List[str]
    templeIds: List[str]
    notes: Optional[str] = None

class TripBase(BaseModel):
    title: str
    startDate: str
    endDate: str
    startLocation: str
    endLocation: str
    temples: List[str]
    budget: float

class TripCreate(TripBase):
    pass

class Trip(TripBase):
    id: str
    userId: str
    totalDistance: float
    estimatedDays: int
    itinerary: List[ItineraryDay]
    status: str = "draft"
    isShared: bool = False
    createdAt: datetime

    class Config:
        from_attributes = True

# ============ USER MODEL ============
class UserPreferences(BaseModel):
    language: str = "en"
    fontSize: int = 16
    darkMode: bool = False
    notifications: bool = True
    offlineSync: bool = True

class UserBase(BaseModel):
    email: EmailStr
    displayName: str

class UserCreate(UserBase):
    password: str

class User(UserBase):
    uid: str
    phone: Optional[str] = None
    profileImage: Optional[str] = None
    role: str = "user"
    preferences: UserPreferences = UserPreferences()
    createdAt: datetime

    class Config:
        from_attributes = True

# ============ MUNI MODEL ============
class MuniBase(BaseModel):
    name: str
    monkName: Optional[str] = None
    sect: str
    bio: str
    status: str = "active"
    youtubeChannel: Optional[str] = None
    whatsapp: Optional[str] = None
    email: Optional[EmailStr] = None

class MuniCreate(MuniBase):
    pass

class Muni(MuniBase):
    id: str
    profileImage: Optional[str] = None
    isVerified: bool = False
    followers: int = 0
    createdAt: datetime

    class Config:
        from_attributes = True

# ============ RESPONSE MODELS ============
class ResponseModel(BaseModel):
    status: str
    code: int
    data: Optional[Dict] = None
    message: str

class ListResponse(BaseModel):
    status: str
    code: int
    data: List[Dict]
    total: int
    page: int
    pageSize: int
    message: str

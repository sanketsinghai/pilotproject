"""Pathshala (Kids Learning) endpoints"""
from fastapi import APIRouter, HTTPException, Query
from database import get_db
from models import PathshalaLesson, PathshalaLessonCreate, QuizQuestion, ResponseModel, ListResponse
import logging

logger = logging.getLogger(__name__)
router = APIRouter()

@router.get("/lessons", response_model=ListResponse)
async def list_lessons(
    ageGroup: str = Query(None),
    topic: str = Query(None),
    isPublished: bool = Query(None),
    page: int = Query(1, ge=1),
    pageSize: int = Query(10, ge=1, le=100)
):
    """Get all Pathshala lessons with filters"""
    try:
        db = get_db()
        query = db.collection("pathshala_lessons")
        
        if ageGroup:
            query = query.where("ageGroup", "==", ageGroup)
        if isPublished is not None:
            query = query.where("isPublished", "==", isPublished)
        
        total = query.count().get()[0][0].value
        skip = (page - 1) * pageSize
        lessons = query.limit(pageSize).offset(skip).stream()
        
        data = []
        for doc in lessons:
            lesson_data = doc.to_dict()
            lesson_data["id"] = doc.id
            data.append(lesson_data)
        
        return ListResponse(
            status="success",
            code=200,
            data=data,
            total=total,
            page=page,
            pageSize=pageSize,
            message="Lessons retrieved successfully"
        )
    except Exception as e:
        logger.error(f"Error fetching lessons: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch lessons")

@router.get("/lessons/{lesson_id}", response_model=ResponseModel)
async def get_lesson(lesson_id: str):
    """Get specific lesson details"""
    try:
        db = get_db()
        doc = db.collection("pathshala_lessons").document(lesson_id).get()
        
        if not doc.exists:
            raise HTTPException(status_code=404, detail="Lesson not found")
        
        lesson_data = doc.to_dict()
        lesson_data["id"] = doc.id
        
        return ResponseModel(
            status="success",
            code=200,
            data=lesson_data,
            message="Lesson retrieved successfully"
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error fetching lesson: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch lesson")

@router.post("/lessons", response_model=ResponseModel)
async def create_lesson(lesson: PathshalaLessonCreate):
    """Create new lesson (admin)"""
    try:
        db = get_db()
        lesson_dict = lesson.dict()
        
        doc_ref = db.collection("pathshala_lessons").add(lesson_dict)
        
        return ResponseModel(
            status="success",
            code=201,
            data={"id": doc_ref[1].id},
            message="Lesson created successfully"
        )
    except Exception as e:
        logger.error(f"Error creating lesson: {e}")
        raise HTTPException(status_code=500, detail="Failed to create lesson")

@router.put("/lessons/{lesson_id}", response_model=ResponseModel)
async def update_lesson(lesson_id: str, lesson: PathshalaLessonCreate):
    """Update lesson (admin)"""
    try:
        db = get_db()
        db.collection("pathshala_lessons").document(lesson_id).update(lesson.dict())
        
        return ResponseModel(
            status="success",
            code=200,
            message="Lesson updated successfully"
        )
    except Exception as e:
        logger.error(f"Error updating lesson: {e}")
        raise HTTPException(status_code=500, detail="Failed to update lesson")

@router.delete("/lessons/{lesson_id}", response_model=ResponseModel)
async def delete_lesson(lesson_id: str):
    """Delete lesson (admin)"""
    try:
        db = get_db()
        db.collection("pathshala_lessons").document(lesson_id).delete()
        
        return ResponseModel(
            status="success",
            code=200,
            message="Lesson deleted successfully"
        )
    except Exception as e:
        logger.error(f"Error deleting lesson: {e}")
        raise HTTPException(status_code=500, detail="Failed to delete lesson")

@router.post("/lessons/{lesson_id}/quiz-submit", response_model=ResponseModel)
async def submit_quiz(lesson_id: str, answers: dict):
    """Submit quiz answers and get score"""
    try:
        db = get_db()
        doc = db.collection("pathshala_lessons").document(lesson_id).get()
        
        if not doc.exists:
            raise HTTPException(status_code=404, detail="Lesson not found")
        
        lesson_data = doc.to_dict()
        quiz = lesson_data.get("quiz", [])
        
        # Calculate score
        score = 0
        total = len(quiz)
        
        for idx, question in enumerate(quiz):
            user_answer = answers.get(str(idx))
            if user_answer == question.get("correctAnswer"):
                score += 1
        
        percentage = (score / total * 100) if total > 0 else 0
        
        return ResponseModel(
            status="success",
            code=200,
            data={
                "score": score,
                "total": total,
                "percentage": percentage,
                "passed": percentage >= 70
            },
            message="Quiz submitted successfully"
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error submitting quiz: {e}")
        raise HTTPException(status_code=500, detail="Failed to submit quiz")

@router.get("/{ageGroup}/recommended", response_model=ListResponse)
async def get_recommended_lessons(ageGroup: str):
    """Get recommended lessons for age group"""
    try:
        db = get_db()
        lessons = db.collection("pathshala_lessons")\
            .where("ageGroup", "==", ageGroup)\
            .where("isPublished", "==", True)\
            .limit(10)\
            .stream()
        
        data = [{"id": doc.id, **doc.to_dict()} for doc in lessons]
        
        return ListResponse(
            status="success",
            code=200,
            data=data,
            total=len(data),
            page=1,
            pageSize=10,
            message="Recommended lessons"
        )
    except Exception as e:
        logger.error(f"Error fetching recommended: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch lessons")

"""Granth (Sacred Texts) endpoints"""
from fastapi import APIRouter, HTTPException, Query
from database import get_db
from models import Granth, GranthCreate, ResponseModel, ListResponse
import logging

logger = logging.getLogger(__name__)
router = APIRouter()

@router.get("", response_model=ListResponse)
async def list_granths(
    language: str = Query(None),
    category: str = Query(None),
    difficulty: str = Query(None),
    page: int = Query(1, ge=1),
    pageSize: int = Query(10, ge=1, le=100)
):
    """Get all Granths with optional filters"""
    try:
        db = get_db()
        query = db.collection("granths")
        
        if language:
            query = query.where("language", "==", language)
        if category:
            query = query.where("category", "==", category)
        if difficulty:
            query = query.where("difficulty", "==", difficulty)
        
        total = query.count().get()[0][0].value
        skip = (page - 1) * pageSize
        granths = query.limit(pageSize).offset(skip).stream()
        
        data = []
        for doc in granths:
            granth_data = doc.to_dict()
            granth_data["id"] = doc.id
            data.append(granth_data)
        
        return ListResponse(
            status="success",
            code=200,
            data=data,
            total=total,
            page=page,
            pageSize=pageSize,
            message="Granths retrieved successfully"
        )
    except Exception as e:
        logger.error(f"Error fetching granths: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch granths")

@router.get("/search/fulltext", response_model=ListResponse)
async def search_granths(
    q: str = Query(..., min_length=2),
    page: int = Query(1, ge=1),
    pageSize: int = Query(10, ge=1, le=100)
):
    """Full-text search in Granths"""
    try:
        db = get_db()
        # Simple substring search (production would use Algolia/Elasticsearch)
        query = db.collection("granths").where("searchIndex", ">=", q.lower()).where("searchIndex", "<=", q.lower() + "\uf8ff")
        
        granths = query.limit(pageSize).stream()
        data = [{"id": doc.id, **doc.to_dict()} for doc in granths]
        
        return ListResponse(
            status="success",
            code=200,
            data=data,
            total=len(data),
            page=page,
            pageSize=pageSize,
            message="Search results"
        )
    except Exception as e:
        logger.error(f"Error searching granths: {e}")
        raise HTTPException(status_code=500, detail="Search failed")

@router.get("/{granth_id}", response_model=ResponseModel)
async def get_granth(granth_id: str):
    """Get Granth details"""
    try:
        db = get_db()
        doc = db.collection("granths").document(granth_id).get()
        
        if not doc.exists:
            raise HTTPException(status_code=404, detail="Granth not found")
        
        granth_data = doc.to_dict()
        granth_data["id"] = doc.id
        
        return ResponseModel(
            status="success",
            code=200,
            data=granth_data,
            message="Granth retrieved successfully"
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error fetching granth: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch granth")

@router.post("", response_model=ResponseModel)
async def create_granth(granth: GranthCreate):
    """Create a new Granth (admin)"""
    try:
        db = get_db()
        granth_dict = granth.dict()
        granth_dict["searchIndex"] = granth.title.lower()
        
        doc_ref = db.collection("granths").add(granth_dict)
        
        return ResponseModel(
            status="success",
            code=201,
            data={"id": doc_ref[1].id},
            message="Granth created successfully"
        )
    except Exception as e:
        logger.error(f"Error creating granth: {e}")
        raise HTTPException(status_code=500, detail="Failed to create granth")

@router.put("/{granth_id}", response_model=ResponseModel)
async def update_granth(granth_id: str, granth: GranthCreate):
    """Update Granth (admin)"""
    try:
        db = get_db()
        granth_dict = granth.dict()
        granth_dict["searchIndex"] = granth.title.lower()
        db.collection("granths").document(granth_id).update(granth_dict)
        
        return ResponseModel(
            status="success",
            code=200,
            message="Granth updated successfully"
        )
    except Exception as e:
        logger.error(f"Error updating granth: {e}")
        raise HTTPException(status_code=500, detail="Failed to update granth")

@router.delete("/{granth_id}", response_model=ResponseModel)
async def delete_granth(granth_id: str):
    """Delete Granth (admin)"""
    try:
        db = get_db()
        db.collection("granths").document(granth_id).delete()
        
        return ResponseModel(
            status="success",
            code=200,
            message="Granth deleted successfully"
        )
    except Exception as e:
        logger.error(f"Error deleting granth: {e}")
        raise HTTPException(status_code=500, detail="Failed to delete granth")

@router.get("/{granth_id}/download", response_model=ResponseModel)
async def get_granth_download(granth_id: str):
    """Get download URL for Granth PDF"""
    try:
        db = get_db()
        doc = db.collection("granths").document(granth_id).get()
        
        if not doc.exists:
            raise HTTPException(status_code=404, detail="Granth not found")
        
        granth_data = doc.to_dict()
        
        return ResponseModel(
            status="success",
            code=200,
            data={
                "id": granth_id,
                "title": granth_data.get("title"),
                "pdfUrl": granth_data.get("pdfUrl"),
                "audioUrl": granth_data.get("audioUrl")
            },
            message="Download URLs retrieved"
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error getting download: {e}")
        raise HTTPException(status_code=500, detail="Failed to get download")

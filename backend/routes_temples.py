"""Temple endpoints"""
from fastapi import APIRouter, HTTPException, Query
from database import get_db
from models import Temple, TempleCreate, ResponseModel, ListResponse
from typing import List
import logging

logger = logging.getLogger(__name__)
router = APIRouter()

@router.get("", response_model=ListResponse)
async def list_temples(
    state: str = Query(None),
    city: str = Query(None),
    page: int = Query(1, ge=1),
    pageSize: int = Query(10, ge=1, le=100)
):
    """
    Get all temples with optional filters.
    Query params: state, city, page, pageSize
    """
    try:
        db = get_db()
        query = db.collection("temples")
        
        # Apply filters
        if state:
            query = query.where("state", "==", state)
        if city:
            query = query.where("city", "==", city)
        
        # Get total count
        total = query.count().get()[0][0].value
        
        # Paginate
        skip = (page - 1) * pageSize
        temples = query.limit(pageSize).offset(skip).stream()
        
        data = []
        for doc in temples:
            temple_data = doc.to_dict()
            temple_data["id"] = doc.id
            data.append(temple_data)
        
        return ListResponse(
            status="success",
            code=200,
            data=data,
            total=total,
            page=page,
            pageSize=pageSize,
            message="Temples retrieved successfully"
        )
    except Exception as e:
        logger.error(f"Error fetching temples: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch temples")

@router.get("/{temple_id}", response_model=ResponseModel)
async def get_temple(temple_id: str):
    """Get temple details by ID"""
    try:
        db = get_db()
        doc = db.collection("temples").document(temple_id).get()
        
        if not doc.exists:
            raise HTTPException(status_code=404, detail="Temple not found")
        
        temple_data = doc.to_dict()
        temple_data["id"] = doc.id
        
        return ResponseModel(
            status="success",
            code=200,
            data=temple_data,
            message="Temple retrieved successfully"
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error fetching temple: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch temple")

@router.post("", response_model=ResponseModel)
async def create_temple(temple: TempleCreate):
    """Create a new temple (admin only)"""
    try:
        db = get_db()
        temple_dict = temple.dict()
        
        doc_ref = db.collection("temples").add(temple_dict)
        
        return ResponseModel(
            status="success",
            code=201,
            data={"id": doc_ref[1].id},
            message="Temple created successfully"
        )
    except Exception as e:
        logger.error(f"Error creating temple: {e}")
        raise HTTPException(status_code=500, detail="Failed to create temple")

@router.put("/{temple_id}", response_model=ResponseModel)
async def update_temple(temple_id: str, temple: TempleCreate):
    """Update temple details (admin only)"""
    try:
        db = get_db()
        db.collection("temples").document(temple_id).update(temple.dict())
        
        return ResponseModel(
            status="success",
            code=200,
            message="Temple updated successfully"
        )
    except Exception as e:
        logger.error(f"Error updating temple: {e}")
        raise HTTPException(status_code=500, detail="Failed to update temple")

@router.delete("/{temple_id}", response_model=ResponseModel)
async def delete_temple(temple_id: str):
    """Delete a temple (admin only)"""
    try:
        db = get_db()
        db.collection("temples").document(temple_id).delete()
        
        return ResponseModel(
            status="success",
            code=200,
            message="Temple deleted successfully"
        )
    except Exception as e:
        logger.error(f"Error deleting temple: {e}")
        raise HTTPException(status_code=500, detail="Failed to delete temple")

@router.get("/search/nearby", response_model=ListResponse)
async def search_nearby_temples(
    latitude: float,
    longitude: float,
    radiusKm: float = Query(50)
):
    """Search temples within radius (in km)"""
    # This requires Firestore geohash or external geospatial query
    # For now, return placeholder
    return ListResponse(
        status="info",
        code=200,
        data=[],
        total=0,
        page=1,
        pageSize=10,
        message="Nearby temples feature coming soon - requires geospatial indexing"
    )

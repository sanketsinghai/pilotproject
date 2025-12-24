"""Dharamshala endpoints"""
from fastapi import APIRouter, HTTPException, Query
from database import get_db
from models import Dharamshala, DharamshalaCreate, ResponseModel, ListResponse
import logging

logger = logging.getLogger(__name__)
router = APIRouter()

@router.get("", response_model=ListResponse)
async def list_dharamshalas(
    state: str = Query(None),
    city: str = Query(None),
    page: int = Query(1, ge=1),
    pageSize: int = Query(10, ge=1, le=100)
):
    """Get all Dharamshalas with optional filters"""
    try:
        db = get_db()
        query = db.collection("dharamshalas")
        
        if state:
            query = query.where("state", "==", state)
        if city:
            query = query.where("city", "==", city)
        
        total = query.count().get()[0][0].value
        skip = (page - 1) * pageSize
        dharamshalas = query.limit(pageSize).offset(skip).stream()
        
        data = []
        for doc in dharamshalas:
            dh_data = doc.to_dict()
            dh_data["id"] = doc.id
            data.append(dh_data)
        
        return ListResponse(
            status="success",
            code=200,
            data=data,
            total=total,
            page=page,
            pageSize=pageSize,
            message="Dharamshalas retrieved successfully"
        )
    except Exception as e:
        logger.error(f"Error fetching dharamshalas: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch dharamshalas")

@router.get("/{dh_id}", response_model=ResponseModel)
async def get_dharamshala(dh_id: str):
    """Get Dharamshala details"""
    try:
        db = get_db()
        doc = db.collection("dharamshalas").document(dh_id).get()
        
        if not doc.exists:
            raise HTTPException(status_code=404, detail="Dharamshala not found")
        
        dh_data = doc.to_dict()
        dh_data["id"] = doc.id
        
        return ResponseModel(
            status="success",
            code=200,
            data=dh_data,
            message="Dharamshala retrieved successfully"
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error fetching dharamshala: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch dharamshala")

@router.post("", response_model=ResponseModel)
async def create_dharamshala(dh: DharamshalaCreate):
    """Create a new Dharamshala (admin)"""
    try:
        db = get_db()
        dh_dict = dh.dict()
        
        doc_ref = db.collection("dharamshalas").add(dh_dict)
        
        return ResponseModel(
            status="success",
            code=201,
            data={"id": doc_ref[1].id},
            message="Dharamshala created successfully"
        )
    except Exception as e:
        logger.error(f"Error creating dharamshala: {e}")
        raise HTTPException(status_code=500, detail="Failed to create dharamshala")

@router.put("/{dh_id}", response_model=ResponseModel)
async def update_dharamshala(dh_id: str, dh: DharamshalaCreate):
    """Update Dharamshala (admin)"""
    try:
        db = get_db()
        db.collection("dharamshalas").document(dh_id).update(dh.dict())
        
        return ResponseModel(
            status="success",
            code=200,
            message="Dharamshala updated successfully"
        )
    except Exception as e:
        logger.error(f"Error updating dharamshala: {e}")
        raise HTTPException(status_code=500, detail="Failed to update dharamshala")

@router.delete("/{dh_id}", response_model=ResponseModel)
async def delete_dharamshala(dh_id: str):
    """Delete Dharamshala (admin)"""
    try:
        db = get_db()
        db.collection("dharamshalas").document(dh_id).delete()
        
        return ResponseModel(
            status="success",
            code=200,
            message="Dharamshala deleted successfully"
        )
    except Exception as e:
        logger.error(f"Error deleting dharamshala: {e}")
        raise HTTPException(status_code=500, detail="Failed to delete dharamshala")

@router.get("/nearby/search", response_model=ListResponse)
async def search_nearby_dharamshalas(
    latitude: float,
    longitude: float,
    radiusKm: float = Query(50)
):
    """Search Dharamshalas near coordinates"""
    return ListResponse(
        status="info",
        code=200,
        data=[],
        total=0,
        page=1,
        pageSize=10,
        message="Nearby search feature coming soon"
    )

"""Muni (Jain Monk) endpoints"""
from fastapi import APIRouter, HTTPException, Query
from database import get_db
from models import Muni, MuniCreate, ResponseModel, ListResponse
import logging

logger = logging.getLogger(__name__)
router = APIRouter()

@router.get("", response_model=ListResponse)
async def list_munis(
    sect: str = Query(None),
    status: str = Query(None),
    page: int = Query(1, ge=1),
    pageSize: int = Query(10, ge=1, le=100)
):
    """Get all Munis with optional filters"""
    try:
        db = get_db()
        query = db.collection("munis")
        
        if sect:
            query = query.where("sect", "==", sect)
        if status:
            query = query.where("status", "==", status)
        
        total = query.count().get()[0][0].value
        skip = (page - 1) * pageSize
        munis = query.limit(pageSize).offset(skip).stream()
        
        data = []
        for doc in munis:
            muni_data = doc.to_dict()
            muni_data["id"] = doc.id
            data.append(muni_data)
        
        return ListResponse(
            status="success",
            code=200,
            data=data,
            total=total,
            page=page,
            pageSize=pageSize,
            message="Munis retrieved successfully"
        )
    except Exception as e:
        logger.error(f"Error fetching munis: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch munis")

@router.get("/{muni_id}", response_model=ResponseModel)
async def get_muni(muni_id: str):
    """Get Muni details"""
    try:
        db = get_db()
        doc = db.collection("munis").document(muni_id).get()
        
        if not doc.exists:
            raise HTTPException(status_code=404, detail="Muni not found")
        
        muni_data = doc.to_dict()
        muni_data["id"] = doc.id
        
        return ResponseModel(
            status="success",
            code=200,
            data=muni_data,
            message="Muni retrieved successfully"
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error fetching muni: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch muni")

@router.post("", response_model=ResponseModel)
async def create_muni(muni: MuniCreate):
    """Create a new Muni (admin)"""
    try:
        db = get_db()
        muni_dict = muni.dict()
        
        doc_ref = db.collection("munis").add(muni_dict)
        
        return ResponseModel(
            status="success",
            code=201,
            data={"id": doc_ref[1].id},
            message="Muni created successfully"
        )
    except Exception as e:
        logger.error(f"Error creating muni: {e}")
        raise HTTPException(status_code=500, detail="Failed to create muni")

@router.put("/{muni_id}", response_model=ResponseModel)
async def update_muni(muni_id: str, muni: MuniCreate):
    """Update Muni (admin)"""
    try:
        db = get_db()
        db.collection("munis").document(muni_id).update(muni.dict())
        
        return ResponseModel(
            status="success",
            code=200,
            message="Muni updated successfully"
        )
    except Exception as e:
        logger.error(f"Error updating muni: {e}")
        raise HTTPException(status_code=500, detail="Failed to update muni")

@router.delete("/{muni_id}", response_model=ResponseModel)
async def delete_muni(muni_id: str):
    """Delete Muni (admin)"""
    try:
        db = get_db()
        db.collection("munis").document(muni_id).delete()
        
        return ResponseModel(
            status="success",
            code=200,
            message="Muni deleted successfully"
        )
    except Exception as e:
        logger.error(f"Error deleting muni: {e}")
        raise HTTPException(status_code=500, detail="Failed to delete muni")

@router.get("/{muni_id}/chaturmas", response_model=ResponseModel)
async def get_muni_chaturmas(muni_id: str):
    """Get Muni's current Chaturmas location"""
    try:
        db = get_db()
        doc = db.collection("munis").document(muni_id).get()
        
        if not doc.exists:
            raise HTTPException(status_code=404, detail="Muni not found")
        
        muni_data = doc.to_dict()
        chaturmas = muni_data.get("chaturmasLocation", {})
        
        return ResponseModel(
            status="success",
            code=200,
            data=chaturmas,
            message="Chaturmas location retrieved"
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error fetching chaturmas: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch chaturmas")

"""Trip planner endpoints"""
from fastapi import APIRouter, HTTPException, Query
from database import get_db
from models import Trip, TripCreate, ResponseModel, ListResponse
import logging

logger = logging.getLogger(__name__)
router = APIRouter()

@router.get("", response_model=ListResponse)
async def list_trips(
    userId: str = Query(None),
    status: str = Query(None),
    page: int = Query(1, ge=1),
    pageSize: int = Query(10, ge=1, le=100)
):
    """Get all trips with optional filters"""
    try:
        db = get_db()
        query = db.collection("trips")
        
        if userId:
            query = query.where("userId", "==", userId)
        if status:
            query = query.where("status", "==", status)
        
        total = query.count().get()[0][0].value
        skip = (page - 1) * pageSize
        trips = query.limit(pageSize).offset(skip).stream()
        
        data = []
        for doc in trips:
            trip_data = doc.to_dict()
            trip_data["id"] = doc.id
            data.append(trip_data)
        
        return ListResponse(
            status="success",
            code=200,
            data=data,
            total=total,
            page=page,
            pageSize=pageSize,
            message="Trips retrieved successfully"
        )
    except Exception as e:
        logger.error(f"Error fetching trips: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch trips")

@router.get("/{trip_id}", response_model=ResponseModel)
async def get_trip(trip_id: str):
    """Get trip details and itinerary"""
    try:
        db = get_db()
        doc = db.collection("trips").document(trip_id).get()
        
        if not doc.exists:
            raise HTTPException(status_code=404, detail="Trip not found")
        
        trip_data = doc.to_dict()
        trip_data["id"] = doc.id
        
        return ResponseModel(
            status="success",
            code=200,
            data=trip_data,
            message="Trip retrieved successfully"
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error fetching trip: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch trip")

@router.post("", response_model=ResponseModel)
async def create_trip(trip: TripCreate, userId: str = Query(...)):
    """Create new trip"""
    try:
        db = get_db()
        trip_dict = trip.dict()
        trip_dict["userId"] = userId
        trip_dict["status"] = "draft"
        
        doc_ref = db.collection("trips").add(trip_dict)
        
        return ResponseModel(
            status="success",
            code=201,
            data={"id": doc_ref[1].id},
            message="Trip created successfully"
        )
    except Exception as e:
        logger.error(f"Error creating trip: {e}")
        raise HTTPException(status_code=500, detail="Failed to create trip")

@router.put("/{trip_id}", response_model=ResponseModel)
async def update_trip(trip_id: str, trip: TripCreate):
    """Update trip details"""
    try:
        db = get_db()
        db.collection("trips").document(trip_id).update(trip.dict())
        
        return ResponseModel(
            status="success",
            code=200,
            message="Trip updated successfully"
        )
    except Exception as e:
        logger.error(f"Error updating trip: {e}")
        raise HTTPException(status_code=500, detail="Failed to update trip")

@router.delete("/{trip_id}", response_model=ResponseModel)
async def delete_trip(trip_id: str):
    """Delete trip"""
    try:
        db = get_db()
        db.collection("trips").document(trip_id).delete()
        
        return ResponseModel(
            status="success",
            code=200,
            message="Trip deleted successfully"
        )
    except Exception as e:
        logger.error(f"Error deleting trip: {e}")
        raise HTTPException(status_code=500, detail="Failed to delete trip")

@router.get("/{trip_id}/route", response_model=ResponseModel)
async def get_optimized_route(trip_id: str):
    """Get optimized route for trip (requires GraphHopper integration)"""
    try:
        db = get_db()
        doc = db.collection("trips").document(trip_id).get()
        
        if not doc.exists:
            raise HTTPException(status_code=404, detail="Trip not found")
        
        trip_data = doc.to_dict()
        
        # Get temple coordinates
        temples_ids = trip_data.get("temples", [])
        route = {
            "tripId": trip_id,
            "waypoints": temples_ids,
            "distance": trip_data.get("totalDistance", 0),
            "estimatedTime": "Calculated via GraphHopper",
            "note": "Integration with GraphHopper API pending"
        }
        
        return ResponseModel(
            status="info",
            code=200,
            data=route,
            message="Route optimization available with GraphHopper API key"
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error getting route: {e}")
        raise HTTPException(status_code=500, detail="Failed to get route")

@router.post("/{trip_id}/publish", response_model=ResponseModel)
async def publish_trip(trip_id: str):
    """Publish trip for sharing"""
    try:
        db = get_db()
        db.collection("trips").document(trip_id).update({
            "status": "published",
            "isShared": True
        })
        
        return ResponseModel(
            status="success",
            code=200,
            message="Trip published successfully"
        )
    except Exception as e:
        logger.error(f"Error publishing trip: {e}")
        raise HTTPException(status_code=500, detail="Failed to publish trip")

@router.get("/{trip_id}/share-link", response_model=ResponseModel)
async def get_share_link(trip_id: str):
    """Get shareable link for trip"""
    try:
        db = get_db()
        doc = db.collection("trips").document(trip_id).get()
        
        if not doc.exists:
            raise HTTPException(status_code=404, detail="Trip not found")
        
        # Generate share link (simplified)
        share_link = f"https://digamberjain.app/trips/{trip_id}"
        
        return ResponseModel(
            status="success",
            code=200,
            data={"shareLink": share_link},
            message="Share link generated"
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error generating share link: {e}")
        raise HTTPException(status_code=500, detail="Failed to generate share link")

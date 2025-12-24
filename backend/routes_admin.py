"""Admin endpoints"""
from fastapi import APIRouter, HTTPException, Query
from database import get_db
from models import ResponseModel, ListResponse
import logging
from datetime import datetime

logger = logging.getLogger(__name__)
router = APIRouter()

@router.get("/stats", response_model=ResponseModel)
async def get_stats():
    """Get app statistics (admin)"""
    try:
        db = get_db()
        
        # Get counts
        temples_count = db.collection("temples").count().get()[0][0].value
        users_count = db.collection("users").count().get()[0][0].value
        granths_count = db.collection("granths").count().get()[0][0].value
        trips_count = db.collection("trips").count().get()[0][0].value
        
        return ResponseModel(
            status="success",
            code=200,
            data={
                "temples": temples_count,
                "users": users_count,
                "granths": granths_count,
                "trips": trips_count,
                "timestamp": datetime.now().isoformat()
            },
            message="Statistics retrieved"
        )
    except Exception as e:
        logger.error(f"Error getting stats: {e}")
        raise HTTPException(status_code=500, detail="Failed to get stats")

@router.get("/logs", response_model=ListResponse)
async def get_logs(
    action: str = Query(None),
    page: int = Query(1, ge=1),
    pageSize: int = Query(20, ge=1, le=100)
):
    """Get admin action logs"""
    try:
        db = get_db()
        query = db.collection("admin_logs")
        
        if action:
            query = query.where("action", "==", action)
        
        total = query.count().get()[0][0].value
        skip = (page - 1) * pageSize
        logs = query.order_by("timestamp", direction="DESCENDING")\
            .limit(pageSize).offset(skip).stream()
        
        data = [{"id": doc.id, **doc.to_dict()} for doc in logs]
        
        return ListResponse(
            status="success",
            code=200,
            data=data,
            total=total,
            page=page,
            pageSize=pageSize,
            message="Logs retrieved"
        )
    except Exception as e:
        logger.error(f"Error getting logs: {e}")
        raise HTTPException(status_code=500, detail="Failed to get logs")

@router.post("/log-action", response_model=ResponseModel)
async def log_action(
    userId: str,
    action: str,
    resource: str,
    resourceId: str,
    changes: dict = None
):
    """Log admin action"""
    try:
        db = get_db()
        
        log_entry = {
            "userId": userId,
            "action": action,
            "resource": resource,
            "resourceId": resourceId,
            "changes": changes or {},
            "timestamp": datetime.now(),
            "status": "success"
        }
        
        db.collection("admin_logs").add(log_entry)
        
        return ResponseModel(
            status="success",
            code=201,
            message="Action logged"
        )
    except Exception as e:
        logger.error(f"Error logging action: {e}")
        raise HTTPException(status_code=500, detail="Failed to log action")

@router.get("/users", response_model=ListResponse)
async def list_users(
    role: str = Query(None),
    page: int = Query(1, ge=1),
    pageSize: int = Query(20, ge=1, le=100)
):
    """List all users (admin)"""
    try:
        db = get_db()
        query = db.collection("users")
        
        if role:
            query = query.where("role", "==", role)
        
        total = query.count().get()[0][0].value
        skip = (page - 1) * pageSize
        users = query.limit(pageSize).offset(skip).stream()
        
        data = []
        for doc in users:
            user_data = doc.to_dict()
            # Remove sensitive data
            user_data.pop("password", None)
            user_data["uid"] = doc.id
            data.append(user_data)
        
        return ListResponse(
            status="success",
            code=200,
            data=data,
            total=total,
            page=page,
            pageSize=pageSize,
            message="Users retrieved"
        )
    except Exception as e:
        logger.error(f"Error fetching users: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch users")

@router.patch("/users/{user_id}/role", response_model=ResponseModel)
async def update_user_role(user_id: str, role: str):
    """Update user role (admin)"""
    try:
        if role not in ["user", "admin", "moderator"]:
            raise HTTPException(status_code=400, detail="Invalid role")
        
        db = get_db()
        db.collection("users").document(user_id).update({"role": role})
        
        # Log action
        db.collection("admin_logs").add({
            "action": "UPDATE_USER_ROLE",
            "resource": "users",
            "resourceId": user_id,
            "changes": {"role": role},
            "timestamp": datetime.now(),
            "status": "success"
        })
        
        return ResponseModel(
            status="success",
            code=200,
            message="User role updated"
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error updating user role: {e}")
        raise HTTPException(status_code=500, detail="Failed to update role")

@router.patch("/users/{user_id}/ban", response_model=ResponseModel)
async def ban_user(user_id: str):
    """Ban user (admin)"""
    try:
        db = get_db()
        db.collection("users").document(user_id).update({
            "isActive": False,
            "bannedAt": datetime.now()
        })
        
        db.collection("admin_logs").add({
            "action": "BAN_USER",
            "resource": "users",
            "resourceId": user_id,
            "timestamp": datetime.now(),
            "status": "success"
        })
        
        return ResponseModel(
            status="success",
            code=200,
            message="User banned"
        )
    except Exception as e:
        logger.error(f"Error banning user: {e}")
        raise HTTPException(status_code=500, detail="Failed to ban user")

@router.patch("/users/{user_id}/unban", response_model=ResponseModel)
async def unban_user(user_id: str):
    """Unban user (admin)"""
    try:
        db = get_db()
        db.collection("users").document(user_id).update({
            "isActive": True
        })
        
        db.collection("admin_logs").add({
            "action": "UNBAN_USER",
            "resource": "users",
            "resourceId": user_id,
            "timestamp": datetime.now(),
            "status": "success"
        })
        
        return ResponseModel(
            status="success",
            code=200,
            message="User unbanned"
        )
    except Exception as e:
        logger.error(f"Error unbanning user: {e}")
        raise HTTPException(status_code=500, detail="Failed to unban user")

@router.get("/health/detailed", response_model=ResponseModel)
async def detailed_health_check():
    """Detailed health check with service status"""
    try:
        db = get_db()
        
        # Test Firestore connection
        db.collection("temples").limit(1).stream()
        
        return ResponseModel(
            status="success",
            code=200,
            data={
                "firestore": "connected",
                "backend": "running",
                "timestamp": datetime.now().isoformat()
            },
            message="All services healthy"
        )
    except Exception as e:
        logger.error(f"Health check failed: {e}")
        return ResponseModel(
            status="error",
            code=503,
            data={"error": str(e)},
            message="Service unhealthy"
        )

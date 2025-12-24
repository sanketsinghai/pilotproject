"""Authentication routes"""
from fastapi import APIRouter, HTTPException, status
from pydantic import EmailStr
import firebase_admin.auth as auth
from models import User, UserCreate, ResponseModel
import logging

logger = logging.getLogger(__name__)
router = APIRouter()

@router.post("/signup", response_model=ResponseModel)
async def signup(user: UserCreate):
    """Register a new user"""
    try:
        # Create Firebase Auth user
        user_record = auth.create_user(
            email=user.email,
            password=user.password,
            display_name=user.displayName
        )
        
        return ResponseModel(
            status="success",
            code=201,
            data={"uid": user_record.uid, "email": user_record.email},
            message="User registered successfully"
        )
    except auth.EmailAlreadyExistsError:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Email already exists"
        )
    except Exception as e:
        logger.error(f"Signup error: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Signup failed"
        )

@router.post("/login", response_model=ResponseModel)
async def login(email: EmailStr, password: str):
    """User login (returns Firebase ID token)"""
    # Note: Firebase Auth token generation should be done on client-side using SDK
    # This endpoint can be used to validate credentials server-side if needed
    return ResponseModel(
        status="info",
        code=200,
        message="Use Firebase SDK on client to obtain ID token"
    )

@router.post("/logout", response_model=ResponseModel)
async def logout(token: str):
    """Logout user (revoke token)"""
    try:
        # Decode and verify token
        decoded_token = auth.verify_id_token(token)
        uid = decoded_token['uid']
        
        # Revoke all tokens for user
        auth.revoke_refresh_tokens(uid)
        
        return ResponseModel(
            status="success",
            code=200,
            message="User logged out successfully"
        )
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid token"
        )

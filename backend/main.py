"""
Digamber Jain App - FastAPI Backend
Main entry point for the API server
"""
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
import logging
from contextlib import asynccontextmanager

# Import routes
from routes_temples import router as temples_router
from routes_dharamshalas import router as dharamshalas_router
from routes_munis import router as munis_router
from routes_granths import router as granths_router
from routes_pathshala import router as pathshala_router
from routes_trips import router as trips_router
from routes_auth import router as auth_router
from routes_admin import router as admin_router

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Lifespan context
@asynccontextmanager
async def lifespan(app: FastAPI):
    """Startup and shutdown events"""
    logger.info("🚀 Digamber Jain App - Backend Starting")
    # Initialize Firestore, check credentials, etc.
    yield
    logger.info("🛑 Backend Shutting Down")

# Initialize FastAPI app
app = FastAPI(
    title="Digamber Jain App API",
    description="Backend API for Jain temples, Granths, trips, and more",
    version="1.0.0",
    docs_url="/docs",
    redoc_url="/redoc",
    lifespan=lifespan
)

# CORS Middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Update in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Health check endpoint
@app.get("/health")
async def health_check():
    """Health check for deployment monitoring"""
    return {
        "status": "healthy",
        "service": "digamber-jain-api",
        "version": "1.0.0"
    }

# Include routers
app.include_router(auth_router, prefix="/api/v1/auth", tags=["Authentication"])
app.include_router(temples_router, prefix="/api/v1/temples", tags=["Temples"])
app.include_router(dharamshalas_router, prefix="/api/v1/dharamshalas", tags=["Dharamshalas"])
app.include_router(munis_router, prefix="/api/v1/munis", tags=["Munis"])
app.include_router(granths_router, prefix="/api/v1/granths", tags=["Granths"])
app.include_router(pathshala_router, prefix="/api/v1/pathshala", tags=["Pathshala"])
app.include_router(trips_router, prefix="/api/v1/trips", tags=["Trip Planner"])
app.include_router(admin_router, prefix="/api/v1/admin", tags=["Admin"])

# Error handlers
@app.exception_handler(HTTPException)
async def http_exception_handler(request, exc):
    return JSONResponse(
        status_code=exc.status_code,
        content={
            "status": "error",
            "code": exc.status_code,
            "message": exc.detail
        }
    )

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)

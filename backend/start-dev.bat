@echo off
REM Quick start script for Digamber Jain App Backend (Windows)
REM Usage: start-dev.bat

echo 🚀 Starting Digamber Jain App Backend...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python not found. Please install Python 3.10+
    exit /b 1
)

REM Check if venv exists
if not exist "venv" (
    echo 📦 Creating virtual environment...
    python -m venv venv
)

REM Activate venv
echo ✅ Activating virtual environment...
call venv\Scripts\activate.bat

REM Install requirements
echo 📚 Installing/updating dependencies...
pip install -q -r requirements.txt

REM Check for .env file
if not exist ".env" (
    echo ⚠️  .env file not found. Copying from .env.example...
    copy .env.example .env
    echo 📝 Please edit .env with your Firebase credentials
)

REM Check for Firebase credentials
if not exist "firebase-service-account.json" (
    echo ⚠️  firebase-service-account.json not found
    echo 📥 Download it from Firebase Console → Project Settings → Service Accounts
)

echo.
echo ✅ Setup complete!
echo.
echo 🔧 Starting development server...
echo 📍 API will be available at: http://localhost:8000
echo 📚 Swagger UI: http://localhost:8000/docs
echo.
echo Press Ctrl+C to stop the server
echo.

REM Start the server
python -m uvicorn main:app --reload --host 0.0.0.0 --port 8000

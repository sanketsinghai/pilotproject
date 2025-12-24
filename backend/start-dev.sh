#!/bin/bash
# Quick start script for Digamber Jain App Backend
# Usage: bash start-dev.sh

set -e

echo "🚀 Starting Digamber Jain App Backend..."
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 not found. Please install Python 3.10+"
    exit 1
fi

# Check if venv exists
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
fi

# Activate venv
echo "✅ Activating virtual environment..."
source venv/bin/activate

# Check if requirements are installed
echo "📚 Installing/updating dependencies..."
pip install -q -r requirements.txt

# Check for .env file
if [ ! -f ".env" ]; then
    echo "⚠️  .env file not found. Copying from .env.example..."
    cp .env.example .env
    echo "📝 Please edit .env with your Firebase credentials"
fi

# Check for Firebase credentials
if [ ! -f "firebase-service-account.json" ]; then
    echo "⚠️  firebase-service-account.json not found"
    echo "📥 Download it from Firebase Console → Project Settings → Service Accounts"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "🔧 Starting development server..."
echo "📍 API will be available at: http://localhost:8000"
echo "📚 Swagger UI: http://localhost:8000/docs"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Start the server
python3 -m uvicorn main:app --reload --host 0.0.0.0 --port 8000

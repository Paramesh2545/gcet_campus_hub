#!/bin/bash

# GitHub Pages Deployment Script
echo "🚀 Starting GitHub Pages deployment..."

# Check if we're in the right directory
if [ ! -f "frontend/package.json" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    exit 1
fi

# Navigate to frontend directory
cd frontend

# Check if .env.local exists
if [ ! -f ".env.local" ]; then
    echo "⚠️  Warning: .env.local file not found!"
    echo "Please create frontend/.env.local with your environment variables"
    echo "See GITHUB_PAGES_DEPLOYMENT.md for details"
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Build the project
echo "🔨 Building project..."
npm run build

# Deploy to GitHub Pages
echo "🌐 Deploying to GitHub Pages..."
npm run deploy

echo "✅ Deployment complete!"
echo "Your site should be available at: https://YOUR_USERNAME.github.io/YOUR_REPO_NAME"
echo "Note: It may take a few minutes for the changes to be visible"

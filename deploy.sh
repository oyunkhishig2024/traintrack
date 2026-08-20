#!/bin/bash
# Power Frequency — Auto deploy script
# Place this file in ~/traintrack-deploy/ and run it after every update

DEPLOY_DIR=~/traintrack-deploy
SRC_DIR=~/Downloads/traintrack

echo "📦 Copying files..."
mkdir -p $DEPLOY_DIR
cp -f $SRC_DIR/index.html $DEPLOY_DIR/
cp -f $SRC_DIR/quiz.html $DEPLOY_DIR/ 2>/dev/null || true
cp -f $SRC_DIR/attend.html $DEPLOY_DIR/ 2>/dev/null || true

echo "🚀 Pushing to GitHub..."
cd $DEPLOY_DIR

if [ ! -d ".git" ]; then
  git init
  git remote add origin https://github.com/oyunkhishig2024/traintrack.git
fi

git add .
git commit -m "update $(date '+%Y-%m-%d %H:%M')"
git push --set-upstream origin main --force

echo "✅ Done! Netlify will deploy in ~30 seconds."

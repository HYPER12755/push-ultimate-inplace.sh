#!/data/data/com.termux/files/usr/bin/bash
# push-ultimate-inplace.sh  –  no-copy SD-card push

git config --global user.name  "HYPER12755"
git config --global user.email "hyper14917374@gmail.com"

GIT_USER="HYPER12755"
REPO_NAME="REPO NAME"
TOKEN="ACCESS TOKEN"
REPO_URL="https://${TOKEN}@github.com/${GIT_USER}/${REPO_NAME}.git"
# WORK_TREE="/storage/emulated/0/Download/FOLDER NAME"
#WORK_TREE="$HOME/FOLDER NAME ONLY FOR HOME DIRECTORY"
# --- whitelist this path so Git won’t complain again ---
git config --global --add safe.directory "$WORK_TREE"

# --- ensure folder exists & enter it -------------------
[ -d "$WORK_TREE" ] || { echo "❌ $WORK_TREE not found"; exit 1; }
cd "$WORK_TREE"     || { echo "❌ cd failed"; exit 1; }

# --- blow away any old repo & start fresh --------------
rm -rf .git
git init -q
git remote add origin "$REPO_URL"
git switch -c main

# --- commit & force-push -------------------------------
git add .
git commit -m "Initial commit from SD-card (no copy)" || {
  echo "❌ commit failed"; exit 1; }

git push -u origin main --force        || {
  echo "❌ push failed"; exit 1; }

echo "✅ Repo pushed straight from SD-card without extra storage use."

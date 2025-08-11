#!/data/data/com.termux/files/usr/bin/bash
# push-ultimate-inplace.sh — push to GitHub without storing .git in your folder

# --- Git config ---
git config --global user.name  "HYPER12755"
git config --global user.email "hyper14917374@gmail.com"

# --- Your GitHub info ---
GIT_USER="HYPER12755"
REPO_NAME="YOUR_REPO_NAME"
TOKEN="YOUR_ACCESS_TOKEN"
REPO_URL="https://${TOKEN}@github.com/${GIT_USER}/${REPO_NAME}.git"

# --- Folder you want to push ---
WORK_TREE="$HOME/TERMUX-CLI-UI-RATS"

# --- Temp Git folder location ---
TMP_GIT_DIR="$(mktemp -d)/git-tmp"

# --- Ensure folder exists ---
[ -d "$WORK_TREE" ] || { echo "❌ $WORK_TREE not found"; exit 1; }

# --- Init bare repo in temp folder ---
git init --bare "$TMP_GIT_DIR" >/dev/null

# --- Use temp .git folder to commit & push ---
git --git-dir="$TMP_GIT_DIR" --work-tree="$WORK_TREE" add .
git --git-dir="$TMP_GIT_DIR" --work-tree="$WORK_TREE" commit -m "Initial push"
git --git-dir="$TMP_GIT_DIR" --work-tree="$WORK_TREE" branch -M main
git --git-dir="$TMP_GIT_DIR" --work-tree="$WORK_TREE" remote add origin "$REPO_URL"
git --git-dir="$TMP_GIT_DIR" --work-tree="$WORK_TREE" push -u origin main --force

# --- Cleanup ---
rm -rf "$(dirname "$TMP_GIT_DIR")"

echo "✅ Push complete — no .git folder left in $WORK_TREE"
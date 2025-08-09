GIT_USER = "HYPER12755"
REPO_NAME = "ULTIMATE-RAT-COLLECTION"
TOKEN = "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"
WORK_TREE = "/content/ULTIMATE-RAT-COLLECTION"

import os
import tempfile
import shutil

os.makedirs(WORK_TREE, exist_ok=True)

!git config --global user.name "HYPER12755"
!git config --global user.email "hyper14917374@gmail.com"

tmp_git_dir = tempfile.mkdtemp()
print(f"Using temporary git dir: {tmp_git_dir}")

REPO_URL = f"https://{TOKEN}@github.com/{GIT_USER}/{REPO_NAME}.git"

!git init --bare "{tmp_git_dir}" >/dev/null
!git --git-dir="{tmp_git_dir}" --work-tree="{WORK_TREE}" remote add origin "{REPO_URL}"
!git --git-dir="{tmp_git_dir}" --work-tree="{WORK_TREE}" add --all
!git --git-dir="{tmp_git_dir}" --work-tree="{WORK_TREE}" commit -m "Upload from Colab" || echo "No changes to commit"

# Rename master to main only if commit succeeded
!git --git-dir="{tmp_git_dir}" --work-tree="{WORK_TREE}" branch -m master main || echo "Branch rename failed"

!git --git-dir="{tmp_git_dir}" --work-tree="{WORK_TREE}" push -u origin main --force

shutil.rmtree(tmp_git_dir)

print("✅ Push complete!")
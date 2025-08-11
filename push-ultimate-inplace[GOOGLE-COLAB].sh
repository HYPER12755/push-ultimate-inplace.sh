# Replace with your details
token = 'your_github_token'
user_name = 'your_github_username'
repo_name = 'your_repository_name'
code_folder = '/content/drive/MyDrive/Colab Notebooks/your_project_folder'

# Mount Google Drive
from google.colab import drive
drive.mount('/content/drive', force_remount=True)

# Check Git version
!git version

# Set up Git configuration
!git config --global user.email "your_email@example.com"
!git config --global user.name "{user_name}"

# Clone GitHub repo
!git clone https://{token}@github.com/{user_name}/{repo_name}.git

# Sync Colab folder with GitHub repo
!rsync -av "{code_folder}/" "/content/{repo_name}"

# Push to GitHub
%cd /content/{repo_name}
!git add .
!git commit -m "Initial commit"
!git remote add origin https://{token}@github.com/{user_name}/{repo_name}.git
!git push -u origin main
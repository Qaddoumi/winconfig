# Ensure you're in the correct directory
Set-Location -Path "C:\Users\admin\github\winconfig"

# Stage all changes
git add .

# Commit with an empty message
git commit --allow-empty-message -m ""

# Push to the remote repository
git push

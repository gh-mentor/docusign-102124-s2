# This PowerShell 5.1 script uses git to sync changes between a local and remote GitHub repository on branch 'main'.
# It assumes that the remote repository is already set up and that the local repository is already cloned.
# If you encounter an execution policy error, you may need to change the execution policy to allow script execution.
# You can do this by running the following command in PowerShell as an administrator:
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

#Instructions: 
# - pull changes from remote repository
# - stage all changes
# - commit changes with message 'Updated'
# - push changes to remote repository on branch 'main'.

# Pull changes from remote repository
git pull origin main

# Stage all changes
git stage .

# Commit changes with message 'Updated'
git commit -m "Updated"

# Push changes to remote repository on branch 'main'
git push origin main


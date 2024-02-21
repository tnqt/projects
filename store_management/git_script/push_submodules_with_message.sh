#!/bin/bash

# Copy the folder from source to destination
cp -r ../sub_modules/* ../../../sub_modules/

# Navigate to the destination folder
cd ../../../sub_modules/

# Add all changes to git
git add .

# Commit changes with the message provided as an argument when running the script
commit_message="$1"
git commit -m "$commit_message"

# Push the changes to the remote git repository
git push origin main

cd ../

git submodule update --recursive --remote

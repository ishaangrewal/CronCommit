#!/bin/bash

git config --global user.name “<NAME>”
git config --global user.email “<EMAIL>”

# Set the correct git author and committer environment variables
export GIT_AUTHOR_NAME=“<NAME>”
export GIT_AUTHOR_EMAIL=“<EMAIL>”
export GIT_COMMITTER_NAME=“<NAME>”
export GIT_COMMITTER_EMAIL=“<EMAIL>”

# Define the file or location where the counter is stored
COUNTER_FILE=<FILE_PATH>

# Increment the counter
if [ ! -f "$COUNTER_FILE" ]; then
  echo 1 > "$COUNTER_FILE"  # Initialize the counter if the file doesn't exist
else
  COUNTER=$(cat "$COUNTER_FILE")
  echo $((COUNTER + 1)) > "$COUNTER_FILE"
fi

# Push the updated file (assuming a Git repo)
cd <REPO_PATH>

#Use HTTPS PAT
git remote set-url origin https://<PAT_TOKEN>@github.com/<USERNAME>/<REPO_NAME>.git

git add "$COUNTER_FILE"
git commit --author=“<NAME> <<EMAIL>>” -m "Daily counter update"
git push

echo ""


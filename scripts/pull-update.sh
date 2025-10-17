#!/usr/bin/env bash

# Show the information about the script pull-update.
echo "---------- pull-update ----------"
echo -e "\nGoal: Pull update for existing repository automatically with given local path, owner(user or organization), name and branch.\n"

# Run the script pull-update.
echo -n "Please select the specific local path: "
read LOCAL_PATH
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER
echo -n "Please select the specific repository name: "
read REPO_NAME
echo -n "Please select the specific repository branch: "
read REPO_BRANCH
echo -e "\nPulling update from [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
cd "$LOCAL_PATH"
git pull origin $REPO_BRANCH
while [ $? -ne 0 ]; do
    echo "Retrying to pull update from [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
    git pull origin $REPO_BRANCH
    if [$? -eq 0]; then
        break
    fi
done

# End of the script pull-update.
echo -e "\n---------- pull-update ----------"

#!/usr/bin/env bash

# Show the information about the script sync-fork.
echo "---------- sync-fork ----------"
echo -e "\nGoal: Sync fork repository automatically with given owner(user or organization), name and branch.\n"

# Run the script sync-fork.
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER
echo -n "Please select the specific repository name: "
read REPO_NAME
echo -n "Please select the specific repository branch: "
read REPO_BRANCH
echo -e "\nSyncing [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
gh repo sync $REPO_OWNER/$REPO_NAME -b $REPO_BRANCH

# End of the script sync-fork.
echo -e "\n---------- sync-fork ----------"

#!/usr/bin/env bash

# Show the information about the script pull-updates.
echo "---------- pull-updates ----------"
echo -e "\nGoal: Pull updates for all existing repositories automatically with given local path and owner(user or organization).\n"

# Run the script pull-updates.
echo -n "Please select the specific local path: "
read LOCAL_PATH
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER && echo ""
REPO_NAME_LIST=$(ls -lA "$LOCAL_PATH" | awk '/^d/ {print $NF}' | sort -f)
for REPO_NAME in $REPO_NAME_LIST; do
    cd "$LOCAL_PATH/$REPO_NAME"
    REPO_BRANCH=$(git branch --show-current)
    echo -e "Pulling update from [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
    git pull origin $REPO_BRANCH
    while [ $? -ne 0 ]; do
        echo "Retrying to pull update from [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
        git pull origin $REPO_BRANCH
        if [$? -eq 0]; then
            break
        fi
    done
    echo "-----"
done
echo -e "Done!\n"

# End of the script pull-updates.
echo "---------- pull-updates ----------"

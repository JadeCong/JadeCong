#!/usr/bin/env bash

# Show the information about the script push-commits.
echo "---------- push-commits ----------"
echo -e "\nGoal: Push commits for all existing repositories automatically with given local path and owner(user or organization).\n"

# Run the script push-commits.
echo -n "Please select the specific local path: "
read LOCAL_PATH
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER && echo ""
REPO_NAME_LIST=$(ls -lA "$LOCAL_PATH" | awk '/^d/ {print $NF}' | sort -f)
for REPO_NAME in $REPO_NAME_LIST; do
    cd "$LOCAL_PATH/$REPO_NAME"
    REPO_BRANCH=$(git branch --show-current)
    echo -e "Pushing commit to [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
    git push origin $REPO_BRANCH
    while [ $? -ne 0 ]; do
        echo "Retrying to push commit to [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
        git push origin $REPO_BRANCH
        if [$? -eq 0]; then
            break
        fi
    done
    echo "-----"
done
echo -e "Done!\n"

# End of the script push-commits.
echo "---------- push-commits ----------"

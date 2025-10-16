#!/usr/bin/env bash

# Show the information about the script push-commit.
echo "---------- push-commit ----------"
echo -e "\nGoal: Push commit for existing repository automatically with given local path, owner(user or organization), name and branch.\n"

# Run the script push-commit.
echo -n "Please select the specific local path: "
read LOCAL_PATH
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER
echo -n "Please select the specific repository name: "
read REPO_NAME
echo -n "Please select the specific repository branch: "
read REPO_BRANCH
echo -e "\nPushing commit to [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
cd "$LOCAL_PATH"
git push origin $REPO_BRANCH
while [ $? -ne 0 ]; do
    echo "Retrying to push commit to [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
    git push origin $REPO_BRANCH
    if [$? -eq 0]; then
        break
    fi
done

# End of the script push-commit.
echo -e "\n---------- push-commit ----------"

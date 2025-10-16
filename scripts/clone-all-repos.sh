#!/usr/bin/env bash

# Show the information about the script clone-all-repos.
echo "---------- clone-all-repos ----------"
echo -e "\nGoal: Clone all repositories automatically on default branch with given local path and owner(user or organization).\n"

# Run the script clone-all-repos.
echo -n "Please select the specific local path: "
read LOCAL_PATH
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER && echo ""
REPO_NAME_LIST=$(gh repo list $REPO_OWNER --limit 100000 | awk '{print $1}' | sort -f)
for REPO_NAME in $REPO_NAME_LIST; do
    REPO_BRANCH=$(gh api repos/$REPO_NAME --jq '.default_branch')
    while [ ! $REPO_BRANCH ]; do
        echo "Retrying to get default branch of [$REPO_NAME] repository..."
        REPO_BRANCH=$(gh api repos/$REPO_NAME --jq '.default_branch')
        if [ $REPO_BRANCH ]; then
            break
        fi
    done
    echo -e "Cloning [$REPO_NAME] repository on [$REPO_BRANCH] branch..."
    gh repo clone $REPO_NAME $LOCAL_PATH/$REPO_NAME -- -b $REPO_BRANCH
    while [ $? -ne 0 ]; do
        echo "Retrying to clone [$REPO_NAME] repository on [$REPO_BRANCH] branch..."
        gh repo clone $REPO_NAME $LOCAL_PATH/$REPO_NAME -- -b $REPO_BRANCH
        if [$? -eq 0]; then
            break
        fi
    done
    echo "-----"
done
echo -e "Done!\n"

# End of the script clone-all-repos.
echo "---------- clone-all-repos ----------"

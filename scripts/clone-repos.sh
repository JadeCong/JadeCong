#!/usr/bin/env bash

# Show the information about the script clone-repos.
echo "---------- clone-repos ----------"
echo -e "\nGoal: Clone repositories automatically on default branch with given local path, owner(user or organization) and names.\n"

# Run the script clone-repos.
echo -n "Please select the specific local path: "
read LOCAL_PATH
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER
echo -n "Please select the specific repository names(with blank space): "
read -a REPO_NAME_LIST && echo ""
for REPO_NAME in ${REPO_NAME_LIST[@]}; do
    REPO_BRANCH=$(gh api repos/$REPO_OWNER/$REPO_NAME --jq '.default_branch')
    while [ ! $REPO_BRANCH ]; do
        echo "Retrying to get default branch of [$REPO_OWNER/$REPO_NAME] repository..."
        REPO_BRANCH=$(gh api repos/$REPO_OWNER/$REPO_NAME --jq '.default_branch')
        if [ $REPO_BRANCH ]; then
            break
        fi
    done
    echo -e "Cloning [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
    gh repo clone $REPO_OWNER/$REPO_NAME $LOCAL_PATH/$REPO_NAME -- -b $REPO_BRANCH
    while [ $? -ne 0 ]; do
        echo "Retrying to clone [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
        gh repo clone $REPO_OWNER/$REPO_NAME $LOCAL_PATH/$REPO_NAME -- -b $REPO_BRANCH
        if [$? -eq 0]; then
            break
        fi
    done
    echo "-----"
done
echo -e "Done!\n"

# End of the script clone-repos.
echo "---------- clone-repos ----------"

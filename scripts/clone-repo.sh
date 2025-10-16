#!/usr/bin/env bash

# Show the information about the script clone-repo.
echo "---------- clone-repo ----------"
echo -e "\nGoal: Clone repository automatically with given local path, owner(user or organization), name and branch.\n"

# Run the script clone-repo.
echo -n "Please select the specific local path: "
read LOCAL_PATH
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER
echo -n "Please select the specific repository name: "
read REPO_NAME
echo -n "Please select the specific repository branch: "
read REPO_BRANCH
echo -e "\nCloning [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
gh repo clone $REPO_OWNER/$REPO_NAME $LOCAL_PATH/$REPO_NAME -- -b $REPO_BRANCH
while [ $? -ne 0 ]; do
    echo "Retrying to clone [$REPO_OWNER/$REPO_NAME] repository on [$REPO_BRANCH] branch..."
    gh repo clone $REPO_OWNER/$REPO_NAME $LOCAL_PATH/$REPO_NAME -- -b $REPO_BRANCH
    if [$? -eq 0]; then
        break
    fi
done

# End of the script clone-repo.
echo -e "\n---------- clone-repo ----------"

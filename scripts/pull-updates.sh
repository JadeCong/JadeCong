#!/usr/bin/env bash

# Show the information about the script pull-updates.
echo "---------- pull-updates ----------"
echo -e "\nGoal: Pull updates for all existing repositories automatically with given local owner path and owner(user or organization).\n"

# Run the script pull-updates.
echo -n "Please select the specific local owner path: "
read LOCAL_OWNER_PATH 
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER && echo ""
REPO_LOCAL_LIST=$(ls -l "$LOCAL_OWNER_PATH" | awk '/^d/ {print $NF}' | sort -f)
for REPO_LOCAL in $REPO_LOCAL_LIST; do
    cd "$LOCAL_OWNER_PATH/$REPO_LOCAL"
    REPO_BRANCH=$(git branch --show-current)
    echo -e "Pulling [$REPO_OWNER/$REPO_LOCAL] repository on [$REPO_BRANCH] branch..."
    git pull
    echo "-----"
done
echo -e "Done!\n"

# End of the script pull-updates.
echo "---------- pull-updates ----------"

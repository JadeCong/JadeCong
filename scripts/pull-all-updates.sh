#!/usr/bin/env bash

# Show the information about the script pull-all-updates.
echo "---------- pull-all-updates ----------"
echo -e "\nGoal: Pull updates for all existing repositories automatically with given local repository archive path.\n"

# Run the script pull-all-updates.
echo -n "Please select the specific local repository archive path: "
read LOCAL_REPO_ARCHIVE_PATH && echo ""
LOCAL_REPO_OWNER_LIST=$(ls -lA "$LOCAL_REPO_ARCHIVE_PATH" | awk '/^d/ {print $NF}' | sort -f)
for LOCAL_REPO_OWNER in $LOCAL_REPO_OWNER_LIST; do
    echo "----- REPO_OWNER: $LOCAL_REPO_OWNER -----"
    LOCAL_REPO_OWNER_PATH="$LOCAL_REPO_ARCHIVE_PATH/$LOCAL_REPO_OWNER"
    LOCAL_REPO_LIST=$(ls -lA "$LOCAL_REPO_OWNER_PATH" | awk '/^d/ {print $NF}' | sort -f)
    for LOCAL_REPO in $LOCAL_REPO_LIST; do
        cd "$LOCAL_REPO_OWNER_PATH/$LOCAL_REPO"
        LOCAL_REPO_BRANCH=$(git branch --show-current)
        echo -e "Pulling [$LOCAL_REPO_OWNER/$LOCAL_REPO] repository on [$LOCAL_REPO_BRANCH] branch..."
        git pull
        echo "-----"
    done
    echo -e "Done!"
    echo "----- REPO_OWNER: $LOCAL_REPO_OWNER -----"
done
echo -e "All done!\n"

# End of the script pull-all-updates.
echo "---------- pull-all-updates ----------"
#!/usr/bin/env bash

# Show the information about the script sync-forks.
echo "---------- sync-forks ----------"
echo -e "\nGoal: Sync all fork repositories automatically with given owner(user or organization).\n"

# Run the script sync-forks.
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER && echo ""
REPO_FORK_LIST=$(gh repo list $REPO_OWNER --fork --limit 100000 | awk '{print $1}' | sort -f)
for REPO_FORK in $REPO_FORK_LIST; do
    REPO_BRANCH=$(gh api repos/$REPO_FORK --jq '.default_branch')
    while [ ! $REPO_BRANCH ]; do
        echo "Retrying to get the default branch of [$REPO_FORK] repository..."
        REPO_BRANCH=$(gh api repos/$REPO_FORK --jq '.default_branch')
        if [ $REPO_BRANCH ]; then
            break
        fi
    done
    echo -e "Syncing [$REPO_FORK] repository on [$REPO_BRANCH] branch..."
    gh repo sync $REPO_FORK
    while [ $? -ne 0 ]; do
        echo "Retrying to sync the [$REPO_FORK] repository..."
        gh repo sync $REPO_FORK --force
        if [$? -eq 0]; then
            break
        fi
    done
    echo "-----"
done
echo -e "Done!\n"

# End of the script sync-forks.
echo "---------- sync-forks ----------"

#!/usr/bin/env bash

# Show the information about the script gen-forks-list.
echo "---------- gen-forks-list ----------"
echo -e "\nGoal: Generation for github forks list with given owner(user or organization).\n"

# Run the script gen-forks-list.
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER && echo ""
echo "Saving [$REPO_OWNER] github forks list..."
FORKS_LIST_ARCHIVE="$(cd "$(dirname "$0")"; pwd)/../assets/docs/Forks-List-$REPO_OWNER.md"
REPO_FORKS_LIST=$(gh repo list $REPO_OWNER --fork --limit 100000 | awk '{print $1}' | sort -f)
for REPO_FORK in $REPO_FORKS_LIST; do
    REPO_BRANCH=$(gh api repos/$REPO_FORK --jq '.default_branch')
    REPO_PARENT=$(gh api repos/$REPO_FORK --jq '.parent.html_url')
    while [ ! $REPO_BRANCH ] || [ ! $REPO_PARENT ]; do
        REPO_BRANCH=$(gh api repos/$REPO_FORK --jq '.default_branch')
        REPO_PARENT=$(gh api repos/$REPO_FORK --jq '.parent.html_url')
        if [ $REPO_BRANCH ] && [ $REPO_PARENT ]; then
            break
        fi
    done
    echo "$REPO_FORK[$REPO_BRANCH]: https://github.com/$REPO_FORK.git -> $REPO_PARENT.git"
done > "$FORKS_LIST_ARCHIVE"
echo -e "Done!\n"

# End of the script gen-forks-list.
echo "---------- gen-forks-list ----------"

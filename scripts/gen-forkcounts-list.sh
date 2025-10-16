#!/usr/bin/env bash

# Show the information about the script gen-forkcounts-list.
echo "---------- gen-forkcounts-list ----------"
echo -e "\nGoal: Generation for github forkcounts list with given owner(user or organization).\n"

# Run the script gen-forkcounts-list.
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER && echo ""
echo "Saving [$REPO_OWNER] github forkcounts list..."
FORKCOUNTS_LIST_ARCHIVE="$(cd "$(dirname "$0")"; pwd)/../assets/docs/Forkcounts-List-$REPO_OWNER.md"
FORKED_REPOS_LIST=$(gh repo list $REPO_OWNER --visibility public --limit 100000 --json nameWithOwner,forkCount --jq '.[] | select(.forkCount > 0) | .nameWithOwner' | awk '{print $1}' | sort -f)
for FORKED_REPO in $FORKED_REPOS_LIST; do
    FORKED_REPO_BRANCH=$(gh api repos/$FORKED_REPO --jq '.default_branch')
    while [ ! $FORKED_REPO_BRANCH ]; do
        FORKED_REPO_BRANCH=$(gh api repos/$FORKED_REPO --jq '.default_branch')
        if [ $FORKED_REPO_BRANCH ]; then
            break
        fi
    done
    echo "$FORKED_REPO[$FORKED_REPO_BRANCH]: https://github.com/$FORKED_REPO.git"
    REPO_FORKS_LIST=$(gh api repos/$FORKED_REPO/forks --paginate --jq '.[].owner.login' | sort -f)
    for REPO_FORK in $REPO_FORKS_LIST; do
        echo "  - $REPO_FORK: https://github.com/$REPO_FORK"
    done
done > "$FORKCOUNTS_LIST_ARCHIVE"
echo -e "Done!\n"

# End of the script gen-forkcounts-list.
echo "---------- gen-forkcounts-list ----------"

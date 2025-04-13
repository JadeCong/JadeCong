#!/usr/bin/env bash

# Show the information about the script gen-starred-repos-list.
echo "---------- gen-starred-repos-list ----------"
echo -e "\nGoal: Generation for GitHub Starred Repositories List with given owner(user or organization).\n"

# Run the script gen-starred-repos-list.
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER && echo ""
echo "Saving the [$REPO_OWNER] github starred repositories list..."
STARRED_REPOS_LIST_ARCHIVE="$(cd "$(dirname "$0")"; pwd)/../assets/docs/Starred-Repos-List-$REPO_OWNER.md"
STARRED_REPOS_LIST=$(gh api users/$REPO_OWNER/starred --paginate --jq '.[].full_name' | sort -f)
for STARRED_REPO in $STARRED_REPOS_LIST; do
    STARRED_REPO_BRANCH=$(gh api repos/$STARRED_REPO --jq '.default_branch')
    while [ ! $STARRED_REPO_BRANCH ]; do
        STARRED_REPO_BRANCH=$(gh api repos/$STARRED_REPO --jq '.default_branch')
        if [ $STARRED_REPO_BRANCH ]; then
            break
        fi
    done
    echo "$STARRED_REPO[$STARRED_REPO_BRANCH]: https://github.com/$STARRED_REPO.git"
done > "$STARRED_REPOS_LIST_ARCHIVE"
echo -e "Done!\n"

# End of the script gen-starred-repos-list.
echo "---------- gen-starred-repos-list ----------"

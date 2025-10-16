#!/usr/bin/env bash

# Show the information about the script gen-stars-list.
echo "---------- gen-stars-list ----------"
echo -e "\nGoal: Generation for github stars list with given owner(user or organization).\n"

# Run the script gen-stars-list.
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER && echo ""
echo "Saving [$REPO_OWNER] github stars list..."
STARS_LIST_ARCHIVE="$(cd "$(dirname "$0")"; pwd)/../assets/docs/Stars-List-$REPO_OWNER.md"
STARS_LIST=$(gh api users/$REPO_OWNER/starred --paginate --jq '.[].full_name' | sort -f)
for STARRED_REPO in $STARS_LIST; do
    STARRED_REPO_BRANCH=$(gh api repos/$STARRED_REPO --jq '.default_branch')
    while [ ! $STARRED_REPO_BRANCH ]; do
        STARRED_REPO_BRANCH=$(gh api repos/$STARRED_REPO --jq '.default_branch')
        if [ $STARRED_REPO_BRANCH ]; then
            break
        fi
    done
    echo "$STARRED_REPO[$STARRED_REPO_BRANCH]: https://github.com/$STARRED_REPO.git"
done > "$STARS_LIST_ARCHIVE"
echo -e "Done!\n"

# End of the script gen-stars-list.
echo "---------- gen-stars-list ----------"

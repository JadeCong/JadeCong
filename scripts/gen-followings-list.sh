#!/usr/bin/env bash

# Show the information about the script gen-followings-list.
echo "---------- gen-followings-list ----------"
echo -e "\nGoal: Generation for github followings list with given owner(user or organization).\n"

# Run the script gen-followings-list.
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER && echo ""
echo "Saving [$REPO_OWNER] github followings list..."
FOLLOWINGS_LIST_ARCHIVE="$(cd "$(dirname "$0")"; pwd)/../assets/docs/Followings-List-$REPO_OWNER.md"
FOLLOWINGS_LIST=$(gh api users/$REPO_OWNER/following --paginate --jq '.[].login' | sort -f) 
for FOLLOWING in $FOLLOWINGS_LIST; do
    echo "$FOLLOWING: https://github.com/$FOLLOWING"
done > "$FOLLOWINGS_LIST_ARCHIVE"
echo -e "Done!\n"

# End of the script gen-followings-list.
echo "---------- gen-followings-list ----------"

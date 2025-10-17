#!/usr/bin/env bash

# Show the information about the script gen-followers-list.
echo "---------- gen-followers-list ----------"
echo -e "\nGoal: Generation for github followers list with given owner(user or organization).\n"

# Run the script gen-followers-list.
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER && echo ""
echo "Saving [$REPO_OWNER] github followers list..."
FOLLOWERS_LIST_ARCHIVE="$(cd "$(dirname "$0")"; pwd)/../assets/docs/Followers-List-$REPO_OWNER.md"
FOLLOWERS_LIST=$(gh api users/$REPO_OWNER/followers --paginate --jq '.[].login' | sort -f) 
for FOLLOWER in $FOLLOWERS_LIST; do
    echo "$FOLLOWER: https://github.com/$FOLLOWER"
done > "$FOLLOWERS_LIST_ARCHIVE"
echo -e "Done!\n"

# End of the script gen-followers-list.
echo "---------- gen-followers-list ----------"

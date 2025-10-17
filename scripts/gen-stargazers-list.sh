#!/usr/bin/env bash

# Show the information about the script gen-stargazers-list.
echo "---------- gen-stargazers-list ----------"
echo -e "\nGoal: Generation for github stargazers list with given owner(user or organization).\n"

# Run the script gen-stargazers-list.
echo -n "Please select the specific repository owner(user or organization): "
read REPO_OWNER && echo ""
echo "Saving [$REPO_OWNER] github stargazers list..."
STARGAZERS_LIST_ARCHIVE="$(cd "$(dirname "$0")"; pwd)/../assets/docs/Stargazers-List-$REPO_OWNER.md"
PUBLIC_REPOS_LIST=$(gh repo list $REPO_OWNER --visibility public --limit 100000 --json nameWithOwner,stargazerCount --jq '.[] | select(.stargazerCount > 0) | .nameWithOwner' | awk '{print $1}' | sort -f)
for PUBLIC_REPO in $PUBLIC_REPOS_LIST; do
    PUBLIC_REPO_BRANCH=$(gh api repos/$PUBLIC_REPO --jq '.default_branch')
    while [ ! $PUBLIC_REPO_BRANCH ]; do
        PUBLIC_REPO_BRANCH=$(gh api repos/$STARRED_REPO --jq '.default_branch')
        if [ $PUBLIC_REPO_BRANCH ]; then
            break
        fi
    done
    echo "$PUBLIC_REPO[$PUBLIC_REPO_BRANCH]: https://github.com/$PUBLIC_REPO.git"
    REPO_STARGAZERS_LIST=$(gh api repos/$PUBLIC_REPO/stargazers --paginate --jq '.[].login' | sort -f)
    for REPO_STARGAZER in $REPO_STARGAZERS_LIST; do
        echo "  - $REPO_STARGAZER: https://github.com/$REPO_STARGAZER"
    done
done > "$STARGAZERS_LIST_ARCHIVE"
echo -e "Done!\n"

# End of the script gen-stargazers-list.
echo "---------- gen-stargazers-list ----------"

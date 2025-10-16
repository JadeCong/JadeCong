#!/usr/bin/env bash

# Show the information about the script push-all-commits.
echo "---------- push-all-commits ----------"
echo -e "\nGoal: Push commits for all existing repositories automatically with given local repository archive path.\n"

# Run the script push-all-commits.
echo -n "Please select the specific local repository archive path: "
read LOCAL_REPO_ARCHIVE_PATH && echo ""
LOCAL_REPO_OWNER_LIST=$(ls -lA "$LOCAL_REPO_ARCHIVE_PATH" | awk '/^d/ {print $NF}' | sort -f)
for LOCAL_REPO_OWNER in $LOCAL_REPO_OWNER_LIST; do
    echo "----- REPO_OWNER: $LOCAL_REPO_OWNER -----"
    LOCAL_REPO_OWNER_PATH="$LOCAL_REPO_ARCHIVE_PATH/$LOCAL_REPO_OWNER"
    LOCAL_REPO_LIST=$(ls -lA "$LOCAL_REPO_OWNER_PATH" | awk '/^d/ {print $NF}' | sort -f)
    for LOCAL_REPO_NAME in $LOCAL_REPO_LIST; do
        cd "$LOCAL_REPO_OWNER_PATH/$LOCAL_REPO_NAME"
        LOCAL_REPO_BRANCH=$(git branch --show-current)
        echo -e "Pushing commit to [$LOCAL_REPO_OWNER/$LOCAL_REPO_NAME] repository on [$LOCAL_REPO_BRANCH] branch..."
        git push origin $LOCAL_REPO_BRANCH
        while [ $? -ne 0 ]; do
            echo "Retrying to push commit to [$LOCAL_REPO_OWNER/$LOCAL_REPO_NAME] repository on [$LOCAL_REPO_BRANCH] branch..."
            git push origin $LOCAL_REPO_BRANCH
            if [$? -eq 0]; then
                break
            fi
        done
        echo "-----"
    done
    echo "Done!"
    echo -e "----- REPO_OWNER: $LOCAL_REPO_OWNER -----\n"
done
echo -e "All done!\n"

# End of the script push-all-commits.
echo "---------- push-all-commits ----------"

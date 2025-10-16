# GitHub-CLI

> Custom GitHub Command Line Interfaces.

---

## 1. Prerequisite

> Installation of GitHub CLI: 
>> brew install gh (macOS)<br>
>> sudo apt update && sudo apt install gh (Ubuntu)<br>
>> choco install gh (Windows)<br>

---

## 2. Custom Scripts

### (1) clone-repo

> Goal: Clone repository automatically with given local path, owner(user or organization), name and branch.
> 
> Run: sh ./scripts/clone-repo.sh

### (2) clone-repos

> Goal: Clone repositories automatically on default branch with given local path, owner(user or organization) and names.
> 
> Run: sh ./scripts/clone-repos.sh

### (3) clone-all-repos

> Goal: Clone all repositories automatically on default branch with given local path and owner(user or organization).
> 
> Run: sh ./scripts/clone-all-repos.sh

### (4) push-commit

> Goal: Push commit for existing repository automatically with given local path, owner(user or organization), name and branch.
> 
> Run: sh ./scripts/push-commit.sh

### (5) push-commits

> Goal: Push commits for all existing repositories automatically with given local path and owner(user or organization).
> 
> Run: sh ./scripts/push-commits.sh

### (6) push-all-commits

> Goal: Push commits for all existing repositories automatically with given local repository archive path.
> 
> Run: sh ./scripts/push-all-commits.sh

### (7) sync-fork

> Goal: Sync fork for forked repository automatically with given owner(user or organization), name and branch.
> 
> Run: sh ./scripts/sync-fork.sh

### (8) sync-forks

> Goal: Sync forks for all forked repositories automatically with given owner(user or organization).
> 
> Run: sh ./scripts/sync-forks.sh

### (9) sync-all-forks

> Goal: Sync forks for all forked repositories automatically with given owners(user or organization).
> 
> Run: sh ./scripts/sync-all-forks.sh

### (10) pull-update

> Goal: Pull update for existing repository automatically with given local path, owner(user or organization), name and branch.
> 
> Run: sh ./scripts/pull-update.sh

### (11) pull-updates

> Goal: Pull updates for all existing repositories automatically with given local path and owner(user or organization).
> 
> Run: sh ./scripts/pull-updates.sh

### (12) pull-all-updates

> Goal: Pull updates for all existing repositories automatically with given local repository archive path.
> 
> Run: sh ./scripts/pull-all-updates.sh

### (13) gen-followers-list

> Goal: Generation for github followers list with given owner(user or organization).
> 
> Run: sh ./scripts/gen-followers-list.sh

### (14) gen-followings-list

> Goal: Generation for github followings list with given owner(user or organization).
> 
> Run: sh ./scripts/gen-followings-list.sh

### (15) gen-forkcounts-list

> Goal: Generation for github forkcounts list with given owner(user or organization).
> 
> Run: sh ./scripts/gen-forkcounts-list.sh

### (16) gen-forks-list

> Goal: Generation for github forks list with given owner(user or organization).
> 
> Run: sh ./scripts/gen-forks-list.sh

### (17) gen-stargazers-list

> Goal: Generation for github stargazers list with given owner(user or organization).
> 
> Run: sh ./scripts/gen-stargazers-list.sh

### (18) gen-stars-list

> Goal: Generation for github stars list with given owner(user or organization).
> 
> Run: sh ./scripts/gen-stars-list.sh

---

## 3. Custom Actions

### (1) gen-followers-list-jadecong

> Goal: Generation of GitHub Followers List for JadeCong.
>
> Result: assets/docs/Followers-List-JadeCong.md

### (2) gen-followings-list-jadecong

> Goal: Generation of GitHub Followings List for JadeCong.
>
> Result: assets/docs/Followings-List-JadeCong.md

### (3) gen-forkcounts-list-jadecong

> Goal: Generation of GitHub Forkcounts List for JadeCong.
>
> Result: assets/docs/Forkcounts-List-JadeCong.md

### (4) gen-forks-list-jadecong

> Goal: Generation of GitHub Forks List for JadeCong.
>
> Result: assets/docs/Forks-List-JadeCong.md

### (5) gen-stargazers-list-jadecong

> Goal: Generation of GitHub Stargazers List for JadeCong.
>
> Result: assets/docs/Stargazers-List-JadeCong.md

### (6) gen-stars-list-jadecong

> Goal: Generation of GitHub Stars List for JadeCong.
>
> Result: assets/docs/Stars-List-JadeCong.md

### (7) generate-github-contribution-snake

> Goal: Generation of GitHub Contribution Snake for JadeCong.
>
> Result: assets/images/github-contribution-snake.gif & assets/images/github-contribution-snake.svg

### (8) sync-forks-jadecong

> Goal: Synchronization of GitHub Forks for JadeCong.
>
> Result: synced all forked github repositories

---

## References

> (1) https://docs.github.com/zh<br>
> (2) https://docs.github.com/zh/github-cli<br>
> (3) https://github.com/cli/cli<br>
> (4) https://cli.github.com/<br>
> (5) https://cli.github.com/manual/<br>

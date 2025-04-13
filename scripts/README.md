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

### (1) sync-fork

> Goal: Sync forked repository automatically with given owner(user or organization), name and branch.
> 
> Run: sh ./scripts/sync-fork.sh

### (2) sync-forks

> Goal: Sync all forked repositories automatically with given owner(user or organization).
> 
> Run: sh ./scripts/sync-forks.sh

### (3) pull-updates

> Goal: Pull updates for all existing repositories automatically with given local owner path and owner(user or organization).
> 
> Run: sh ./scripts/pull-updates.sh

### (4) gen-forks-list

> Goal: Generation for GitHub Repository Forks List with given owner(user or organization).
>
> Run: sh ./scripts/gen-forks-list.sh

### (5) gen-starred-repos-list

> Goal: Generation for GitHub Starred Repositories List with given owner(user or organization).
>
> Run: sh ./scripts/gen-starred-repos-list.sh

### (6) gen-followings-list

> Goal: Generation for GitHub Followings List with given owner(user or organization).
>
> Run: sh ./scripts/gen-followings-list.sh

---

## 3. Custom Actions

### (1) gen-followings-list-jadecong

> Goal: Generation of GitHub Followings List for JadeCong.
>
> Result: assets/docs/Followings-List-JadeCong.md

### (2) gen-starred-repos-list-jadecong

> Goal: Generation of GitHub Starred Repositories List for JadeCong.
>
> Result: assets/docs/Starred-Repos-List-JadeCong.md

### (3) gen-forks-list-cloudenginehub

> Goal: Generation of GitHub Repository Forks List for CloudEngineHub.
> 
> Result: assets/docs/Forks-List-CloudEngineHub.md

---

## References

> (1) https://docs.github.com/zh<br>
> (2) https://docs.github.com/zh/github-cli<br>
> (3) https://github.com/cli/cli<br>
> (4) https://cli.github.com/<br>
> (5) https://cli.github.com/manual/<br>

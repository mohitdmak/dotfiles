#!/bin/bash

# Utility vars
RED='\033[0;31m'
CYAN='\033[0;36m'

# Here scripts will arrive if they fail
die(){
  echo -e "${RED} AUTO BACKUP FAILED :"
  echo "$*" 1>&2
  # exit 1
}
# debug
echo -e "${CYAN} [ENTER] Home @ mohitdmak > > >"
cd && pwd

# add personal gitlab ssh key
echo -e "${CYAN} [SETUP] Starting SSH-AGENT and adding Personal GitLab SSH Key > > >"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_personal_gitlab_ed25519 | 
    die "ERROR [SETUP]:Could not add personal gitlab ssh key for regular backup."
echo -e "${CYAN} [SETUP] SSH-AGENT and GitLab SSH Keys setup < < <"

# dotfiles
auto_backup () {
    echo -e "${CYAN} [ENTER] SYSTEM CRITICAL GIT REPO @ ${1} > > >"
    cd $1 && pwd
    echo -e "${CYAN} [FETCH] Fetching from upstream : "
    git fetch origin | die "ERROR [FETCH]:Could not fetch upstream @ ${1} !"
    git status
    if [[ `git status --porcelain` ]]; then
        echo -e "${CYAN} [ADD] Adding Hunks : "
        git add . | die "ERROR [ADD]:Could not add git diff @ ${1} !"
        echo -e "${CYAN} [COMMIT] Committing Diffs : "
        git commit -m "add: regular backup" | die "ERROR [COMMIT]: Could not commit @ ${1} !"
        echo -e "${CYAN} [PUSH] Pushing Update : "
        git push | die "ERROR [PUSH]: Unable to Push @ ${1}; most probably an ssh-id agent inactive issue ! < < <"
    else
        echo -e "${CYAN} [STATUS] No updates in ${1}"
    fi
}
dotfiles="$HOME/dotfiles"
sem31="$HOME/vault/semester::3:1"
sem22="$HOME/vault/sem-2-2"
auto_backup dotfiles
auto_backup sem31
auto_backup sem22

# vault - semester 3-1
echo "Moving to Vault Semester::3:1 @ ~/vault/semester::3:1 > > >"
cd ~/vault/semester::3:1 && pwd
git fetch origin
git status
echo "Adding Hunks : "
git add .
git commit -m "add: regular backup"
echo "Pushing Update : "
git push | die "ERROR: Unable to Push git diffs in ~/vault/semester::2:2; most probably an ssh-id agent inactive issue! < < <"

# vault - semesters 2-2
echo "Moving to Vault Semester::2:2 @ ~/vault/semester::2:2 > > >"
cd ~/vault/Semester::2:2 && pwd
git fetch origin
git status
echo "Adding Hunks : "
git add .
git commit -m "add: regular backup"
echo "Pushing Update : "
git push | die "ERROR: Unable to Push git diffs in ~/vault/semester::2:2; most probably an ssh-id agent inactive issue! < < <"

# vault - semesters 2-2
echo "Moving to Vault Semester::2:2 @ ~/vault/sem-2-2 > > >"
cd ~/vault/sem-2-2 && pwd
git fetch origin
git status
echo "Adding Hunks : "
git add .
git commit -m "add: regular backup"
echo "Pushing Update : "
git push | die "ERROR: Unable to Push git diffs in ~/vault/semester::2:2; most probably an ssh-id agent inactive issue! < < <"

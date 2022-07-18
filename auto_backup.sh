#!/bin/bash

# Here scripts will arrive if they fail
die(){
  echo "\nFAILED"
  echo "$*" 1>&2
  # exit 1
}
# debug
echo "Entering Home @ mohitdmak > > >"
cd && pwd

# dotfiles
echo "Moving to Dotfiles @ ~/dotfiles > > >"
cd ~/dotfiles && pwd
echo "Dotfiles Git Status : "
git fetch origin
git status
echo "Adding Hunks : "
git add .
git commit -m "add: regular backup"
echo "Pushing Update : "
git push | die "ERROR: Unable to Push git diffs in ~/vault/semester::2:2; most probably an ssh-id agent inactive issue! < < <"

# add personal gitlab ssh key
ssh-add ~/.ssh/id_personal_gitlab_ed25519

# vault - semester 3-1
echo "Moving to Vault Semester::3:1 @ ~/vault/semester::3:1 > > >"
cd ~/vault/semester::3:1 && pwd
echo "Vault Git Status : "
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
echo "Vault Git Status : "
git fetch origin
git status
echo "Adding Hunks : "
git add .
git commit -m "add: regular backup"
echo "Pushing Update : "
git push | die "ERROR: Unable to Push git diffs in ~/vault/semester::2:2; most probably an ssh-id agent inactive issue! < < <"

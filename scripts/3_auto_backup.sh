#!/bin/bash

# Utility vars
RED='\033[0;31m'
CYAN='\033[0;36m'

# Here scripts will arrive if they fail
die(){
  echo -e "${RED}AUTO BACKUP FAILED :"
  echo "$*" 1>&2
  notify-send -u critical "[SYSTEMD SERVICE ERROR] AutoBackup Failed: $*"
  # exit 1
}

# debug
echo -e "${CYAN}[ENTER] Home @ mohitdmak > > >"
cd && pwd

# add personal gitlab ssh key
PERSONAL_GITLAB_SSH_KEY_LOCATION="$HOME/.ssh/id_personal_gitlab_ed25519"
echo -e "${CYAN}[SETUP] Starting SSH-AGENT and adding Personal GitLab SSH Key > > >"
if eval "$(ssh-agent -s)"
then 
    :
else
    die "[ERROR SETUP]:Could not start SSH-AGENT."
fi
if ssh-add ${PERSONAL_GITLAB_SSH_KEY_LOCATION} 
then
    :
else
    die "[ERROR SETUP]:Could not add personal gitlab ssh key for regular backup."
fi
echo -e "${CYAN}[SETUP] SSH-AGENT and GitLab SSH Keys setup < < <"

# function to enter repository provided by 1st arg, and send updates to upsream if any
auto_backup () {
    echo -e "${CYAN}[ENTER] SYSTEM CRITICAL GIT REPO @ ${1} > > >"
    cd "$1" && pwd
    echo -e "${CYAN}[FETCH] Fetching from upstream : "
    if git fetch origin 
    then
        :
    else
        die "[ERROR FETCH]:Could not fetch upstream @ ${1} !"
    fi
    git status
    if [[ `git status --porcelain` ]]; then
        echo -e "${CYAN}[ADD] Adding Hunks : "
        if git add . 
        then 
            :
        else 
            die "[ERROR ADD]:Could not add git diff @ ${1} !"
        fi
        echo -e "${CYAN}[COMMIT] Committing Diffs : "
        if git commit -m "add: regular backup" 
        then 
            :
        else 
            die "[ERROR COMMIT]: Could not commit @ ${1} !"
        fi
    # obtain branch and check for pending commits (due to ssh/network issues)
    BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    echo -e "${CYAN}[CHECK] Checking for pending commits @ ${BRANCH} @ origin : > > >"
    PENDING_COMMITS=$(git log origin/${BRANCH}..${BRANCH} | cat)
    if [[ ${PENDING_COMMITS} == "" ]]; then
        echo -e "${CYAN}[CHECK] No pending commits < < <"
    else
        echo -e "${CYAN}[PUSH] Found pending commits; pushing updates : "
        if git push 
        then 
            :
        else die "[ERROR PUSH]: Unable to Push @ ${1}; most probably an ssh-id agent inactive issue ! < < <"
        fi
    fi
    else
        echo -e "${CYAN}[STATUS] No updates in ${1} < < <"
    fi
}

# function to enter repository provided by 1st arg, and send/receive updates to upsream if any
auto_backup_restore () {
    echo -e "${CYAN}[ENTER] SYSTEM CRITICAL GIT REPO @ ${1} > > >"
    cd "$1" && pwd
    echo -e "${CYAN}[FETCH] Fetching from upstream : "
    if git fetch origin 
    then
        git pull
    else
        die "[ERROR FETCH]:Could not fetch upstream @ ${1} !"
    fi
    git status
    if [[ `git status --porcelain` ]]; then
        echo -e "${CYAN}[ADD] Adding Hunks : "
        if git add . 
        then 
            :
        else 
            die "[ERROR ADD]:Could not add git diff @ ${1} !"
        fi
        echo -e "${CYAN}[COMMIT] Committing Diffs : "
        if git commit -m "add: regular backup" 
        then 
            :
        else 
            die "[ERROR COMMIT]: Could not commit @ ${1} !"
        fi
    # obtain branch and check for pending commits (due to ssh/network issues)
    BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    echo -e "${CYAN}[CHECK] Checking for pending commits @ ${BRANCH} @ origin : > > >"
    PENDING_COMMITS=$(git log origin/${BRANCH}..${BRANCH} | cat)
    if [[ ${PENDING_COMMITS} == "" ]]; then
        echo -e "${CYAN}[CHECK] No pending commits < < <"
    else
        echo -e "${CYAN}[PUSH] Found pending commits; pushing updates : "
        if git push 
        then 
            :
        else die "[ERROR PUSH]: Unable to Push @ ${1}; most probably an ssh-id agent inactive issue ! < < <"
        fi
    fi
    else
        echo -e "${CYAN}[STATUS] No updates in ${1} < < <"
    fi
}

# system critical locations
# DOTFILES="$HOME/dotfiles"
DOTFILES="$HOME/legacy_dotfiles"
SEM41="/home/mohitdmak/vault/sem_4_1"
SEM32="/home/mohitdmak/vault/sem_3_2"
SEM31="/home/mohitdmak/vault/semester::3:1"
SEM22="/home/mohitdmak/vault/sem-2-2"
ALGOS="/home/mohitdmak/algos"
WIKI="/home/mohitdmak/vault/wiki"

# Send system wide warning
notify-send -u critical "[SYSTEMD SERVICE NOTIF]: @mohtidmak: Auto Backing up System Critical GIT Locations; Avoid ShutDown."
# Notification with pulse
SOUND_TO_PLAY="$HOME/dotfiles/batteryPopup/.config/batteryPopup/battery-popup.wav"
SOUND_VOLUME=65536
paplay "$SOUND_TO_PLAY" --volume $SOUND_VOLUME

# Start backing up . . .
auto_backup ${DOTFILES}
auto_backup ${SEM41}
auto_backup ${WIKI}
# auto_backup ${SEM32}
# auto_backup ${SEM31}
# auto_backup ${SEM22}
auto_backup_restore ${ALGOS}

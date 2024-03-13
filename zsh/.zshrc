# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"
# This lets you set the title of your terminal tab
precmd () { print -Pn "\e]0;$TITLE\a" }
title() { export TITLE="$*" }

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# adding rofi scripts to path
export PATH=$HOME/.config/rofi/bin:$PATH
# add useful util scripts to path
export PATH=$HOME/dotfiles/scripts:$PATH
# add MACOS nvim executable
export PATH=$HOME/Downloads/nvim-macos/bin:$PATH
# Add go binaries to path for some plugins dependant on it 
export PATH=/usr/local/go/bin:$PATH
# theme for bat
# export BAT_THEME=ansi-dark # (this is deprecated)
export BAT_THEME=ansi

# include lsp servers by mason in path
export PATH=$HOME/.local/share/nvim/mason/bin:$PATH
# alias golangci-lint="golangci-lint-langserver" # instead copied golangci-lint-langserver as golangci-lint in binary

# Cisco repos permanent env vars 
source ~/gh/cspe-phanes/envConfiguration.sh
source ~/gh/cspe-phanes/envSecrets.sh
# env vars for caduceus artifactory and npm repos, docker registry access
source ~/gh/caducues_secrets.sh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Using POWERLINE FONT
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="jonathan" # for macos
POWERLEVEL9K_MODE="nerdfont-complete"
# Configuring airline for terminal
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir docker_machine dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(anaconda virtualenv vcs)
CONDA_AUTO_ACTIVATE_BASE=false


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
HIST_STAMPS="dd.mm.yyyy"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# TMP: To solve history-substring-search
HISTSIZE=1000
SAVEHIST=50000
HISTFILE=${XDG_STATE_HOME:-$HOME/.local/state}/.zsh_history
setopt appendhistory
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

plugins=(dirhistory sudo zsh-syntax-highlighting history-substring-search)
# plugins=(dirhistory sudo zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
# bindkey "^[[Z" history-beginning-search-forward
# bindkey "^I" history-beginning-search-backward

# ALiases must be after sourcing !!! Else they maybe overriden by oh my zsh's default aliases
# USEFUL ALIASES FOR COLORLS:::::::::
# 1) -l : kind of ll, but better
# 2) --gs : gives git statuses of each file/dir
# 3) -A : kind of la, but better
# 4) -o : same as -l, except no group info provided
# 5) -g : same as -l, except no owner info provided
# 6) --hyperlink : to provide links to files/dir which when clicked with ctrl, opens them up. very useful.
# source $(dirname $(gem which colorls))/tab_complete.sh
unalias ls
unalias ll
unalias la
# alias ls="colorls --hyperlink --gs"
# alias ll="colorls --hyperlink --gs -l"
# alias la="colorls --hyperlink --gs -A"
# alias lla="colorls --hyperlink --gs -Al"
# exa settings
# include exa release from gh
export PATH=$HOME/tools/bin:$PATH
export EXA_ICON_SPACING=2

# When colorls not installed (installed much faster exa due to slow fucking intel mac - although exa better)
alias ls="exa --icons"
alias ll="exa -l --header --group --icons"
alias la="exa -a --icons"
alias lla="exa -al --header --group --icons"

# FZF ALIASES
alias fzf="fzf --preview='bat --color=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down --padding=0 --margin=0"


# User configuration
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# changed for mac
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Setting preffered editors for remote and remote sessions
#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/amd64/server
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Always execute tmux upon starting
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux -u
fi
# fzf settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mohitdmak/tools/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mohitdmak/tools/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mohitdmak/tools/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mohitdmak/tools/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Pro keychron k2v2 keyboard setup
# make caps lock another backspace key
# exec xmodmap -e "clear lock"
# exec xmodmap -e "keysym Caps_Lock = BackSpace" 
# # increase keystroke input speed and reduce delay/repeat times
# exec xset r rate 200 35
export PATH=$PATH:/Users/mmakwana/.spicetify

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    git
    mercurial
    jira
    mercurial
    mvn
    pip
    pylint
    python
    vagrant

    # last position
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export PATH="$HOME/bin:/usr/local/apache-maven/apache-maven-latest/bin:/usr/local/packer:$PATH"

alias vi="mvim"
alias less="less -r"

bindkey -v
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward
bindkey "${terminfo[kcuu1]}" history-beginning-search-backward
bindkey "${terminfo[kcud1]}" history-beginning-search-forward

export WORKON_HOME=$HOME/.virtualenvs
if [ ! -d $WORKON_HOME ]; then mkdir $WORKON_HOME; fi
source /usr/local/bin/virtualenvwrapper.sh

# history mods: entries from multiple sessions are interleaved in the history 
# file, but individual in-memory histories don't reflect what happened in other 
# sessions
setopt incappendhistory
setopt extendedhistory
setopt histignorespace
setopt histignoredups

# enable #'ing a line out
setopt interactivecomments

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export JAVA_HOME=$(/usr/libexec/java_home)


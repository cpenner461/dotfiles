
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# bash completion
if [ -f /usr/local/etc/bash_completion ]; then
 . /usr/local/etc/bash_completion
fi
export USER_BASH_COMPLETION_DIR=~/.bash_completion.d
for ff in $USER_BASH_COMPLETION_DIR/*; do source $ff; done

# aliases
alias ls="ls -pG"   # trailing dir slash & color
alias ll="ls -l"    # long
alias lh="ll -h"    # long human
alias la="ll -a"    # long hidden
alias vi="mvim"	    # use MacVim
alias vimdiff="mvim -d"
brew_prefix=`/usr/local/bin/brew --prefix`
alias seq="$brew_prefix/bin/gseq"

# other options
export GREP_OPTIONS="--color=auto"  # colored grep
export PS1='[\W]:'

function sshtun() {
    if [ "$1" == "list" ]; then
        echo "Open tunnels:"
        ps aux | grep ssh | grep localhost
    else
        hostname=$1
        port=$2
        keypair=""
        sudo=""
        if [ "x$3" != "x" ]; then
            keypair="-i $3"
        fi
        if [ "x$3" == "xsudo" -o "x$4" == "xsudo" ]; then
            sudo="sudo"
        fi
        $sudo ssh $keypair -f -L $port:localhost:$port $hostname -N
    fi
}


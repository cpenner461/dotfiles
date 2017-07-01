#!/bin/bash

#
# custom installations not covered by homebrew
#

log()   { STRAP_STEP="$*"; echo "--> $*"; }

# oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
	log "Installing Oh-My-Zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	logk
fi



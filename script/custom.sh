#!/bin/bash

#
# custom installations not covered by homebrew
#

log()   { STRAP_STEP="$*"; echo "--> $*"; }
logk()  { STRAP_STEP="";   echo "OK"; }

getgit() {
	repo=$1
	clone_dir=$2
	dirname=$3
	
	fulldir="${clone_dir}/${dirname}"

	mkdir -p $clone_dir
	if [ ! -d $fulldir ]; then
		log ">> Cloning repo"
		git clone $repo $fulldir
	else
		log ">> Updating existing clone"
		pushd $fulldir
		git pull --rebase --autostash
		popd
	fi
	logk
}

## oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
	log "Installing Oh-My-Zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	logk
else
	log "Oh-My-Zsh already installed"
fi

## vim things

log "Installing vundle"
getgit \
	https://github.com/VundleVim/Vundle.vim.git \
	$HOME/.vim/bundle \
	Vundle.vim

log "Installing pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
logk

log "Installing solarized"
getgit \
	git://github.com/altercation/vim-colors-solarized.git \
	$HOME/.vim/bundle \
	vim-colors-solarized.git

log "Configuring dock"
dargs="--no-restart "
dockadd() { dockutil $dargs --add "$1"; }
dockspace() { dockutil --add '' --type spacer --section apps --after "$1"; sleep 2; }
# I don't love the verbose output of dockutil, so if interested in seeing
# what's happening wrap relevant bits in a 'set -x' and a 'set +x'

# start by resetting and then wiping out anything I don't want
log "Clearing existing applications"
osascript -e 'tell application "System Preferences" to quit'
defaults write com.apple.dock persistent-apps -array
killall Dock && sleep 5

log "Adding applications"
# continue by adding things I want
dockadd /Applications/LaunchBar.app
dockadd "/System/Applications/Utilities/Activity Monitor.app"
dockadd "/Applications/Google Chrome.app"
dockadd /Applications/Safari.app
dockadd "/Applications/1Password 7.app"
dockadd /Applications/Mimestream.app
dockadd /Applications/Slack.app
dockadd /Applications/zoom.us.app
dockadd /System/Applications/Messages.app
dockadd /Applications/iTerm.app
dockadd /Applications/VimR.app
dockadd "/Applications/IntelliJ IDEA CE.app"
dockadd "/Applications/Visual Studio Code.app"
dockadd /Applications/Obsidian.app
dockadd /Applications/Drafts.app
dockadd /Applications/OmniFocus.app
dockadd /System/Applications/Music.app
killall Dock && sleep 5

log "Adding spacer tiles"
dockspace "Activity Monitor"
dockspace "1Password 7"
dockspace "Messages"
dockspace "Visual Studio Code"
dockspace "OmniFocus"
killall Dock && sleep 5

log "Configuring options"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 40
defaults write com.apple.dock largesize -int 60
defaults write com.apple.dock magnification -bool true

log "Restarting Dock"
killall Dock


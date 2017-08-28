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

## python things
pip install virtualenvwrapper

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
dockspace() { set -x; dockutil --add '' --type spacer --section apps --after "$1"; sleep 2; set +x; }

# start by resetting and then wiping out anything I don't want
osascript -e 'tell application "System Preferences" to quit'
defaults write com.apple.dock persistent-apps -array
killall Dock && sleep 3

log "Adding applications"
# continue by adding things I want
dockadd /Applications/LaunchBar.app
dockadd "/Applications/Utilities/Activity Monitor.app"
dockadd /Applications/Firefox.app
dockadd "/Applications/Google Chrome.app"
dockadd /Applications/Safari.app
dockadd "/Applications/1Password 6.app"
dockadd "/Applications/Airmail 3.app"
dockadd /Applications/Slack.app
dockadd /Applications/Messages.app
dockadd /Applications/Quiver.app
dockadd /Applications/Utilities/Terminal.app
dockadd /Applications/iTerm.app
dockadd /Applications/MacVim.app
dockadd "/Applications/IntelliJ IDEA.app"
dockadd /Applications/Photos.app
killall Dock && sleep 3

log "Adding spacer tiles"
dockspace "Activity Monitor"
dockspace "1Password 6" 
dockspace "Messages"
dockspace "Quiver"

log "Configuring options"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 40
defaults write com.apple.dock largesize -int 60
defaults write com.apple.dock magnification -bool true

log "Restarting Dock"
killall Dock


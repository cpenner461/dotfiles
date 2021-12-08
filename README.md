## Overview
These are my dot files.  Requires [stow][] to help manage the symlinking of 
the dot files into place.  

### Usage:

	./script/setup.sh

## Bootstrapping macOS
I've also included a bootstrapping script based very heavily on the excellent
[strap](https://github.com/MikeMcQuaid/strap), but lightly customized to my
preferences.  Some key differences:

- All of my git config is already contained as a dotfile in this repo, and when
  I originally put this together I was not using Github as a primary source of
  source control.
- I'm using this personally and will only ever be running the script directly 
  so don't need the included webapp.
- Probably the main reason though, is that as noted above I'm using [stow][] 
  to manage the dot files, so I've changed the order of how things are done in 
  the bootstrapping process (i.e. installing from the `.Brewfile` before 
  running the dot files setup script).

Not using his code directly has the obvious downfall of not being able to stay
up to date with any changes/improvements that are made there, but I'm taking
that hit for now.  

### Prerequisites
- A fresh macOS install (if you are going for a clean install - this can be
  used to keep a previously strap'ed system up to date)
- An ssh key with access to my Github account (which implies that you've
  installed git, which has likely installed Xcode tools)
- Manually login with your Apple ID in System Preferences

### Usage:
- Clone this repo 
- Run the bootstrap script as yourself (not `root` or `sudo`):

		./script/strap.sh

- Repeat as necessary as things change (e.g. adding brew dependencies etc)

[stow]:https://www.gnu.org/software/stow/

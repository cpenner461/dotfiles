## Overview
These are my dot files.  Requires [stow][] to help manage the symlinking of 
the dot files into place.  

### Usage:

	./script/setup.sh

## Bootstrapping macOS
I've also included a bootstrapping script based very heavily on the excellent
[strap](https://github.com/MikeMcQuaid/strap), but customized to my 
preferences.  Some key differences:

- Github is a secondary not primary place for my code development, so I don't
  need some of the integration/setup for it.  All of my git config is already
  contained as a dotfile in this repo.
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
- a fresh macOS install (if you are going for a clean install)
- an ssh key with access to my Github account

### Usage:
- Clone this repo 
- Run the bootstrap script as yourself (not `root` or `sudo`):

		./script/strap.sh

- Repeat as necessary as things change (e.g. adding brew dependencies etc)

[stow]:https://www.gnu.org/software/stow/

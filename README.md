# My dotfiles

## Installation

Run this on a new machine:

```bash
curl -L https://raw.githubusercontent.com/thedersen/dotfiles/master/install.sh | zsh
```

or, follow instructions below for a more manual process.

### Prerequisites

* Install [Homebrew](http://brew.sh/)
* `brew install git`

### Using Git and the bootstrap script

You can clone the repository wherever you want. The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/thedersen/dotfiles.git
cd dotfiles
source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
source bootstrap.sh -f
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
git config --global user.name "username"
git config --global user.email "username@example.com"
```

You could also use `~/.extra` to override settings, functions and aliases.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./macOS.sh
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

## Thanks to…

* [Mathias Bynens](http://mathiasbynens.be/) for the original repository

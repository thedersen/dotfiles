# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install git
brew install git

# Make some directories
mkdir ~/dev
mkdir ~/dev/dotfiles
mkdir ~/dev/os
mkdir ~/dev/play
mkdir ~/dev/work
mkdir ~/dev/talk
mkdir ~/dev/me

# Clone this repository
git clone https://github.com/thedersen/dotfiles.git ~/dev/dotfiles

source ~/dev/dotfiles/bootstrap.sh

# Install n
curl -L https://git.io/n-install | bash

# Install yarn
curl -o- -L https://yarnpkg.com/install.sh | bash

# Run other install scripts
~/dev/dotfiles/brew.sh
~/dev/dotfiles/cask.sh
~/dev/dotfiles/macOS.sh

# Install Command Line Tools (CLT) for Xcode
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install git
brew install git

# Make some directories
mkdir -p ~/dev/dotfiles
mkdir -p ~/dev/os
mkdir -p ~/dev/play
mkdir -p ~/dev/work
mkdir -p ~/dev/talk
mkdir -p ~/dev/me

# Clone this repository
git clone https://github.com/thedersen/dotfiles.git ~/dev/dotfiles

# Install n
curl -L https://git.io/n-install | bash

# Install yarn
curl -o- -L https://yarnpkg.com/install.sh | bash

# Run other install scripts
source ~/dev/dotfiles/brew.sh
source ~/dev/dotfiles/cask.sh
source ~/dev/dotfiles/macOS.sh

# Finally, bootstrap all configuration
source ~/dev/dotfiles/bootstrap.sh

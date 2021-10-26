# Install Command Line Tools (CLT) for Xcode
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install git
brew install git

# Make some directories
mkdir -p ~/dev

# Clone this repository
git clone https://github.com/thedersen/dotfiles.git ~/dev/dotfiles

# Install n
curl -L https://git.io/n-install | bash

# Run other install scripts
source ~/dev/dotfiles/brew.sh
source ~/dev/dotfiles/macOS.sh
source ~/dev/dotfiles/aws-profile.sh

# Finally, bootstrap all configuration
source ~/dev/dotfiles/bootstrap.sh

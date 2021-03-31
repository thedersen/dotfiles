# Install Command Line Tools (CLT) for Xcode
xcode-select --install

# Install Homebrew
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
curl -L https://git.io/n-install | zsh

# Run other install scripts
source ~/dev/dotfiles/brew.sh
source ~/dev/dotfiles/macOS.sh
source ~/dev/dotfiles/aws-profile.sh

# Finally, bootstrap all configuration
source ~/dev/dotfiles/bootstrap.sh

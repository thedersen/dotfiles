#!/bin/zsh

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install command-line tools
brew install tree
brew install watch
brew install httpry
brew install ffmpeg
brew install python
brew install awscli
brew install aws/tap/aws-sam-cli
brew install zsh-git-prompt

# Install native apps
brew install adobe-creative-cloud
brew install docker
brew install dropbox
brew install duet
brew install firefox
brew install goodsync
brew install google-chrome
brew install google-drive
brew install iterm2
brew install opera
brew install slack
brew install postman
brew install visual-studio-code

# Remove outdated versions from the cellar.
brew cleanup

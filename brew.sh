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
brew install zsh-git-prompt

# Install native apps
brew install adobe-creative-cloud
brew install firefox
brew install google-chrome
brew install slack
brew install visual-studio-code
brew install --cask ghostty

# Remove outdated versions from the cellar.
brew cleanup

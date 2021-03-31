#!/bin/zsh

cd "$(dirname "${BASH_SOURCE[0]:-$0}")";

git pull origin master;

function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" \
		--exclude "README.md" --exclude "*.sh" -avh --no-perms . ~;
  source ~/.zshrc;
}

if [[ "$1" == "--force" || "$1" == "-f" ]]; then
	doIt;
else
  echo "";
	read "REPLY?This may overwrite existing files in your home directory. Are you sure? (y/n) ";
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

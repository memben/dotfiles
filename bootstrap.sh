#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# git pull origin main;

function doIt() {

	# array of items to ignore
	ignore=( brew.sh bootstrap.sh .DS_Store .git/ .osx README.md LICENSE-MIT.txt);

	# link all files including dotfiles except those in ignore 
	shopt -s dotglob;
	for file in *; do
		if [[ ! " ${ignore[@]} " =~ " ${file} " ]]; then
			ln -sfnv "$PWD/$file" "$HOME";
		fi
	done
	shopt -u dotglob;

	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	echo "If not yet done, run bash brew.sh";
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

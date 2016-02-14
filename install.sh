#!/bin/bash

readonly base_file=$(dirname $0)
readonly base_dir=$(readlink -f $base_file) # Get dir with this script
readonly vimrc_target="$HOME/.vimrc"
readonly vimrc_repo="$base_dir/vimrc"
readonly vimrc_backup="$vimrc_target$(date +%s)"

readonly vimc_dir="$HOME/.vim"
readonly vimc_repo="$base_dir"
readonly vimc_backup="$vimc_dir$(date +%s)"

# Does ~/.vimrc exist?

if [ -f "$vimrc_target" ]; then
	
	echo "~/.vimrc exist"
	# Test if files are different
	if [ "$(readlink -f $vimrc_target)" = "$(readlink -f $vimrc_repo)" ]; then
		echo "$vimrc_target and $vimrc_repo are the same - no linking"
	else
		echo "Creating backup $vimrc_backup"
		mv $vimrc_target $vimrc_backup
		if [ $? -ne 0 ]; then
			echo "Failed! Please do it manually and remove $vimrc_target!"
			exit 1
		fi
	fi
fi


if [ ! -f "$vimrc_target" ]; then
	# Create symlink
	echo "Creating symlink $vimrc_repo -> $vimrc_target"
	ln -s $vimrc_repo $vimrc_target
	if [ $? -ne 0 ]; then
		echo "Failed! Please do it manually!"
		exit 1
	fi
fi

# Does ~/.vim exist?
if [ -d "$vimc_dir" ]; then
	
	echo "~/.vim exists"
	# Test if there is a link
	if [ "$(readlink -f $vimc_dir)" = "$(readlink -f $vimc_repo)" ]; then
		echo "$vimc_dir and $vimc_repo are already linked"
	else
		echo "Creating backup $vimc_backup"
		mv $vimc_dir $vimc_backup
		if [ $? -ne 0 ]; then
			echo "Failed! Please do it manually and remove $vimc_dir!"
			exit 1
		fi
	fi
fi

if [ ! -d "$vimc_dir" ]; then
	echo "Creating symling $vimc_repo $vimc_dir"
	ln -s $vimc_repo $vimc_dir
	if [ $? -ne 0 ]; then
		echo "Failed! Please do it manually!"
		exit 1
	fi
fi

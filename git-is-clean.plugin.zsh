#!/bin/zsh

if [[ $(command -v require) ]]; then
	require "git" "brew reinstall git" "brew" # Automatically install git using homebrew.
fi

###
 # Is a git repo dirty?
 #
 # E.g: git-is-clean "/path/to/repo"
 #
 # Usage:
 #
 #    git-clean "path/to/repo" || echo "path/to/repo is dirty"
 #
 # This will echo "path/to/repo is dirty" if it indeed has changed.
 #
 # @since  Friday, August 27, 2021
 # @return boolean
 ##
function git-is-clean {

	if ! [[ -x $(command -v git) ]]; then >&2 echo "Please install git to use git-is-clean." && return; fi

	if [ ! -d "$1" ]; then
		return 0;
	fi

	local DIRTY=0
	local CWD=$(pwd)

	cd "$1"

	if [ ! -d ".git" ]; then

		cd "$CWD"

		return 0;
	fi

	git diff-index --quiet --ignore-submodules HEAD || DIRTY=1

	cd "$CWD"

	return $DIRTY
}

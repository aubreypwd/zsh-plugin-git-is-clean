#!/bin/zsh

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

	if [ ! -d "$1" ]; then
		return 0;
	fi

	DIRTY=0

	PWD=$(pwd)

	cd "$1"

	if [ ! -d ".git" ]; then
		return 0;
	fi

	git diff-index --quiet --ignore-submodules HEAD || DIRTY=1

	cd "$PWD"

	return $DIRTY
}

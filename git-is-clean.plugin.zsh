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
	DIRTY=0

	pushd "$1" &> /dev/null || return

	git diff-index --quiet --ignore-submodules HEAD || DIRTY=1

	popd &> /dev/null || return

	return $DIRTY
}

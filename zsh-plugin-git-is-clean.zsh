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

	dirty=$(

		# I can navigate to the folder.
		pushd "$1" &> /dev/null && \

			# It's dirty.
			git diff-index --quiet HEAD && \

				# And I can navigate back (should).
				popd &> /dev/null
	)

	return $dirty;
}

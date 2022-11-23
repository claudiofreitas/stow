#!/bin/bash

HASH="%C(always,yellow)%h%C(always,reset)"
# RELATIVE_TIME="%C(always,green)%ar%C(always,reset)"
AUTHOR_DATETIME="%C(always,green)%ai%C(always,reset)"
AUTHOR="%C(always,blue)%an%C(always,reset)"
REFS="%C(always,red)%d%C(always,reset)"
SUBJECT="%s"

# FORMAT="$HASH $RELATIVE_TIME{$AUTHOR{$REFS $SUBJECT"
# FORMAT="$HASH $AUTHOR_DATETIME{$AUTHOR{$REFS $SUBJECT"
FORMAT="$HASH $AUTHOR_DATETIME $AUTHOR$REFS $SUBJECT"

pretty_git_log() {
  git log --pretty="tformat:$FORMAT" $* |
    column -t -s '{' |
    less -XRS --quit-if-one-screen
}

# From: https://github.com/mrnugget/dotfiles/blob/master/githelpers
# Help: https://www.git-scm.com/docs/git-log#Documentation/git-log.txt-emnem


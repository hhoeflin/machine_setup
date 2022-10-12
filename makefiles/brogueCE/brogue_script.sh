#!/usr/bin/env bash

# Shell script to load brogue; is necessary
# as we have to change into a writeable directory first
# where the save games can be written to. Brogue writes them into cwd
# we also need to symlink assets there, as otherwise brogue will fail

set -e

userdir="${XDG_DATA_HOME:-$HOME/.local/share}/brogueCE"  # where you want user files to go

mkdir -p "$userdir"
cd "$userdir"
# note that we renamed the brogue binary from 'brogue' to 'brogue_binary'
# so that this script can be named 'brgoue'
exec "${APP_PREFIX}/bin/brogue_binary" "$@"

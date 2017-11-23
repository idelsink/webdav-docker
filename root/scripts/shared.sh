#!/usr/bin/env sh

# Shared functions and tools

# Replace $1 with $2 in $3
replaceInFile() {
    match=${1}
    shift
    replace=${1}
    shift
    sed -i "s@${match}@${replace}@g" "${@}"
}

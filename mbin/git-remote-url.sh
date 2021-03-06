#!/bin/sh

dirs=.

if [ "$1" != "" ]; then
    dirs="$@"
fi

pwd=$(pwd)
for dir in $dirs; do
    cd "$dir" >/dev/null 2>/dev/null
    printf "$dir: "
    git remote -v 2>/dev/null | grep push | awk '{print $2}' | grep -v fatal
    cd "$pwd" >/dev/null 2>/dev/null
done

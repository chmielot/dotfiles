#!/usr/bin/env bash

LOCATIONS_DIR="locations/"

# Copy files and directories
for dir in $(cd $LOCATIONS_DIR && find . -type d -or -type f); do
    [ "$dir" == "." ] && continue
    mkdir -p "$HOME/$dir"
done

# Proxy to some working version of realpath
function realpath {
    if which grealpath > /dev/null; then
        echo $(grealpath $1)
    else
        echo $1
    fi
}

# Copy symlinks
for link in $(cd $LOCATIONS_DIR && find . -type l); do
    target=$(readlink "$LOCATIONS_DIR/$link")
    link_base=$(dirname "$LOCATIONS_DIR/$link")

    from="$HOME/$link"
    to=$(realpath "$link_base/$target")

    # Check if the symlink already exists ...
    if [ -h $from ]; then
        old_from=$(readlink $from)

        # ... if the destination is the same, ignore it.
        if [ "$old_from" == "$to" ]; then
            continue
        # ... otherwise rename it to "XX.backup".
        else
            mv "$from" "$from.backup"
        fi
    fi
    ln -s "$to" "$from"
done

exit 0

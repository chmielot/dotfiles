#!/usr/bin/env bash

IFS=$'\n'
for to in $(find "$HOME/Applications" -type l); do
    from="/Applications/${to##*/Applications/}"

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

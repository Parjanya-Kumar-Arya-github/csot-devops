#!/bin/bash

file="${TODO_FILE:-$HOME/.todo}"

touch "$file"

subcommand="${1:-list}"

case "$subcommand" in
    add)
        shift
        echo "[ ] $*" >> "$file"
        ;;
    list)
        awk '{ printf "%d: %s\n", NR, $0 }' "$file"
        ;;
    done)
        sed -i "$2"'s/^\[ \]/[x]/' "$file"
        ;;
    remove)
        sed -i "$2"'d' "$file"
        ;;
    *)
        echo "Usage: $0 {add|list|done|remove} [args...]" >&2
        exit 2
        ;;
esac
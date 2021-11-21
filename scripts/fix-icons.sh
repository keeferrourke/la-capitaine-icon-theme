#!/bin/bash

# This script is a simple tool to help new contributors to the La Capitaine
# icon project.  To use this script, first stage new icons with 'git add
# path/to/icon.svg'.
#
# Then, run the script to clean up each staged icon. Optional interactive and
# open-each modes will allow you to inspect and possibly restore the modified
# files. If specified, files will be opened with the system file viewer for
# visual inspection.

positional_args=()
interactive=0
open_each=0

while [ $# -gt 0 ]; do
    key="$1"
    case $key in
        -i|--interactive)
            interactive=1
            shift
            ;;
        -o|--open-each)
            open_each=1
            shift
            ;;
        *)
            positional_args+=("$1")
            shift
            ;;
    esac
done;

staged=($(git --no-pager diff --cached --name-only | grep -E "*.svg"))
if [ -z ${#distro[@]} ]; then
    echo "No SVG files are staged."
    exit 0
fi

if ! command -v svgcleaner > /dev/null; then
    echo "Please install svgcleaner."
    exit 1
fi
if ! command -v tidy > /dev/null; then
    echo "Please install tidy."
    exit 1
fi

for file in ${staged[@]}; do
    echo "Fixing $file..."
    cp "$file" "$file.bak.svg"
    svgcleaner "$file" "$file"
    tidy -q -xml -indent -wrap 0 -m "$file"
    if [ $open_each -eq 1 ]; then
        xdg-open "$file"
        xdg-open "$file.bak.svg"
    fi
    if [ $interactive  -eq 1 ]; then
        read -p "Do these files look ok? [y/N] " yn
        case $yn in
            y*Y*)
                ;;
            *)
                echo "Ok. Restoring backup."
                mv "$file.bak.svg" "$file"
                break;
                ;;
        esac
    fi
    git add "$file"
    rm "$file.bak.svg"
done;

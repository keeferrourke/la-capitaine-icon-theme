#!/bin/bash

wd=$PWD
if [ $# -ge 1 ]; then
    wd=$1
    echo 'set wd'
fi

function do_check() {
    # Exits with status 1 if check fails.
    # $1 = the path of the file to check
    #
    file="$1"
    fmt_cmd="tidy -q -xml -indent -wrap 0 -m '$file'"
    tidy -q -xml -indent -wrap 0 "$file" > "$file.fmt"

    pass=1
    if ! diff "$file" "$file.fmt" 1>&2; then
        >&2 echo
        >&2 echo "File '$file' is not formatted."
        >&2 echo "Run $fmt_cmd to fix."
        pass=0
    fi
    rm "$file.fmt"
    if [ $pass -eq 0 ]; then
        exit 1
    fi
}

function check_all() {
    files=($@)
    for file in ${files[@]}; do
        do_check $file
    done;
}

if [ -z $git_sha ]; then
    dirs=(actions apps animations devices emblems emotes mimetypes panel places status)

    for dir in ${dirs[@]}; do
        check_all $(find "$wd/$dir" -name "*.svg")
    done;
else
    files=$(git diff-tree --no-commit-id --name-only -r "$git_sha" | grep -E "*.svg")
    check_all $files
fi

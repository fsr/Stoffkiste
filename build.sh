#!/bin/bash

set -euo pipefail

declare -a FILES

if [[ $# < 1 || $1 = "--help" ]]; then
    echo "Usage: $0 <command>"
    echo "Available commands are:"
    echo "    build:                  just builds all .tex files"
    echo "    deploy <repo> <branch>: builds all .tex files an deploys to the given repository"
    echo "    clean:                  deletes all build artefacts"
    exit 1
fi


if [[ "$1" = "build" || "$1" = "deploy" ]]; then
    # building PDFs
    echo "building PDFs"
    find .  -name "*.tex" -type f -print -execdir latexmk -halt-on-error -pdf {} \;


    # building index file
    WS="        "
    BODY="$(find . -name "*.pdf" -type f -printf "%h\n" | sort -u | while read DIR; do
        pushd "$DIR" > /dev/null
        echo "$WS<h2>$(echo $DIR | cut -d'/' -f 2-)</h2>"
        echo "$WS<ul>"
        for PDF in *.pdf; do
            echo "$WS    <li><a href='$DIR/$PDF'>$PDF</a></li>"
        done
        echo "$WS</ul>"
        popd > /dev/null
    done)"
    echo "</html>" >> index.htm

    cat > index.htm <<EOF
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Stoffkiste</title>
    </head>
    <body>
    <h1>Stoffkiste</h1>
    $BODY
    </body>
</html>
EOF
fi

if [[ "$1" = "deploy" ]]; then
    if [[ $# != 3 ]]; then
        echo "Error: you have to specify the target repository. See $0 --help ." >&2
        exit 2
    fi
    DEPLOY_REPOSITORY=$2
    DEPLOY_BRANCH=$3
    echo "deploying to $DEPLOY_REPOSITORY:$DEPLOY_BRANCH"
    find .  -name "*.pdf" -type f -print -exec git add {} \;
    CURR_COMMIT=$(git rev-parse HEAD)
    git add index.htm
    git commit -m "built PDFs and index"
    git push -f $DEPLOY_REPOSITORY HEAD:$DEPLOY_BRANCH
    git reset $CURR_COMMIT
fi

if [[ "$1" = "clean" || "$1" = "deploy" ]]; then
    echo "deleting PDF artefacts"
    find .  -name "*.tex" -type f -print -execdir latexmk -quiet -C -pdf {} \;
    echo "deleting index file"
    rm index.htm 2> /dev/null ||:
fi
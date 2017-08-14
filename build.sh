#!/bin/bash

find . -not -path './.*' -type d | while read DIR; do
    pushd "$DIR" > /dev/null
    ls *.tex 2>/dev/null | while read SOURCE; do
        echo "building $DIR/$SOURCE"
        latexmk -quiet -halt-on-error -pdf "$SOURCE" && echo "finished" || echo "failed"
    done
    popd > /dev/null
done

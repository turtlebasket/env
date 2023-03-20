#!/bin/bash

# PROJECT DIR PRUNING SCRIPT


printf "%-40s%-20s%s\n" 'Clean git, oldest to newest' 'Date Modified' 'Size'
printf "%-40s%-20s%s\n" '===========================' '=============' '===='

for pdir in $(ls -r1dt */); do
    cd $pdir
    git status 2> /dev/null | grep 'nothing to commit, working tree clean' 1> /dev/null
    if [ "$?" == "0" ]; then
        dirModDate=$(date -r . +"%m/%d/%Y")
        dirSize=$(du -sh . | awk '{print $1}')
        printf "%-40s\e[32m%-20s\e[0m%s\n" $pdir $dirModDate $dirSize
    fi
    cd ..
done


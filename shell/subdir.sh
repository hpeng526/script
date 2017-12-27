#!/bin/bash

cur=$(pwd)

for subdir in $(ls ${cur})
do
    if test -d ${subdir};then
        cd ${subdir}
        git remote set-url origin $(git remote get-url origin|sed 's;http://;https://;')
        # echo $(ls)
        cd ..
    fi
done
#!/usr/bin/env zsh

## Get logged in user
loggedInUser=$(stat -f%Su /dev/console)

## Get logged in UID
loggedInUID=$(id -u "$loggedInUser")

## Run read command as logged in user
setIdleTime=$(ls -l "/Users/"$loggedInUser"/Library/Mobile Documents" | grep "com~apple~CloudDocs" | wc -l | sed 's/ //g' )

echo "$setIdleTime"

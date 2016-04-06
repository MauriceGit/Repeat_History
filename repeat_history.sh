#!/bin/bash

searchWord="$1"

if [[ $# -gt 1 ]]
then
    size="$2"
else
    size=20
fi

OLDIFS=$IFS

IFS='
'

output=$(cat $HISTFILE | grep "$searchWord" | grep -v "rh " | tail -n $size)

outputArray=($output)

IFS=$OLDIFS

# Print all possible commands
for ((i=0;i<${#outputArray[@]};i++))
do
    echo -e "$i:\t${outputArray[$i]}"
done

if [[ ${#outputArray[@]} -gt 0 ]]
then
    read input

    isNumber=$(echo "$input" | egrep '^[0-9]+$')

    # Check on validity
    if [[ -z "$isNumber" || "$input" -ge $size ]]
    then
        echo "input is not valid."
    else
        command=${outputArray[$input]}
        # execute command
        eval $command
        # custom append the executed command to the history
        history -s "$command"
    fi
fi


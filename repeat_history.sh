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

output=$(cat $HISTFILE | /bin/grep "$searchWord" | /bin/grep -v "rh " | uniq | tail -n $size)

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

    isNumber=$(echo "$input" | /bin/egrep '^[0-9]+$')

    # Check on validity
    if [[ -z "$isNumber" || "$input" -ge $size ]]
    then
        echo "input is not valid."
    else
        command=${outputArray[$input]}
        # custom append the executed command to the history
        history -s "$command"
        # execute command
        eval $command
    fi
fi


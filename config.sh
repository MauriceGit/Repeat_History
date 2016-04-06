#!/bin/bash

aliasName="rh"

if [[ $# -gt 0 ]]
then
    aliasName="$1"
fi

cat ~/.bashrc | grep -v "alias $aliasName=" > ~/.bashrc_tmp

# we need to make the history available for the command...
# Didn't find a way around history -a...
echo "alias $aliasName='history -a && . $PWD/repeat_history.sh'" >> ~/.bashrc_tmp
mv ~/.bashrc_tmp ~/.bashrc



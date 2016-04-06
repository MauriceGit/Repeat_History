# Repeat History

The script is meant to be a small addition for the linux bash.

It makes the bash history more easily accessible than going through Cmd+R manually, by listing a number (default 20) of last
commands. You can then just type the number of the command you would like to execute
from the list.

It especially helps to get an overview of slightly different commands and makes it easier to select the right one.

## Install

Go to the cloned files and execute config.sh. When given no parameters, the script is given the alias **rh** (for: repeat history).

Otherwise you can specify the alias name as first argument to the config.sh script.

- ./config.sh [alias_name]

This appends the appropriate alias to your ~/.bashrc file.

You can alternately add it manually to your ~/.bashrc file (replace $PATH_TO_SCRIPT with the path to repeat_history.sh):

**alias rh='history -a && . $PATH_TO_SCRIPT/repeat_history.sh'"**

## Usage

**rh [searchWord] [NumberOfMaxOptions]**

This command is now system wide accessible by typing **rh** into the terminal.

The first argument to **rh** is the search word for the command, you want to execute. If no argument is given, the last 20 executed commands are shown.

The second argument to **rh** changes the number of options to show.

## Todo

- Remove duplicates from the list so it is not spammed with the same command.
- Add usage and help output.





#!/bin/bash
# Find string in files of given directory (recursively)

printf '\n'
echo "This utility will let you search for a string contained in a file within a directory of your choosing."
echo "You may then edit or view the file with a tool of your choosing."
printf '\n'

read -p "Please enter string that you would like to search for: " text
read -p "Please enter directory that you would like to search in: " directory

file=$(find $directory -type f -exec grep -qe "$text" {} \; -exec bash -c 'select f; do echo $f; break; done' find-sh {} +;)

if [ -z "$file" ]; then
    echo "No matches found."
else
    printf '\n'
    echo "Please select a text manipulation tool:"
    tools=("nano" "less" "vim" "gedit" "geany" "faketool" "quit")
    select tool in "${tools[@]}"
    do
        case $tool in
            "quit")
                break
                ;;
            *)
				#nested if-then statement starts
				if [ -x "$(command -v $tool )" ]; then
					$tool $file
					
				else
					#commands
					echo "This text tool does not appear to be installed, or cannot be run."
					echo "Please install is using the package management system for your distribution, or run the script again using a different editor."
				fi
        esac
    done
fi

#!/bin/bash

#
#(Note: this script uses the g++ compiler)
#this is an script meant to make life easier when building and executing c programs.
#this script will do that for you to save you from doing:
#    `sudo gcc file.c`/`gcc file.c`
#    `./a.out`
#
#Recomendations:
#    + give 775 permissions
#    + put it into either /usr/local/bin or /usr/bin
#    + give it a short name, like 'comp' (Note: if the script is on /usr/local/bin it won't need the .sh extension)
#

script_help=$(cat << EOF

usage #1: $0 [-s] [file]
usage #2: $0 [file]
Options:
    -h, --help      Show this message
    -s, --sudo      This will execute "sudo" with gcc
EOF
)

execution() {
if [[ $? == 0 ]]; then
    ./a.out
else
    echo "Unknown error..."
    echo "Execute $0 --help for information about this script's usage"
    echo ""
fi
}

if [ -n "$1" ]; then
    case "$1" in
        -s|--sudo)
            code_name=$2
            `sudo gcc $2`
            execution
            shift
            exit
            ;;
        -h|--help)
            echo "$script_help"
            ;;
        *)
            code_name=$1
            `gcc $1`
            execution
            ;;
    esac
    shift
else
    echo "ERROR: you must give at least one argument for this script to work"
    echo "execute $0 --help for a more indeed explanation"
    echo ""
fi


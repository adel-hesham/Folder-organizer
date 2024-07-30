#!/usr/bin/bash
#############################################
# Description: Files organizer
#   Input: path 
#   Output: Make folders with the name of the extensions exist in directory
#           and organize every extension in its folder
#   Author: eng/ adel elnimr
#############################################

############################################################
#   Verbs
#   1. Take the path by positional variable
#   2. Iterate on the directory to get the files
#   3. Extract the extension and file name from every file
#   4. Check if folders exist 
#   5. Make folders 
#   6. Move files into folders 
############################################################

############################################################
#   Functions ------> Verbs
function make_directory() {
    mkdir -p "$1/$2"
    return 0
}

function move_files() {
    mv "$1/$2" "$1/$3"
}

function organize_files() {
    local DIR="$1"
    local EXT="$2"
    local FILE="$3"

    case "$EXT" in
        pdf|PDF|jpg|JPG|txt|TXT)
            ;;
        *)
            EXT="misc"
            ;;
    esac

    if [ ! -d "$DIR/$EXT" ]; then
        make_directory "$DIR" "$EXT"
    fi

    move_files "$DIR" "$FILE" "$EXT"
}

################################################################################

################################################################################
#   Main function ------> Logic
function main() {
    local DIR="$1"
    for FILE_PATH in "$DIR"/*; do
        if [ -f "$FILE_PATH" ]; then
            FILENAME=$(basename "$FILE_PATH")
            EXTENSION=$(echo "$FILENAME" | rev | cut -d. -f1 | rev)
            organize_files "$DIR" "$EXTENSION" "$FILENAME"
        fi
    done
    echo "done"
}
##################################################################################
##################################################################################
#   Call main function
main "$1"
##################################################################################




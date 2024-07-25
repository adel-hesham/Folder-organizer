#!/usr/bin/bash
#############################################
# Describtion: Files organizer
#   Input: path 
#   Output: Make folders with the name of the extentions exist in directory
#           and organize every extention in its folder
#   Author: eng/ adel elnimr
#############################################


############################################################
#   Verbs
#   1.Take the path by positional variable
#   2.iterate on the directory to get the files
#   3.extract the extention and file name from every file
#   4.check if foldrs is exist 
#   5.make folders 
#   6.move files into folders 
############################################################
############################################################
#   Functions ------> Verbs
function make_directory () {
    mkdir "$1"/"$2"
    return 0
}

function move_files () {
    mv "$1"/"$2" "$1"/"$3"
}
function check_for_pdf () {
   if [[ "$2" == "pdf" ]]; then
        if [ -d "$1/pdf" ]; then
        move_files "$1" , "$3" , "pdf"
        elif [ -d "$1/PDF" ]; then
        move_files "$1" , "$3" , "PDF"
        else
        make_directory "$1" , "pdf"
        move_files "$1" , "$3" , "pdf"
        fi              
    fi
}
function check_for_jpg () {
    if [[ "$2" == "jpg" ]]; then
        if [ -d "$1/jpg" ]; then
        move_files "$1" , "$3" , "jpg"
        elif [ -d "$1/JPG" ]; then
        move_files "$1" , "$3" , "JPG"
        else
        make_directory "$1" , "jpg"
        move_files "$1" , "$3" , "jpg"
        fi              
    fi
}
function check_for_txt () {
    if [[ "$2" == "txt" ]]; then
        if [ -d "$1/txt" ]; then
        move_files "$1" , "$3" , "txt"
        elif [ -d "$1/TXT" ]; then
        move_files "$1" , "$3" , "TXT"
        else
        make_directory "$1" , "txt"
        move_files "$1" , "$3" , "txt"
        fi              
    fi
}
function check_for_miscellaneous () {
    if [[ "$2" != "txt" || "$2" != "jpg"  || "$2" != "pdf" ]]; then 
        if [ -f "$1/$3" ];then
            if [ -d "$1/misc" ]; then
            move_files "$1" , "$3" , "misc"
            elif [ -d "$1/MISC" ]; then
            move_files "$1" , "$3" , "MISC"
            else
            make_directory "$1" , "misc"
            move_files "$1" , "$3" , "misc"
            fi
        fi
    fi
}
################################################################################

################################################################################
#   Main function ------>Logic
function main () 
{
    for directory in "$1/"*; do
        EXTENTION=$(basename "${directory}" | rev | cut -d. -f1 | rev)
        FILENAME=$(basename "${directory}")

        check_for_pdf "$1" , "${EXTENTION}" , "${FILENAME}"
        check_for_txt "$1" , "${EXTENTION}" , "${FILENAME}"
        check_for_jpg "$1" , "${EXTENTION}" , "${FILENAME}"
        check_for_miscellaneous "$1" , "${EXTENTION}" , "${FILENAME}"
        echo "done"
    done
    echo "done"
}
##################################################################################
##################################################################################
#   call main function
main "$1"
##################################################################################




#!/usr/bin/bash
#############################################
# Describtion: File organizer
#   Input: path 
#   Output: Make folders with the name of the extentions exist in directory
#           and organize every extention in its folder
#   Author: adel
#############################################


#############################################
#   1.Take the path by positional variable
#   2.iterate on the directory to get the files
#   3.extract the extention from every file
#   4.check if foldrs is exist 
#   5.make folders 
#   6.move files into folders 
#############################################
function iterate_dir () 
{
    for directory in "$1/"*; do
        EXTENTION=$(basename "${directory}" | rev | cut -d. -f1 | rev)
        FILENAME=$(basename "${directory}")
        if [[ "${EXTENTION}" == "pdf" ]]; then
            if [ -d "$1/pdf" ]; then
            mv $1/"${FILENAME}" $1/pdf
            elif [ -d "$1/PDF" ]; then
            mv $1/"${FILENAME}" $1/PDF
            else
            mkdir $1/pdf
            mv $1/"${FILENAME}" $1/pdf
            fi              
        fi
        if [[ "${EXTENTION}" == "txt" ]]; then
            if [ -d "$1/txt" ]; then
            mv $1/"${FILENAME}" $1/txt
            elif [ -d "$1/TXT" ]; then
            mv $1/"${FILENAME}" $1/TXT
            else
            mkdir $1/txt
            mv $1/"${FILENAME}" $1/txt
            fi            
        fi
        if [[ "${EXTENTION}" == "jpg" ]]; then
            if [ -d "$1/jpg" ]; then
            mv $1/"${FILENAME}" $1/jpg
            elif [ -d "$1/JPG" ]; then
            mv $1/"${FILENAME}" $1/JPG
            else
            mkdir $1/jpg
            mv $1/"${FILENAME}" $1/jpg
            fi            
        fi
        if [[ "${EXTENTION}" != "txt" || "${EXTENTION}" != "jpg"  || "${EXTENTION}" != "pdf" ]]; then
                if [[ "${FILENAME}" != "jpg" ||  "${FILENAME}" != "JPG" || "${FILENAME}" != "txt" || "${FILENAME}" != "pdf" || "${FILENAME}" != "PDF" ]]; then    
                    if [ -d "$1/misc" ]; then
                    mv $1/"${FILENAME}" $1/misc
                    elif [ -d "$1/MISC" ]; then
                    mv $1/"${FILENAME}" $1/MISC
                    else
                    mkdir $1/misc
                    mv $1/"${FILENAME}" $1/misc
                fi            
            fi
        fi
    done
    
}

iterate_dir "$1"


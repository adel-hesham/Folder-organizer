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
    
    # Make sure path ends with /
    for directory in "/home/"*; do
        if [[ -d "${directory}" && ! -L "${directory}" ]]; then
            echo "${directory}"
            echo "directory exist"

        fi
    done
}

iterate_dir 
 

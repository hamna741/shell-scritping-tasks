#!/bin/bash

read -p "Enter keyword: " keyword
read -p "Enter directory path: " dir_path

for file in $(find $dir_path -type f -name "*.txt")
do
    # check if keyword is present in file
    if grep -q $keyword $file
    then
        
       
        grep -Hn $keyword $file |cut -d ":" -f1,2| tee -a output.txt
    fi
done


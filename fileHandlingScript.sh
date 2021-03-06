#!/bin/bash

#Copyright © 2014 Sean DeBellis

debug=true

zipFile=$1
if $debug
then
    echo $zipFile
fi

unzippedFile=${zipFile%.zip}
unzip $zipFile -d $unzippedFile
cd $unzippedFile
rm ./*.html
pwd

currentStudent=""
currentFolder=""
for file in *
do
    fileName=$(python ./../parseName.py $file) #parses out students name 
    #echo fileName: $fileName                      # first then last name
    #echo file: $file
    newFileName=$(echo "$file" | tr -d ' ')

    if [ "$currentFolder" != "$fileName" ]
    then
        currentStudent=$(python ./../lastNameFirst.py $fileName) #swaps first and last name
        mkdir $currentStudent
        mv "$file" ./$currentStudent/${newFileName##*-}
        currentFolder=$fileName
        cp ../makefile ./$currentStudent
    else
        mv "$file" ./$currentStudent/${newFileName##*-} #moves file to proper directory and cuts
    fi                                                  #off d2l added character of file name.
done

chmod 755 ./*

#run make on all folders
for file in ./*
do
    cd $file
    touch grader_notes.txt
    make > log.txt 2>&1
    cd ..
done

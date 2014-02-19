#/bin/bash
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
    fileName=$(python ./../gradingScript.py $file)
    #echo fileName: $fileName
    #echo file: $file
    newFileName=$(echo "$file" | tr -d ' ')

    if [ "$currentFolder" != "$fileName" ]
    then
        currentStudent=$(python ./../lastNameFirst.py $fileName)
        mkdir $currentStudent
        mv "$file" ./$currentStudent/$newFileName
        currentFolder=$fileName
        cp ../makefile ./$currentStudent
    else
        mv "$file" ./$currentStudent/$newFileName
    fi
done

#run make on all folders
for file in *
do
    cd $file
    touch grader_notes.txt
    make > log.txt 2>&1
    cd ..
done

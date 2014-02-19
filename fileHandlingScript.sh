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

currentFolder=""
for file in *
do
    fileName=$(python ./../gradingScript.py $file)
    #echo fileName: $fileName
    #echo file: $file
    newFileName=$(echo "$file" | tr -d ' ')

    if [ "$currentFolder" != "$fileName" ]
    then
        mkdir $fileName
        mv "$file" ./$fileName/$newFileName
        currentFolder=$fileName
        cp ../makefile ./$currentFolder
    else
        mv "$file" ./$currentFolder/$newFileName
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

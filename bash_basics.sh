#!/bin/bash 
# Run Command - chmod u+x ./bash_basics.sh && ./bash_basics.sh
# REF1 : https://wiki.bash-hackers.org/syntax/pe
# REF2 : https://devhints.io/bash
clear
echo "Hello,$USER" | tr [:lower:] [:upper:]
echo "Today's date is `date`, this is week `date +"%V"`."
echo "This is `uname -s` running on a `uname -m` processor."

#Set –e is used within the Bash to stop execution instantly as a query exits while having a non-zero status. This function is also used when you need to know the error location in the running code.
#set -e

# STRING_TUT, INT_TUT, FLOAT_TUT, FOR_TUT, WHILE_TUT, FILE_TUT
T_TYPE="STRING_TUT"

if echo $T_TYPE| grep "_TUT"
then
    if [[ $T_TYPE == "INT_TUT" ]];
    then
        echo "int tutorial start"
        echo "enter your age : " 
        read AGE
        if [[ $AGE =~ ^[0-9]{1,8}$ ]]
        then
            if [[ ($AGE -eq 18 || $AGE -gt 18) && ($AGE -lt 100) ]]; 
            then 
                echo "your are eligible to drinks"
            elif [[ $AGE -lt 18 ]];
            then
                echo "sorry, your age is not in age criteria"
            else
                echo "AGE : ${AGE}" 
            fi           
        else
            echo "Input entered is wrong"
        fi 
        echo "int tutorial end"
    fi

    if [[ $T_TYPE == "STRING_TUT" ]];
    then
        echo "string tutorial start"        
        echo "enter your file location path : " 
        read FILE_LOCATION

        if [[ -n "$FILE_LOCATION" && -e "$FILE_LOCATION" ]]; 
        then            
            if [ -f "$FILE_LOCATION" ]; then
                echo "$FILE is a regular file"
            fi 

            basePath=${FILE_LOCATION#}
            fileName=${FILE_LOCATION##}
            fileExtention=${FILE_LOCATION##.}

            echo ${basePath}
            echo ${fileName}
            echo ${FILE_LOCATION~}

        elif [[ -n "$FILE_LOCATION" && -e "$FILE_LOCATION" ]]; 
        then
            if [ -d "$FILE_LOCATION" ]; then
                echo "$FILE is a directory"
            fi
        elif [[ -z "$FILE_LOCATION" ]]; 
        then
            echo "No File Location Provided Or Exists"
        fi

        echo "string tutorial end"
    fi
else
    echo "no a valid selection"
fi

echo "${PWD}"
LOGFILE="${PWD}/logs.txt"
echo "${LOGFILE}"
if [[ -e $LOGFILE ]];
then
    #files=(`cat ${LOGFILE}`)

    # declaring array list and index iterator
    declare -a files=()

    fileCount=0
    # cat "${LOGFILE}" | while read line; 
    # do        
    #     fileCount=${#files[@]}
    #     files[fileCount]=${line}

    #     fileCount=$((fileCount+1))
    #     #((fileCount=fileCount+1))
    #     #let "fileCount=fileCount+1"
    # done
   
    fileCount=0
    while IFS= read -r line || [[ -n "$line" ]]; do
        echo "file - $line inserting"

        fileCount=${#files[@]}
        files[fileCount]=${line}

        fileCount=$((fileCount+1))
    done < "${LOGFILE}"
    
    ## ARRAY LENGTH
    #echo ${#files[@]}
    ## GET ALL ELEMENT OF ARRAY
    #echo ${files[@]}

    for i in ${files[@]};
    do
        if [[ -e "$i" && -f "$i" ]]; then        
            echo "File \"$i\" exists"            
            truncate -s 0 "${i}"
            #echo "" > "${i}"
            #rm "${i}"
        fi        
    done
else
    echo "no exists"
fi

IN="bla@some.com;john@home.com"
mails=$(echo $IN | tr ";" "\n")
for addr in $mails
do
    echo "> [$addr]"
done

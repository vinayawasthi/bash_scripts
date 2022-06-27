#!/bin/bash
# Run Command - chmod u+x ./bash_basics.sh && ./bash_basics.sh
# REF1 : https://wiki.bash-hackers.org/syntax/pe
# REF2 : https://devhints.io/bash
clear
echo "Hello,$USER" | tr [:lower:] [:upper:]
echo "Today's date is $(date), this is week $(date +"%V")."
echo "This is $(uname -s) running on a $(uname -m) processor."

#Set –e is used within the Bash to stop execution instantly as a query exits while having a non-zero status. This function is also used when you need to know the error location in the running code.
#set -e

showTutorial() {
    T_TYPE=$1
    #echo "Selected - ${T_TYPE}"
    if echo "Selected - ${T_TYPE}" | grep "_TUT"; then
        if [[ $T_TYPE == "INT_TUT" ]]; then
            echo "int tutorial start"
            echo "enter your age : "
            read AGE
            if [[ $AGE =~ ^[0-9]{1,8}$ ]]; then
                if [[ ($AGE -eq 18 || $AGE -gt 18) && ($AGE -lt 100) ]]; then
                    echo "your are eligible to drinks"
                elif [[ $AGE -lt 18 ]]; then
                    echo "sorry, your age is not in age criteria"
                else
                    echo "AGE : ${AGE}"
                fi
            else
                echo "Input entered is wrong"
            fi
            echo "int tutorial end"
        fi

        if [[ $T_TYPE == "STRING_TUT" ]]; then
            echo "string tutorial start"
            echo "enter your file location path : "
            read FILE_LOCATION

            if [[ -z "$FILE_LOCATION" ]]; then
                echo "file location not provided"
            else
                fileName=${FILE_LOCATION##*/}

                basePath=${FILE_LOCATION/$fileName/""}
                basePath=${FILE_LOCATION%$fileName}

                fileExtention=${FILE_LOCATION##*.}

                echo ${basePath}
                echo ${fileName}
                echo ${fileExtention}

                if [[ -n "$FILE_LOCATION" && -e "$FILE_LOCATION" ]]; then
                    if [ -f "$FILE_LOCATION" ]; then
                        echo "${FILE_LOCATION | tr [:lower:]} is a regular file"
                    fi                    
                elif [[ -n "$FILE_LOCATION" && -e "$FILE_LOCATION" ]]; then
                    if [ -d "$FILE_LOCATION" ]; then
                        echo "$FILE is a directory"
                    fi
                else
                    echo "file doesn't exists"
                fi
            fi

            echo "string tutorial end"
        fi

        if [[ $T_TYPE == "FILE_TUT" ]]; then
            echo "current directoru - ${PWD}"
            LOGFILE="${PWD}/logs.txt"
            echo "log file location - ${LOGFILE}"
            if [[ -e $LOGFILE ]]; then
                #files=(`cat ${LOGFILE}`)

                # declaring array list and index iterator
                declare -a files=()

                fileCount=0
                while IFS= read -r line || [[ -n "$line" ]]; do
                    #echo "file - $line inserting"

                    fileCount=${#files[@]}
                    files[fileCount]=${line}
                    fileCount=$((fileCount + 1))
                done <"${LOGFILE}"

                ## array length
                #echo ${#files[@]}
                ## get all element from array
                #echo ${files[@]}

                for i in ${files[@]}; do
                    if [[ -e "$i" && -f "$i" ]]; then
                        echo "file \"$i\" exists"

                        truncate -s 0 "${i}"
                        echo "" >"${i}"
                        #rm "${i}"
                    fi
                done
            else
                echo "log file doesn't exist"
            fi
        fi

        if [[ $T_TYPE == "STRING_SPLIT_TUT" ]]; then
            IN="bla@some.com;john@home.com"
            mails=$(echo $IN | tr ";" "\n")
            for addr in $mails; do
                echo "> [$addr]"
            done
        fi
    else
        echo "no a valid selection"
    fi
}

# 0-EXIT
# 1-STRING_TUT
# 2-INT_TUT,
# 3-FILE_TUT

while [[ true ]]; do
    T_TYPE=""

    case $choice in
    0)
        exit 0
        #break
        ;;
    1)
        T_TYPE="STRING_TUT"
        ;;
    2)
        T_TYPE="INT_TUT"
        ;;
    3)
        T_TYPE="FILE_TUT"
        ;;
    4)
        T_TYPE="STRING_SPLIT_TUT"
        ;;

    esac

    if [[ -n $T_TYPE ]]; then
        showTutorial $T_TYPE
    fi


    echo ""
    echo "Enter your choice from below options : "
    echo $"
    0-EXIT
    1-STRING_TUT 
    2-INT_TUT 
    3-FILE_TUT 
    4-STRING_SPLIT_TUT
    "
    read choice
    clear
done

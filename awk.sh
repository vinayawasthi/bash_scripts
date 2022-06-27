#!/bin/bash
#awk options 'selection _criteria {action }' input-file > output-file
# -f program-file : Reads the AWK program source from the file 
#                   program-file, instead of from the 
#                   first command line argument.
# -F fs            : Use fs for the input field separator

# showing all lines
#awk '{print}' ./employee.txt
# finding lines which contains manager keyword
#awk '/*manager*/ {print}' employee.txt
# NR - Line Number, $0 - Whole Line, $1 .. Column Number stating from 1
awk -F " " '{print NR,$1,$4}' employee.txt 
# NF - stands for last field
awk -F " " '{print NR,$1,$NF}' employee.txt 
# Selecting line 3 and 6
awk 'NR==3, NR==6 {print NR,$0}' employee.txt 
# find max length of lines
awk '{ if (length($0) > max) max = length($0) } END { print max }' employee.txt
# END stand for show output at end
awk 'END { print NR }' employee.txt
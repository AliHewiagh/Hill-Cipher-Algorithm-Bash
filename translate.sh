#!/bin/bash



#---------- NUMBERS TO LETTERS
#----------------------------------------------
#-----------------------    Convert Numbers To Letters To Be Placed in matrix


function numbersToLetters {
local letters=( $@ )
for nu in "${letters[@]}"
do
echo -n $(numberToLetter $nu)
done
}


function numberToLetter {
LETTERS=({A..Z})
echo ${LETTERS[$1]}
}





#----------  LETTERS TO NUMBERS
#----------------------------------------------
#-----------------------    Convert Letters To Numbers To Be Placed in matrix



function letterToNumber {
local uppercase=$(echo $1 | tr '[a-z]' '[A-Z]')
local ascii=$(LC_CTYPE=C printf '%d' "'$uppercase")
let num=ascii-65
echo $num
}
function lettersToNumbers {
for nu in $(seq 1 ${#1})
do

echo -n $(letterToNumber ${1:$nu-1:1})" "

done
}

#----------------------------------------------





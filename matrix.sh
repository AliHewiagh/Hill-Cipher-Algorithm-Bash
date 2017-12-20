#!/bin/bash



#-------------------------> Function to get the detreminte and return the value
function getdet {

local MATRIX=("$@")
det=$(( ${MATRIX[0]} * ${MATRIX[3]} - ${MATRIX[2]} * ${MATRIX[1]} ))
echo "$det"
}





#-------------------------> Function to get the multiplication and return the value
function multiply {

local ARRAY=($@)
#Put the letters or numbers in the array(2 x 2)
ARRAY1=( ${ARRAY[0]} ${ARRAY[1]} ${ARRAY[2]} ${ARRAY[3]} )


#Start reading from index after key
COUNT=4
while [[ $COUNT -lt ${#ARRAY[@]} ]]
do
ARRAY2[$(( $COUNT - 4 ))]=${ARRAY[$COUNT]}
(( COUNT++ ))
done

COUNT=0
while [[ $COUNT -lt ${#ARRAY2[@]} ]]
do
RESULT[$COUNT]=$(( $(( ${ARRAY1[0]} * ${ARRAY2[$COUNT]} + ${ARRAY1[2]} * ${ARRAY2[(( $COUNT + 1 ))]} )) % 26 ))
RESULT[$(( $COUNT + 1 ))]=$(( $(( ${ARRAY1[1]} * ${ARRAY2[$COUNT]} + ${ARRAY1[3]} * ${ARRAY2[(( $COUNT + 1 ))]} )) % 26 ))
COUNT=$(( $COUNT + 2 ))
done
echo "${RESULT[@]}"

}



#-------------------------> Function to get the multiplication and return the value
function Checkmatrixinverse {
local DET=$1

if (( $DET != 0 ))
then
echo "1"
else
echo "0"
fi
}


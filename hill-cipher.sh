#!/bin/bash


#---------> Files Used
. matrix.sh
. mod.sh
. translate.sh
#-------------------



#-------------------------> Encryption


function hill_encrypt {

#spaces
K=${1// /}


#------------------------> Checking The Number of Letters of The Key
if [ ${#K} -lt 4 ];
then
echo "                     KEY MUST BE MORE THAN THREE CHARACTARSTIC  "
return
fi


#----------------------------------------





if [ ${#K} -gt 4 ];
then
# reduce the key to four letters
K=${K:0:4}
fi

#----------------------------------------

K=($(lettersToNumbers $K))


PLAINTEXT=${2// /}

det=$(getdet ${K[@]})



#----------------------------------------



if ! (( $(Checkmatrixinverse $det) ))
then
echo "          No Matrix Inverse For This Key"
return
fi


if ! (( $(Checkmodinverse $det) ))
then
echo "          No Modular Inverse For This Key"
return
fi


#----------------------------------------



if (( ${#PLAINTEXT} % 2 ))
then
PLAINTEXT+=X

fi




#------------------------------------ Called Function

P=($(lettersToNumbers "$PLAINTEXT"))



E=($(multiply ${K[@]} ${P[@]}))


echo $(numbersToLetters ${E[@]})

#----------------------------------------

}
#----------------- End of Encryption Function




#------------------------############################-----------------------------------





#-------------------------> Decryption
function hill_decrypt {

#------------------------> Checking The Number of Letters of The Key
key=${1// /}
if [ ${#key} -lt 4 ];
then
echo "                     KEY MUST BE MORE THAN THREE CHARACTARSTIC  "
return
fi

#----------------------------------------



if [ ${#key} -gt 4 ];
then
# reduce the key to four letters
key=${key:0:4}
fi


#----------------------------------------


# mapping and checking the ciphertext
key=($(lettersToNumbers $key))
ciphertext=${2// /}
ciphertext=($(lettersToNumbers $ciphertext))

#-----------------------------------------


if [ $((${#ciphertext[@]}%2)) -ne 0 ];
then
echo "         Chiper Text Must Be Even Number of Letters"
return
fi

#-----------------------------------------


det=$(getdet ${key[@]})
if ! (( $(Checkmatrixinverse $det) ))
then
echo "          No Matrix Inverse For This Key"
return
fi



if ! (( $(Checkmodinverse $det) ))
then
echo "          No Modular Inverse For This Key"
return
fi

# Calculate the inverse

det=$(mod $det 26)
det=$(frac_mod $det 26)

inverse=( \
$(mod $((${key[3]} * $det)) 26) \
$(mod $((-${key[1]} * $det)) 26) \
$(mod $((-${key[2]} * $det)) 26) \
$(mod $((${key[0]} * $det)) 26) \
)

plaintext=($(multiply ${inverse[@]} ${ciphertext[@]}))

echo $(numbersToLetters ${plaintext[@]})
}

#----------------- End of Decryption Function











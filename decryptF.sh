#!/bin/bash
. hill-cipher.sh
Decrypt(){

echo
echo

printf "                        WELCOME HILL CIPHER DECRYPTION\n\n"

echo

echo "Please input KEY: "
read k


echo


echo "Please input CIPHERTEXT: "
read cipherText
echo


echo "The Decrypted plaintext is : $(hill_decrypt $k $cipherText)"
echo


#-----------------------------------------------------------------------------
echo "To Exit enter n. To rerun enter y"
read again
if [ $again = y ]
then Decrypt
exit 0
else
clear
printf "Extiting Program.Thank you"
exit 0
fi
}
Decrypt

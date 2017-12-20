#!/bin/bash
. hill-cipher.sh



Encrypt(){

echo
echo
echo

printf "                     WELCOME HILL CIPHER ENCRYPTION\n\n"

echo
echo "Please input KEY:"
read k
echo
echo "Please input PLAINTEXT: "
read plain
echo
#key=$k

#plaintext=$plain


echo "The Encrypted ciphertext is : $(hill_encrypt $k $plain)"
echo



#-----------------------------------------------------------------------------
echo "To Exit enter n. To rerun enter y"
read again
if [ $again = y ]
then Encrypt
exit 0
else
clear
printf "Good Bye.Thank you"
exit 0
fi
}
Encrypt

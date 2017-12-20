#!/bin/bash
# mod, factors both negative and positive values


# Function To Deal with both Postive and Negative Values of the mod
function mod {
local a=$1
local b=$2
if [ $a -ge 0 ]; then # if positive values
while [ $a -ge $b ]; do
let a=a-b
done
else # negative values
while [ $a -le $b ] && [ $a -lt 0 ]; do
let a=a+b
done
fi
echo $a
}


#------------------------------------------



# Function Only Deal With Postive Value
function frac_mod {
local a=$1
local b=$2
local x=-1
local r=-1 # remainder
while [ $r -ne 1 ]; do
let x=x+2
let ax=a*x
r=$(mod $ax $b)
done
echo $x
}
function Checkmodinverse {
local DET=$1
if (( $DET % 2 && $DET % 13 ))
# 2 and 13 are not relatively prime to 26,
then
# and so has no modulo inverse
echo "1"
else
echo "0"
fi
}

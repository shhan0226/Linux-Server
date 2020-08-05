#! /bin/bash

EXITFILE=$(ls *.txt)
echo $EXITFILE


if [ -z "$EXITFILE" ] 
then
	echo "empty file"
else
	echo ""

fi

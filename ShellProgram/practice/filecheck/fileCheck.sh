#! /bin/bash

# testfile : test.txt
# backup file : test.txt.bak


if [ -f test.txt.bak ]
then
	echo "Backup file exixts..."
else
	cp test.txt test.txt.bak
	echo "Backup file created..."
	exit 0
fi



if [ -f test.txt ]
then
	if diff test.txt test.txt.bak 1> /dev/null 2>&1
	then
		echo "File check complete..."

	else
		echo "File changed.. "
		cp test.txt.back test.txt && echo "Backup restore..."
	fi
else
	echo "File has removed..."
	cp test.txt.bak test.txt && echo "backup restore..."

fi


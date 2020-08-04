#! /bin/bash



if [ -d /recycle ]
then
	:
else
	mkdir /recycle && echo "/recycle created ..."
fi


if [ $# -eq 1 ]
then
	if [ "$1" = "-l" ]
	then
		echo "/recycle file list"
		ls -l /recycle | sed '/_path$/d'

	else
		echo $1 /recycle
		pwd > /recycle/$1_path

	fi

elif [ $# -eq 2 ]
then 
	if [ "$1" = "-r" ]
	then
		if [ -f /recycle/$2 ]
		then
			RECOVERPATH=`cat /recycle/$2_path`
			mv /recycle/$2 $RECOVERPATH && echo "$2 file recovered ..."
		else
			echo "$2 file does not exists ..."
		fi
	
	else	
		echo "Usage:	./myrm.sh"
		echo "		./myrm.sh -l"
		echo "		./myrm.sh -r [file]"

	fi


else	
	echo "Usage:	./myrm.sh"
	echo "		./myrm.sh -l"
	echo "		./myrm.sh -r [file]"
fi

#! /bin/bash


if [ $# -ne 3 ]
then 
	echo " Please input 3 Character"
	exit 1
fi


echo -n "$1 $2 $3 = "

case $2 in
+) echo "$1 + $3" | bc ;;
-) echo "$1 - $3" | bc ;;
\*) echo "$1 * $3" | bc ;;
/) echo "scale=2;$1 / $3" | bc ;;
*) echo "Operator Missing"
esac

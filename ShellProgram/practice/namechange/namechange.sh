#! /bin/bash

echo -n "previous EXT: "
read EXTOLD
echo -n "new EXT: "
read EXTNEW

for FILENAME in `ls *.$EXTOLD`
do
#	mv FILENAME ${FILENAME%*$EXTOLD}$EXTNEW
	NAME=`echo $FILENAME | awk -F. '{print $1}'`
	mv $FILENAME $NAME.$EXTNEW && echo "$FILENAME" changed to $NAME.$EXTNEW
done

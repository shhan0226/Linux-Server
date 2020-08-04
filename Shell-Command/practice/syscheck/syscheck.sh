#! /bin/bash

while :
do
	FILENAME=log_`date '+%y%m%d%H%M%S'`.log
	echo "1. VMSTAT ==============================================" >> $FILENAME
	vmstat >> $FILENAME
	echo "2. ps -ef  ==============================================" >> $FILENAME
	ps -ef >> $FILENAME
	echo "3. df -h ==============================================" >> $FILENAME
	df -h >> $FILENAME
	

	sleep 10
done


#! /bin/bash

while : 
do

	DF=`df -h | awk '/\/$/{print $0}'`
	DSIZE=`echo $DF | awk '{print $2}'`
	DUSED=`echo $DF | awk '{print $3}'`
	DAVAIL=`echo $DF | awk '{print $4}'`
	DPERCENT=`echo $DF | awk '{print $5}' | sed 's/%//'`

	echo "Current State - SIZE:$DSIZE USED:$DUSED AVAILABLE:$DAVAIL %:$DPERCENT%"
	
	if [ $DPERCENT -gt 10 ]
	then
		echo "Disk used percentage is over 10%, now $DPERCENT% used"
	fi

	sleep 1
	
	
done

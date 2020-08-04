#! /bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: $0 [processname]"
	exit 1
fi


ps -e > /tmp/processlist

awk '{ print $1":"$4 }' /tmp/processlist | grep $1 > /tmp/processlist2

for PROCESSINFO in `cat /tmp/processlist2`
do
	PROCESSPID=`echo $PROCESSINFO | awk -F: '{ print $1 }'`
	PROCESSNAME=`echo $PROCESSINFO | awk -F: '{ print $2 }'`

	echo "Process PID : $PROCESSPID"
	echo "Process Name : $PROCESSNAME"
	echo -n "Select Kill/Terminate/Cancel(K/T/C) : "
	read ANSWER

	case $ANSWER in
		k|K) kill -9 $PROCESSPID; echo "Kill signal sent to $PROCESSINFO..." ;;
		t|T) kill -15 $PROCESSPID; echo "Term signal sent to $PROCESSINFO..." ;;
		*) echo "Cancel..." ;;
	esac
done

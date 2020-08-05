#! /bin/bash


for ((i=0; i<10; i++)) do
	useradd test$i
	echo "dkagh1." | passwd --stdin test$i
done



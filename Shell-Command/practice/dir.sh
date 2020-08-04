#! /bin/bash

for i in {1..5}
do
	mkdir dir$i && echo " dir create dir$i"
	for j in {1..5}
	do
		mkdir dir$i/subDir$j && echo -e "\t subdir$j create"
	done
	echo $i
done

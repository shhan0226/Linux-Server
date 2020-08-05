#! /bin/bash

echo -n "input 1:"
read n1

echo "input 2:"
read n2

echo -n "input 3:"
read n3

echo -n "$n1 $n2 $n3 = "

case $n2 in
+) echo "$n1 + $n3" | bc ;;
-) echo "$n1 - $n3" | bc ;;
\*) echo "$n1 * $n3" | bc ;;
/) echo "$n1 / $n3" | bc ;;
*) echo "Operator Missing"
esac

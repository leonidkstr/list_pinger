#!/bin/bash
#last 2 srings in input file should be commented like in example
STRFILE=$(wc -l < input.txt)
for (( counter = 1; counter <$STRFILE; counter++ ))
do
IPVAR=$(head -n $counter input.txt | tail -n 1)
HOSTVAR=$(nslookup $IPVAR | head -n 2 | tail -n 1)
echo $HOSTVAR >> output.txt
echo $(ping -c 1 $IPVAR | head -n 5 | tail -n 3) >> output.txt
done

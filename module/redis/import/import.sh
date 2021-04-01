#!/bin/bash

set -e

echo "" > /tmp/savesomething.txt
for line in `cat ./test.csv`
do
    echo "SADD my:import $line" >> /tmp/savesomething.txt
done


pName=$(dpkg -l | grep dos2unix)
if [ $? -eq 0 ]
then
    echo "dos2unix is already installed."
else
    echo "----------------------------begin installing dos2unix-----------"
    apt install dos2unix
    echo "----------------------------finish installing dos2unix-----------"
fi
unix2dos /tmp/savesomething.txt


cat /tmp/savesomething.txt | redis-cli -h '127.0.0.1' -p 6379 -a '' --pipe
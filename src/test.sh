#!/bin/sh
base=$(basename $1)
FILENAME=${base%%.*}


if [ $2 -eq 3 ]
then
    ./c- $1 -P -o testing.tm > testoutput.txt
    ./tm testing.tm < tm_commands.txt
elif [ $2 -eq 2 ]
then
    ./c- $1 -P -o $FILENAME.tm > testoutput.txt
    ./tm $FILENAME.tm < tm_commands.txt
elif [ $2 -eq 1 ]
then
    ./c- $1 -P >  testoutput.txt
    ./tm $FILENAME.tm < tm_commands.txt
else
    ./c- $1 -P > testoutput.txt
fi

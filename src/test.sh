#!/bin/sh
base=$(basename $1)
FILENAME=${base%%.*}

if [ $2 -eq 2 ]
then
	./c- $1 -P -o $FILENAME.tm > testoutput.txt
	./tm $FILENAME.tm < commands.txt
elif [ $2 -eq 1 ]
then
	./c- $1 -P >  testoutput.txt
	./tm fred.tm < commands.txt
else
	./c- $1 -P > testoutput.txt
fi

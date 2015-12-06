#!/bin/sh
base=$(basename $1)
FILENAME=${base%%.*}

if [ $2 -eq 2 ]
then
	./c- -P $1 -o $FILENAME.tm > testoutput.txt
	./tm $FILENAME.tm < commands.txt
elif [ $2 -eq 1 ]
then
	./c- -P $1 >  testoutput.txt
	./tm fred.tm < commands.txt
else
	./c- -P $1 > testoutput.txt
fi

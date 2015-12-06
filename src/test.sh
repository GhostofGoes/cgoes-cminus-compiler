#!/bin/sh
base=$(basename $2)
FILENAME=${base%%.*}

if [ $1 -eq 2 ]
then
	./c- -P $2 -o $FILENAME.tm > testoutput.txt
	./tm $FILENAME.tm < commands.txt
elif [ $1 -eq 1 ]
then
	./c- -P $2 >  testoutput.txt
	./tm fred.tm < commands.txt
else
	./c- -P $2 > testoutput.txt
fi

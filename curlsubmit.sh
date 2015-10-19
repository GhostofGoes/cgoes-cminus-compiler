#!/bin/sh
name=$1
ass=$2
file=$3
 
# adjust the next line for class and semester
curl -F student=$name -F assignment="CS445 S15 Assignment $ass" -F "submittedfile=@$file" "http://ec2-54-200-16-181.us-west-2.compute.amazonaws.com/cgi-bin/fileCapture.py"

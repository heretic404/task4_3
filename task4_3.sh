#!/bin/bash
ARGS=2


#Arguments check stage

#Check number of arguments passed
if [ "$#" -ne 1 ]; then
    echo "error: Illegal number of parameters" >&2;
    exit 1
fi
#Verifying given arguments
if [ -z "$1" ] || [ -z "$2" ] 
  then
    echo "You need to specify a path to the folder which you want to backup and number of backups" >&2; 
    exit 1
fi
#Checing if first argument is a directory
if ! [[ -d $1 ]]; then
    echo "error: $1 is a not a directory" >&2; 
    exit 2
fi
#Checing if second argument is a number
re='^[0-9]+$'
if ! [[ $2 =~ $re ]] ; then
   echo "error: $2 Not a number" >&2; 
   exit 2
fi

#

echo "$1"
echo "$2"

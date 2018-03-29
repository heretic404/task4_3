#!/bin/bash
ARGS=2

#Verifying given arguments
if [ -z "$1" ] || [ -z "$2" ] 
  then
    echo "No argument supplied"
    exit 1
fi

echo "$1"
echo "$2"

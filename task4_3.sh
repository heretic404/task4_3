#!/bin/bash
ARGS=2

#Backup settings
bdir="/tmp/backups/"
#Checking if backup dir exsists
if [ ! -d "${bdir}" ]; then
  mkdir "${bdir}"
fi


#Arguments check stage

#Check number of arguments passed
if [ "$#" -ne 2 ]; then
    echo "error: Illegal number of parameters" >&2;
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
   exit 3
fi

#Bacup stage


#Archive settings
srcdir="${1}"
bnum="$2"
bname=$(echo "${1}" | sed -r 's/[/]+/-/g' | sed 's/^-//')
filename=${bname}-$(date '+%Y-%m-%d-%H%M%S').tar.gz

#Creating bacup file
tar --create --gzip --file="$bdir$filename" "${srcdir}" 2> /dev/null

#Checking bacup number and delete old ones
find "$bdir" -name "${bname}*" -type f -printf "${bdir}%P\n"| sort -n | head -n -"$2" | sed "s/.*/\"&\"/"| xargs rm -f

exit 0

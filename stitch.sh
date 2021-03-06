#!/bin/bash

if [ $# -ne 2 ];
    then echo -e "\nUsage: '$0 <path to mp4 clips> <name of finalized video>'\n"
    exit 1
fi

cd $1
readlink -f *.MP4 > files.txt
sed -i -e 's/^/file /' files.txt
ffmpeg -safe 0 -f concat -i $1/files.txt -c copy $2

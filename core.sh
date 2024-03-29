#!/bin/bash
# jq needed for JSON processing, requires to be installed over "sudo apt install jq" for example
broadcasters=$(curl https://livepeer.live/api/broadcaster | jq -r '.[].address')
for broadcaster in $broadcasters; do
   URL="$broadcaster/P360p30fps16x9.m3u8"
   MD5=$(echo $URL | md5sum  | awk {'print $1'})
   curl -u '[FLUSSONIC-LOGIN]:[FLUSSONIC-PASSWORD]' http://[FLUSSONIC-HOSTNAME]/flussonic/api/config/stream_create -d "ondemand $MD5 { url $URL; }"
done

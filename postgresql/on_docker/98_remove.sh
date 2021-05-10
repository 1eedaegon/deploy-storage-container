#!/bin/bash

#echo "> [REMOVE] Remove image exited images"
#docker rmi `docker images -f 'dangling=true' -q`
echo "> [REMOVE] Down exited process"
docker rm `docker ps -f 'status=exited' -q`

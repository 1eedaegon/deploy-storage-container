#!/bin/bash

echo "> [REMOVE] Down mariadb container"
docker service rm mariadb

echo "> [REMOVE] Down docker registry "
docker service rm registry

echo "> [REMOVE] Remove image exited images"
docker rmi `docker images -f 'dangling=true' -q`

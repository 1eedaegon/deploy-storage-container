#!/bin/bash

echo "> [STOP] Stop postgres contrainers: pgadmin, postgres"
echo "docker stop `docker ps -f 'name=postgres' -q` `docker ps -f 'name=pgadmin' -q`"
docker stop `docker ps -f 'name=postgres' -q` `docker ps -f 'name=pgadmin' -q`
echo "> [REMOVE] Remove exited container"
echo "docker rm `docker ps -f 'status=exited' -q`"
docker rm `docker ps -f 'status=exited' -q`

echo "> [COMPLETED] Kill complete"

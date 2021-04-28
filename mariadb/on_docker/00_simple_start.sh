#!/bin/bash

CURR=$(dirname $(realpath $0))
echo $CURR
docker pull mariadb
docker run -p 0.0.0.0:3306:3306 --name mariadb -e MYSQL_ROOT_PASSWORD=root -d mariadb

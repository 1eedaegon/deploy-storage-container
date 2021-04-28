#!/bin/bash

########## Vars ###########
DATA=data
DEPLOY_CONFIG=stack.yml
DB=mariadb
DB_CONFIG=my.cnf
DB_CONFIG_DIR=conf.d
###########################

# GET ABS PATH
echo "> [INIT] Current directory: $CURR"
CURR=$(dirname $(realpath $0))

# Make DB repository
if [ ! -d $CURR/$DATA ]; then 
  echo "> [INIT] Make DB volume: $DATA"
  mkdir -p $CURR/data
else
  echo "> [INIT] Volume already exist: $DATA"
fi

# Deploy
echo "> [DEPLOY] Deploy mariaDB container from: $DEPLOY_CONFIG"
if [ ! -f $CURR/$DEPLOY_CONFIG ]; then
  echo "> [ERROR] Not exist: $DEPLOY_CONFIG"
else
  if [ ! -f $CURR/$DB_CONFIG_DIR/$DB_CONFIG ]; then
    echo "> [DEPLOY] Not exist $DB_CONFIG, Start deploy with default settings: $DB"
    docker run -p 0.0.0.0:3306:3306 --name $DB -e MYSQL_ROOT_PASSWORD=password -d $DB
  else
    echo "> [DEPLOY] Now deploy: $DB "
    docker stack deploy --with-registry-auth -c stack.yml $DB
  fi
fi

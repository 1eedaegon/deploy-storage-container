#!/bin/bash
ENV_FILE=.env

# GET ENVIRONEMNT FROM .env
if [ ! -f $ENV_FILE ]; then
  echo "> [ERROR] Not exist: ENV_FILE"
  exit 0
else
  echo "> [INIT] Get environment from .env"
  export $(grep -v '^#' .env | xargs)
fi

# GET ABS PATH & INSERT TO .env 
if [ ! $CURR ]; then
  echo "> [INIT] Not exist: \$CURR, Insert \$CURR into .env"
  CURR=$(dirname $(realpath $0))
  echo "CURR=$CURR" >> $CURR/.env
fi
echo "> [INIT] Current directory: $CURR"

# Make DB repository
if [ ! -d $CURR/$DATA_DIR ]; then 
  echo "> [INIT] Make DB volume: $DATA_DIR"
  mkdir -p $CURR/$DATA_DIR
else
  echo "> [INIT] Volume already exist: $DATA_DIR"
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
    echo "> [DEPLOY] Now local deploy: $DB "
    echo "> $DB_CONFIG_DIR is bdconfig"
    echo "> =======>"
    docker compose up -d
  fi
fi

#!/bin/bash

source 00-setup.sh

ENV_FILE=.env
CURR=$(curr_dir)
echo "> [INIT] Current directory: $CURR"

# REPLACE CURRENT DIR INSIDE ENV FILE
function replace_curr_dir {
  if grep -q CURR= "$ENV_FILE"; then
    sed -e "s#CURR=.*#CURR=${CURR}#g" "$ENV_FILE" > "$ENV_FILE.tmp"
    mv $ENV_FILE.tmp $ENV_FILE
  fi
}

# GET ENVIRONMENT FROM FILE
if ! is_file_exist $ENV_FILE; then
  echo "> [ERROR] Not exist: $ENV_FILE"
  exit 0
else
  echo "> [INIT] Get environment from some file"
  replace_curr_dir
  export $(grep -v '^#' $ENV_FILE | xargs)
fi
echo "> [INIT] Initialize completed." 

# MAKE DB VOLUME
if ! is_dir_exist $CURR/$DATA_DIR; then
  mkdir -p $CURR/$DATA_DIR
fi
echo "> [INIT] Set db volume: /$DATA_DIR"

# SET DEPLOY CONFIG
echo "> [DEPLOY] Deploy PostgreSQL container from: $DEPLOY_CONFIG"
if ! is_file_exist $CURR/$DEPLOY_CONFIG; then
  echo "> [ERROR] Not exist: $DEPLOY_CONFIG "
  exit 0
fi
echo "> [DEPLOY] Set deploy from: $DEPLOY_CONFIG"

# DEPLOY
if ! is_file_exist $CURR/$DB_CONFIG_DIR/$DB_CONFIG; then
  echo "$CURR/$DB_CONFIG_DIR/$DB_CONFIG"
  echo "> [DEPLOY] Not exist $DB_CONFIG, Start deploy default container: $DB"
else
  echo "> [DEPLOY] Set DB from: /$DB_CONFIG_DIR/$DB_CONFIG"
  echo "> [DEPLOY] Now deploy: $DB "
   
fi


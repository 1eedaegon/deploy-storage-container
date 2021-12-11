#!/bin/bash
ENV_FILE=.env
CURR=`pwd`
OS=`uname -s | tr '[A-Z]' '[a-z]'`

echo $OS

# REPLACE CURRENT DIR INSIDE ENV FILE
function replace_curr_dir {
  if grep -q CURR= "$ENV_FILE"; then
    sed -e "s#CURR=.*#CURR=${CURR}#g" "$ENV_FILE" > "$ENV_FILE.tmp"
    mv $ENV_FILE.tmp $ENV_FILE
  fi
}

# GET ENVIRONMENT FROM FILE
if [ ! -f $ENV_FILE ]; then
  echo "> [ERROR] Not exist: $ENV_FILE"
  exit 0
else
  echo "> [INIT] Get environment from some file"
  replace_curr_dir
  export $(grep -v '^#' $ENV_FILE | xargs)
fi
echo "> [INIT] Initialize completed."

# Make DB volume 
if [ ! -d $CURR/$DATA_DIR ]; then 
  echo "> [INIT] Make DB volume: $DATA_DIR"
  mkdir -p $CURR/$DATA_DIR
else
  echo "> [INIT] Volume already exist: $DATA_DIR"
fi

# Deploy
echo "> [DEPLOY] Deploy mariaDB container from: $DEPLOY_CONFIG"
if [ ! -f $CURR/$DEPLOY_CONFIG ]; then
  echo "> [ERROR] Not exist: $CURR/$DEPLOY_CONFIG"
else
  if [ ! -f $CURR/$DB_CONFIG_DIR/$DB_CONFIG ]; then
    echo "> [DEPLOY] Not exist $DB_CONFIG, Start deploy with default settings: $DB"
    docker run -p 0.0.0.0:3306:3306 --name $DB -e MYSQL_ROOT_PASSWORD=password -d $DB
  else
    echo "> [DEPLOY] Now local deploy: $DB "
    echo "> =======>"
	case "$OS" in
		"$MAC")
			echo "This is MacOS" 
			echo "Execute: docker compose up -d"
			docker compose up -d;;
		"$LINUX")
			echo "This is Linux" 
			echo "Execute: docker-compose up"
			docker-compose up;;
		* )
			echo "Other OS"
			echo "TYPE: $OS";;
	esac
  fi
fi

echo "[COMPLETE] Operation finished."






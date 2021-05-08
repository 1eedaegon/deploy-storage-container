#!/bin/bash

source 00-setup.sh

ENV_FILE=.env
CURR=$(curr_dir)

# GET ENVIRONMENT FROM FILE
if ! is_file_exist $ENV_FILE; then
  echo "> [ERROR] Not exist: $ENV_FILE"
  exit 0
else
  echo "> [INIT] Get environment from some file"
  export $(grep -v '^#' $ENV_FILE | xargs)
fi


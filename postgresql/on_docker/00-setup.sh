#!/bin/bash
# INITIAL SCRIPT

function is_file_exist { [ -f $1 ]; }
function is_dir_exist { [ -d $1 ]; }
function curr_dir {
  if ! command -v realpath &> /dev/null; then
    echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  else
    echo "$(dirname $(realpath $0))"
  fi
}
function echo_msg {
  echo "> [$(echo $1 | tr 'a-z' 'A-Z')] ${@:2}" 
}
function progress {
 # POSIX sh
  sp='/-\|'
  printf ' '
  sleep 0.3
  while true; do
    printf '\b%.1s' "$sp"
    sp=${sp#?}${sp%???}
    sleep 0.1
  done
}

echo_msg "start" Bash setting initialize

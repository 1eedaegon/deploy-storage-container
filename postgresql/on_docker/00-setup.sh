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

#!/bin/bash

set -e

pipe="$MC_PATH/mc_server"

cd $MC_PATH

if [[ $# -gt 0 && $1 == "java" ]]; then

  echo "eula=true" > eula.txt

  if [ ! -e $pipe ]; then
    mkfifo $pipe
  fi

  exec "$@" <> $pipe

fi


exec "$@"
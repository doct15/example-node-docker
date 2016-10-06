#!/bin/bash
#

DOCKER_ENV_STRING=""
TEMP_PREFIX_LENGTH="${#DOCKER_ENV_PREFIX}"

for i in $(set | grep "$DOCKER_ENV_PREFIX"); do
  if [ ${i:0:2} != "_=" ] && [ ${i:0:18} != "DOCKER_ENV_PREFIX=" ]; then
    TEMP_ENV_VAR_LENGTH=${#i}
    TEMP_ENV_VAR=${i:$TEMP_PREFIX_LENGTH:($TEMP_ENV_VAR_LENGTH - $TEMP_PREFIX_LENGTH)}
    DOCKER_ENV_STRING+="-e \"$TEMP_ENV_VAR\" "
  fi
done





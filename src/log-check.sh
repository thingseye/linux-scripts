#!/bin/bash

echo `date`

NO_COLOUR="\033[0m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RED="\033[1;31m"

USERNAME=`whoami`
LOGS_DIR=</LOG_DIRECTORY>
LOG_SUFFIX="-prod.log"

declare -A HOSTS
HOSTS[<hostname>]="<component-name>"

for HOST in "${!HOSTS[@]}" ; do
  echo -e "${CYAN}+[${HOST}]${NO_COLOUR}"
  COMMAND="cd ${LOGS_DIR} ; " 
  for APP in ${HOSTS[$HOST]} ; do 
    COMMAND=$COMMAND" echo -e '${YELLOW}-${APP}${NO_COLOUR}' ; find ${APP}/${APP}${LOG_SUFFIX}* -daystart -atime 0 | xargs egrep '(ERROR|WARN|Exception)' | ~/bin/highlight ; "
  done
  ssh -ql ${USERNAME} ${HOST} "${COMMAND}"
done

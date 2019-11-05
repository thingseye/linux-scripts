#!/bin/bash

HOSTS="<HOST1> <HOST2> <...>"

for host in $HOSTS ; do
  ssh-copy-id "`whoami`-adm@$host"
done

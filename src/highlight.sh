#!/bin/bash

#
# script to allow colours to be shown when tail'ing or less'ing a log file
# note: when using less, use "less -R"
#

NO_COLOUR="\o033[0m"
DEBUG=$NO_COLOUR
INFO="\o033[1;33m"
WARN="\o033[1;35m"
ERROR="\o033[1;31m"
FATAL="\o033[41;1;37m"

sed -e "s/\(^.* DEBUG.*\)/$DEBUG\1$NO_COLOUR/" \
  -e "s/\(^.* INFO.*\)/$INFO\1$NO_COLOUR/" \
  -e "s/\(^.* WARN.*\)/$WARN\1$NO_COLOUR/" \
  -e "s/\(^.* ERROR.*\)/$ERROR\1$NO_COLOUR/" \
  -e "s/\(^.* FATAL.*\)/$FATAL\1$NO_COLOUR/" < "${1:-/dev/stdin}"

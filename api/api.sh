#!/bin/bash
COMMAND="twitch api $ACTION_TWITCH_METHOD $ACTION_TWITCH_ENDPOINT"

if [ -z "$ACTION_TWITCH_QUERY_PARAMETERS" ]
then
  for parameter in ${ACTION_TWITCH_EVENTS//,/ }
  do
    COMMAND="$COMMAND -q $parameter"
  done
fi

eval "$COMMAND"
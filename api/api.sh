#!/bin/bash
COMMAND="twitch api $ACTION_TWITCH_METHOD $ACTION_TWITCH_ENDPOINT"

if [ -n "$ACTION_TWITCH_QUERY_PARAMETERS" ]
then
  for parameter in ${ACTION_TWITCH_EVENTS//,/ }
  do
    COMMAND="$COMMAND -q $parameter"
  done
fi

RESPONSE="$($COMMAND 2>&1)"
RESPONSE="response=$RESPONSE"

echo "$RESPONSE" >> $GITHUB_OUTPUT
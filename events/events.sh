#!/bin/sh
if [ -n "$ACTION_TWITCH_MOCK_COMMAND" ]
then
  eval "$ACTION_TWITCH_MOCK_COMMAND" &
  TWITCH_EVENTS_PID=$!
  sleep 10
fi

for type in ${ACTION_TWITCH_EVENTS//,/ }
do
  twitch event trigger "$type" -F "$ACTION_TWITCH_EVENTS_ENDPOINT"
done

if [ -n "$ACTION_TWITCH_MOCK_COMMAND" ]
then
  kill $TWITCH_EVENTS_PID
fi
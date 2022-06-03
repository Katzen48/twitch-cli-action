#!/bin/sh
eval $ACTION_TWITCH_MOCK_COMMAND &
TWITCH_EVENTS_PID=$!

sleep 10

for type in ${ACTION_TWITCH_EVENTS//,/ }
do
  twitch event trigger $type -F $ACTION_TWITCH_EVENTS_ENDPOINT
done

kill $TWITCH_EVENTS_PID
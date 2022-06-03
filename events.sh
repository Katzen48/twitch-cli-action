#!/bin/sh
eval $ACTION_TWITCH_MOCK_PORT &
TWITCH_EVENTS_PID=$!

for type in ${ACTION_TWITCH_EVENTS//,/ }
do
  twitch event trigger $type -F $ACTION_TWITCH_EVENTS_ENDPOINT
done

kill $TWITCH_EVENTS_PID
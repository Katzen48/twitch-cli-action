#!/bin/bash
if [ -n "$ACTION_TWITCH_CLIENT_ID" ] && [ -n "$ACTION_TWITCH_TOKEN" ]
then
  eval "twitch token -r $ACTION_TWITCH_TOKEN --client-id $ACTION_TWITCH_CLIENT_ID"
else
  TOKEN=$(eval "twitch token" | awk '{print $5}')
  echo "token=$($TOKEN)" >> $GITHUB_OUTPUT
fi
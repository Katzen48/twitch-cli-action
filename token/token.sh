#!/bin/bash
if [ -n "$ACTION_TWITCH_CLIENT_ID" ] && [ -n "$ACTION_TWITCH_TOKEN" ]
then
  echo 'Revoking Token'

  eval "twitch token -r $ACTION_TWITCH_TOKEN --client-id $ACTION_TWITCH_CLIENT_ID"
else
  echo 'Getting Token'

  TOKEN=$(twitch token 2>&1)
  TOKEN=$(echo "$TOKEN" | awk '{print $NF}')
  TOKEN="token=$TOKEN"

  echo "$TOKEN" >> $GITHUB_OUTPUT
fi
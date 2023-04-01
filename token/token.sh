#!/bin/bash
if [ -n "$ACTION_TWITCH_CLIENT_ID" ] && [ -n "$ACTION_TWITCH_TOKEN" ]
then
  echo 'Revoking Token'

  eval "twitch token -r $ACTION_TWITCH_TOKEN --client-id $ACTION_TWITCH_CLIENT_ID &> /dev/null"
else
  echo 'Getting Token'

  TOKEN=$(twitch token 2>&1)
  TOKEN=$(echo "$TOKEN" | awk '{print $NF}')

  echo "token=$TOKEN" >> $GITHUB_OUTPUT
fi
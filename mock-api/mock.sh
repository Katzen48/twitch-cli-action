#!/bin/bash
twitch mock-api generate
twitch mock-api start -p "$ACTION_TWITCH_MOCK_PORT" &
TWITCH_CLI_PID=$!

sleep 5

if [ -n "$ACTION_TWITCH_MOCK_COMMAND" ]
then
  eval "$ACTION_TWITCH_MOCK_COMMAND"

  kill $TWITCH_CLI_PID
fi
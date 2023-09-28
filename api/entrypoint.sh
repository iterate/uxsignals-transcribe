#!/bin/sh

# Trigger an error if non-zero exit code is encountered
set -e 

# Modify the enviroment
if test -z "$WHISPER_WEBHOOKS"; then
  echo "WHISPER_WEBHOOKS variable is not set, or empty" 1>&2
  exit 1
fi
echo "$WHISPER_WEBHOOKS" > allowed_webhooks.json

exec ${@}
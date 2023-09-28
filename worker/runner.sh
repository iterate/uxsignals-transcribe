#!/usr/bin/env sh

if test -z "$REDIS_URL"; then
  echo "No REDIS_URL set"
  exit 1;
fi

rq worker --url "$REDIS_URL" -c worker-settings

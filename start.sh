#!/bin/sh

if [ -z "$CRON_SCHEDULE" ]; then
    CRON_SCHEDULE="0 3 * * *"
fi

if [ "$USE_HTTPS" = true ]; then
    BASE_URL="https://${FIREFLY_III_HOSTNAME}:${FIREFLY_II_PORT}/api/v1/cron"
else
    BASE_URL="http://${FIREFLY_III_HOSTNAME}:${FIREFLY_II_PORT}/api/v1/cron"
fi

if [ -n "$STATIC_CRON_TOKEN_FILE" ]; then
    STATIC_CRON_TOKEN=$(cat "$STATIC_CRON_TOKEN_FILE")
fi

CRON="${CRON_SCHEDULE} curl -s $BASE_URL/$STATIC_CRON_TOKEN"

echo "Adding the following cron: $CRON"

echo "$CRON" > /tmp/crontab

crontab /tmp/crontab
crond -f -L /dev/stdout
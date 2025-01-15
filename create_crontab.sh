#! /bin/bash

cd /app
echo "$CRONTAB_SCHEDULE export PYTHONPATH=/app && python /app/main.py >> /app/logs/cron.log 2>&1" > crontab
crontab crontab

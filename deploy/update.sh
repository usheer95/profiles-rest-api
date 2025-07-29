#!/usr/bin/env bash

set -e

PROJECT_BASE_PATH='/usr/local/apps/profiles-rest-api'

cd $PROJECT_BASE_PATH
git pull
uv run manage.py migrate
uv run manage.py collectstatic --noinput
supervisorctl restart profiles_api

echo "DONE! :)"

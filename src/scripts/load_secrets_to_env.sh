#!/bin/bash
TOKEN=$DOPPLER_TOKEN_NAME
doppler secrets download -t "${!TOKEN}" --no-file --format docker --project "$DOPPLER_PROJECT" > doppler.env
doppler secrets download -t "${!TOKEN}" --no-file --format env --project "$DOPPLER_PROJECT" > dopplerenv
sed -e 's/^/export /' dopplerenv >> "$BASH_ENV"
# shellcheck disable=SC1090
source "$BASH_ENV"
#!/bin/bash
TOKEN=$DOPPLER_TOKEN_NAME
doppler secrets download -t "${!TOKEN}" --no-file --format "$DOPPLER_FORMAT" --project "$DOPPLER_PROJECT" > doppler.env
sed -e 's/^/export /' doppler.env >> "$BASH_ENV"
# shellcheck disable=SC1090
source "$BASH_ENV"
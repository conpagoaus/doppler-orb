#!/bin/bash
doppler secrets download -t "$DOPPLER_TOKEN" --no-file --format env --project "$DOPPLER_PROJECT" > doppler.env
sed -e 's/^/export /' doppler.env >> "$BASH_ENV"
# shellcheck disable=SC1090
source "$BASH_ENV"
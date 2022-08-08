#!/bin/bash
SECRET=$DOPPLER_SECRET
FILE=$DOPPLER_FILE
TOKEN=$DOPPLER_TOKEN_NAME
doppler secrets get $SECRET --plain -t "${!TOKEN}" --project "$DOPPLER_PROJECT" > $FILE

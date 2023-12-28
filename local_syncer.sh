#!/bin/bash

# Run example: ./local_syncer.sh /path/to/directory1 /path/to/directory2 profile_name sleep_time

DIRECTORY_1=$1
DIRECTORY_2=$2
UNISON_PROFILE=$3
SLEEP=${4:-1}

# Validate directories and profile name
if [[ -z "$DIRECTORY_1" ]] || [[ -z "$DIRECTORY_2" ]] || [[ -z "$UNISON_PROFILE" ]]; then
    echo "ERROR: You must provide two directories and a Unison profile name. Example:"
    echo "./local_syncer.sh /path/to/directory1 /path/to/directory2 profile_name sleep_time"
    exit 1
fi

unison -batch -owner -group -ui text $UNISON_PROFILE

while true
do
    echo "Monitoring changes"
    change=$(fswatch -1 --recursive $DIRECTORY_1 $DIRECTORY_2)
    echo "A change was detected in: $change"
    unison -batch -owner -group -ui text $UNISON_PROFILE
    sleep $SLEEP
done

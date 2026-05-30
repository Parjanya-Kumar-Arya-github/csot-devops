#!/bin/bash

max_attempts=$1
delay=$2

shift 2

if [ "$1" = "--" ]; then
    shift
fi

for (( attempt=1; attempt<=max_attempts; attempt++ )); do
    
    "$@"
    
    rc=$?

    if [ $rc -eq 0 ]; then
        exit 0
    fi

    if [ $attempt -lt $max_attempts ]; then
        sleep "$delay"
        delay=$((delay * 2))
    fi

done
exit $rc
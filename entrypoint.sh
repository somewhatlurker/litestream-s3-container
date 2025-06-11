#!/bin/sh
set -e

if [ ! -e "$LOCAL_PATH" ]
then
    echo "$LOCAL_PATH does not exist, restoring replica (if it exists)"
    litestream restore -if-db-not-exists -if-replica-exists "$LOCAL_PATH"
fi

litestream "$@"

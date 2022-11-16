#!/bin/bash

# turn on bash's job control
set -m

# Start the primary process and put it in the background
/opt/keycloak/bin/kc.sh "$@" &

# Start the helper process
if [ "x$KEYCLOAK_IMPORT" != "x" ]; then
    /opt/keycloak/import-realms.sh "$@" &
fi

# the import-realms might need to know how to wait on the
# primary process to start before it does its work and returns

# now we bring the primary process back into the foreground
# and leave it there
fg %1
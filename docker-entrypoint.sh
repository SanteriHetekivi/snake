#!/bin/sh

# Get group and user ids or use defaults.
PUID=${PUID:-911}
PGID=${PGID:-911}

# Change group and user ids.
groupmod -o -g "$PGID" app &&
usermod -o -u "$PUID" app &&

# Change permission for user and group.
chown -R app:app /app &&
chown -R app:app /usr/src/app &&

su -s /bin/bash -c 'id' app &&

# Running command.
exec gosu app "$@"
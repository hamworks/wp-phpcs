#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- phpcs "$@"
elif [ "$1" = "phpcs" ]; then
  set -- /sbin/tini -- "$@"
elif [ "$1" = "phpcbf" ]; then
  set -- /sbin/tini -- "$@"
fi

exec "$@"

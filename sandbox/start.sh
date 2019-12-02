#!/usr/bin/env bash

# fix owner permissions.
sudo chown -R sandbox:sandbox /home/sandbox

# source env files generated during docker build.
if [ -f ~/.build_env ]; then
    . ~/.build_env
fi

# run the original command
exec "$@"

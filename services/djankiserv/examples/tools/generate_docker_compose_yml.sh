#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd "$DIR"/..

set -e
set -x

YML_OUT="./docker-compose.yml"


if ! [ -n "$DJANKISERV_VARS_SOURCED" ]; then
    echo Please source "Configuration/djankiserv.vars"
    exit 1
fi

if ! [ -n "$DJANKISERV_COMPOSE_VARS_SOURCED" ]; then
    echo Please source "Configuration/djankiserv_compose.vars"
    exit 1
fi

if [ -f "$YML_OUT" ]; then
    rm "$YML_OUT";
fi

printf "############### AUTOGENERATED - DO NOT EDIT ################\n\n" >> "$YML_OUT"
envsubst < docker-compose.yml.in >> "$YML_OUT"
printf "\n\n############### AUTOGENERATED - DO NOT EDIT ################" >> "$YML_OUT"

#!/usr/bin/env bash

# Lightly modified setup script

set -o pipefail

rand() {
  echo `cat /dev/urandom | env LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`
}

wget -O docker-compose.yml https://raw.githubusercontent.com/ngrie/rtmpie/main/docker/docker-compose.prod.yaml

# needs to be provided command line, just uses the IP
RTMPIE_HOSTNAME=$1
RTMPIE_HTTP_SCHEME=http
RTMPIE_CADDY_SERVER_NAME="${RTMPIE_HOSTNAME}:80"


RTMPIE_APP_SECRET=$(rand)
RTMPIE_MERCURE_JWT_KEY=$(rand)
RTMPIE_DATABASE_PASSWORD=$(rand)

cat << EOF > rtmpie.conf
RTMPIE_HOSTNAME=${RTMPIE_HOSTNAME}
RTMPIE_HTTP_SCHEME=${RTMPIE_HTTP_SCHEME}
RTMPIE_CADDY_SERVER_NAME=${RTMPIE_CADDY_SERVER_NAME}
RTMPIE_APP_SECRET=${RTMPIE_APP_SECRET}
RTMPIE_MERCURE_JWT_KEY=${RTMPIE_MERCURE_JWT_KEY}
RTMPIE_DATABASE_PASSWORD=${RTMPIE_DATABASE_PASSWORD}
EOF

ln -s rtmpie.conf .env
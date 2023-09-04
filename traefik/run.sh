#!/bin/bash
echo "starting traefik..."
docker run -d --restart unless-stopped \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v $PWD/traefik.toml:/traefik.toml \
      -v $PWD/acme.json:/acme.json \
      -p 80:80 \
      -p 443:443 \
      -l traefik.frontend.rule=Host:monitor.myserver.com \
      -l traefik.port=8080 \
      --network web \
      --name traefik \
      traefik:1.7.2-alpine

echo "done"

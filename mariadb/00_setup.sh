#!/bin/bash


echo "> [INIT] Local swarm initialize"
docker swarm init

echo "> [INIT] Set-up docker registry - key"
mkdir -p certs
docker secret create domain.crt certs/domain.crt
docker secret create domain.key certs/domain.key

echo "> [INIT] Set-up docker registry - registry"
docker service create \
  --name registry \
  --secret domain.crt \
  --secret domain.key \
  --constraint 'node.labels.registry==true' \
  --mount type=bind,src=/mnt/registry,dst=/var/lib/registry \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/run/secrets/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/run/secrets/domain.key \
  --publish published=443,target=443 \
  --replicas 1 \
  registry:2

echo "> [INIT] Copy mariadb from Hub to Local repo"
docker pull mariadb
docker tag mariadb 0.0.0.0:443/mariadb
docker push 0.0.0.0:443/mariadb

echo "> [INIT] Remove cached local images"
docker image remove mariadb
docker image remove 0.0.0.0:443/mariadb:latest

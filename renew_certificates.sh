#!/bin/bash

# Run with sudo

cd /home/earth/sweetgasoline-cloud-app
make down
certbot renew --force-renewal
cp /etc/letsencrypt/live/work.sweetgasoline.kr/fullchain.pem ./certs/fullchain.pem
cp /etc/letsencrypt/live/work.sweetgasoline.kr/privkey.pem ./certs/privkey.pem
make up

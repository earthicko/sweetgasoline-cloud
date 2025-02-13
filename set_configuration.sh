#!/bin/bash

set -x

# Load the .env file
set -o allexport
source .env
set +o allexport

docker exec -u www-data nextcloud-app php occ --no-warnings config:system:get trusted_domains >> trusted_domain.tmp

if ! grep -q "nextcloud-nginx" trusted_domain.tmp; then
    TRUSTED_INDEX=$(cat trusted_domain.tmp | wc -l);
    docker exec -u www-data nextcloud-app php occ --no-warnings config:system:set trusted_domains $TRUSTED_INDEX --value="nextcloud-nginx"
fi

rm trusted_domain.tmp

docker exec -u www-data nextcloud-app php occ --no-warnings app:install onlyoffice

docker exec -u www-data nextcloud-app php occ --no-warnings config:system:set onlyoffice DocumentServerUrl --value="/ds-vpath/"
docker exec -u www-data nextcloud-app php occ --no-warnings config:system:set onlyoffice DocumentServerInternalUrl --value="http://nextcloud-onlyoffice/"
docker exec -u www-data nextcloud-app php occ --no-warnings config:system:set onlyoffice StorageUrl --value="http://nextcloud-nginx/"
docker exec -u www-data nextcloud-app php occ --no-warnings config:system:set onlyoffice jwt_secret --value=${JWT_SECRET}
docker exec -u www-data nextcloud-app php occ --no-warnings config:system:set allow_local_remote_servers  --value=true

#!/bin/sh
echo '===> Stop & Remove container LDAP'
docker kill nindeco_ldap
docker rm nindeco_ldap
echo '==> Clear volumes'
docker volume rm nindeco_ldap_data
docker volume rm nindeco_ldap_config
docker volume rm nindeco_ldap_data_backup
echo '==> Rebuild LDAP'
docker-compose up --build $1 ldap 
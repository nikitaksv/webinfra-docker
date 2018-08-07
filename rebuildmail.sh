#!/bin/sh
echo '===> Stop & Remove container MAIL'
docker kill nindeco_mail
docker rm nindeco_mail
echo '==> Clear volumes'
docker volume rm nindeco_maildata
docker volume rm nindeco_mailstate
echo '==> Rebuild MAIL'
docker-compose up --build $1 mail 
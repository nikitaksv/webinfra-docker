#!/bin/bash
docker-ip() {
  docker inspect --format '{{ .NetworkSettings.Networks.nindeco_default.IPAddress }}'  "$@"
}
echo -e "\n=====> Rebuild MYSQL\n"
docker stop nindeco_mysql
docker rm nindeco_mysql
echo -e "\n=====> Remove volumes\n"
docker volume rm nindeco_mysql_data
echo -e "\n=====> Build MYSQL\n"
docker-compose up --build -d mysql
echo -e "\n=====> Wait when restore dump\n"
./services/redmine/wait-for-it.sh -t 300 $(docker-ip nindeco_mysql):3306
echo -e "\nDone."
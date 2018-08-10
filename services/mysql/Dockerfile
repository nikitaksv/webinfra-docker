ARG MYSQL_TAG_VERSION=${MYSQL_TAG_VERSION}
FROM mysql:${MYSQL_TAG_VERSION}

# Копируем дампы
COPY ./dumps /docker-entrypoint-initdb.d
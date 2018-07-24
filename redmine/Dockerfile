ARG REDMINE_TAG_VERSION=${REDMINE_TAG_VERSION}
FROM redmine:${REDMINE_TAG_VERSION}

COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh

RUN sed -i '4s/^/ \nwait-for-it.sh -t 300 ${REDMINE_DB_MYSQL}:3306 /' /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
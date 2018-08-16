ARG REDMINE_TAG_VERSION=${REDMINE_TAG_VERSION}
FROM redmine:${REDMINE_TAG_VERSION}

### Install dependencies for TDlib; 
RUN apt-get update \
    && apt-get install -y gperf build-essential cmake openssl libssl-dev libreadline-dev clang
### clone and build TDLib;
RUN cd /usr/src/redmine/ \
    && git clone https://github.com/tdlib/td.git \
    && chown 755 -R td \
    && mkdir -p vendor \
    && cd vendor \
    && cmake -DCMAKE_BUILD_TYPE=Release ../td \
    && cmake --build . 

RUN sed -i '4s/^/ \nwait-for-it.sh -t 300 ${REDMINE_DB_MYSQL}:3306 /' /docker-entrypoint.sh
RUN sed -i '116s/^/ \ninstall-agile.sh /' /docker-entrypoint.sh


COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
COPY fix-redis-ip.sh /usr/local/bin/fix-redis-ip.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
ARG REDMINE_TAG_VERSION=${REDMINE_TAG_VERSION}
FROM redmine:${REDMINE_TAG_VERSION}

### Install dependencies for TDlib; install and start redis-server; 
RUN apt-get update \
    && apt-get install -y gperf build-essential zlib1g-dev cmake openssl libssl-dev libreadline-dev clang redis-server \
    && redis-server /etc/redis/redis.conf

### clone and build TDLib;
RUN cd /usr/src/redmine/ \
    && git clone https://github.com/tdlib/td.git \
    && mkdir -p vendor \
    && cd vendor \
    && cmake -DCMAKE_BUILD_TYPE=Release ../td \
    && cmake --build . 

RUN sed -i '4s/^/ \nwait-for-it.sh -t 300 ${REDMINE_DB_MYSQL}:3306 /' /docker-entrypoint.sh

COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]

ARG BIND_TAG_VERSION=${BIND_TAG_VERSION}
FROM sameersbn/bind:${BIND_TAG_VERSION}

ARG ADDRESS=${ADDRESS}

RUN sed -i "s/referers_none=1/referers_none=0/g" /etc/webmin/config \
    && sed -i "s/ssl=1/ssl=0/g" /etc/webmin/miniserv.conf  \
    && echo 'referers='${ADDRESS} >> /etc/webmin/config
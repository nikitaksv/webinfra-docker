ARG ROUNDCUBEMAIL_TAG_VERSION=${ROUNDCUBEMAIL_TAG_VERSION}
FROM roundcube/roundcubemail:${ROUNDCUBEMAIL_TAG_VERSION}

RUN apt-get update \
    && apt-get install -y mc ssl-cert \
    && a2enmod ssl \
    && a2enmod headers \
    && a2ensite default-ssl
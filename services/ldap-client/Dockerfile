ARG LDAP_CLIENT_TAG_VERSION=${LDAP_CLIENT_TAG_VERSION}
FROM osixia/phpldapadmin:${LDAP_CLIENT_TAG_VERSION}

RUN apt-get update \
    && apt-get install -y mc

ADD config/config.php /container/service/phpldapadmin/assets/config/config.php

ADD templates /templates
RUN chmod 777 -R /templates
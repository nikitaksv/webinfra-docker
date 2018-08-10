ARG LDAP_TAG_VERSION=${LDAP_TAG_VERSION}
FROM osixia/openldap-backup:${LDAP_TAG_VERSION}

RUN apt-get update \
    && apt-get install -y mc

COPY ./ldif /container/service/slapd/assets/config/bootstrap/ldif/custom
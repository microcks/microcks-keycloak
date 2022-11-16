#!/bin/bash

echo "[+] waiting for keycloak to start"
# simply wait until the master realm is available
/opt/keycloak/wait-for.sh "curl --fail --silent http://localhost:8080/realms/master"

echo "[+] authorize admin user for import"
# authorize admin user
/opt/keycloak/bin/kcadm.sh config credentials --realm master --user ${KEYCLOAK_ADMIN} --password ${KEYCLOAK_ADMIN_PASSWORD} --server http://localhost:8080

echo "[+] import realm ${KEYCLOAK_IMPORT}"
# import the realm config
/opt/keycloak/bin/kcadm.sh create realms -f ${KEYCLOAK_IMPORT} --server http://localhost:8080 -s enabled=true
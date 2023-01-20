FROM quay.io/keycloak/keycloak:20.0.2

# Some version information
LABEL io.k8s.description="Microcks is Open Source Kubernetes native tool for API Mocking and Testing" \
      io.k8s.display-name="Microcks Keycloak distribution" \
      maintainer="Laurent Broudoux <laurent@microcks.io>"

# copy the custom scripts
COPY bin/*.sh /opt/keycloak/

# overwrite entrypoint with the custom entrypoint script
ENTRYPOINT ["/opt/keycloak/entrypoint-wrapper.sh"]
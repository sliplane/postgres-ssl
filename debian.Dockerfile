ARG base_image
FROM ${base_image}

LABEL org.opencontainers.image.description="PostgreSQL but with self-signed certs"

RUN \
  export DEBIAN_FRONTEND=noninteractive && \
  apt-get update -y && \
  apt-get install -y -qq \
  openssl && \
  apt-get clean autoclean -y && \
  apt-get autoremove --yes && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
  unset DEBIAN_FRONTEND
COPY generate-ssl-certs.sh /docker-entrypoint-initdb.d/

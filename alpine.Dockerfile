ARG base_image
FROM ${base_image}

LABEL org.opencontainers.image.description="PostgreSQL but with self-signed certs"

RUN \
  apk add --no-cache \
  openssl
COPY generate-ssl-certs.sh /docker-entrypoint-initdb.d/

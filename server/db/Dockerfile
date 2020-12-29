FROM postgres:12.2

ARG DBNAME=async_db

COPY wait-for-pg.sh /tmp/wait-for-pg.sh
RUN chmod +x /tmp/wait-for-pg.sh
COPY ./bootstrap.sql /tmp/

RUN set -e && \
    nohup bash -c "docker-entrypoint.sh postgres &" && \
    /tmp/wait-for-pg.sh && \
    psql -U postgres -f /tmp/bootstrap.sql

# HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  # CMD pg_isready -U postgres -d $DBNAME
#!/bin/sh -e

# POSTGRES_PORT: ${ASYNC_PG_PORT}
# POSTGRES_DB: postgres
# POSTGRES_USER: admin
# POSTGRES_PASSWORD: secret

until pg_isready -h 0.0.0.0 -p "${POSTGRES_PORT}" -U postgres
do
  echo "Waiting for postgres, retry in 2 secs"
  sleep 2;
done

sleep 2;

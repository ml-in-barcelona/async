FROM ocaml/opam2:debian-10-ocaml-4.10 as base

WORKDIR /async_app

# Install dependencies
COPY async_app.opam .
RUN opam pin add -yn async_app . && \
    opam depext async_app && \
    opam install . --deps-only

# Build the server app. Note: The chown is somehow necessary, as
# without it the `dune build` command will fail with
# permission errors.
# We also need to take note of the dependencies from depext.
COPY . .
RUN sudo chown -R opam:nogroup . && \
    opam exec dune build && \
    opam depext -ln async_app > depexts

# Build client app
FROM node:12.18.3-buster as client
WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY --from=base /home/opam/.opam/4.10/bin/atdgen /usr/local/bin/atdgen
RUN chmod +x /usr/local/bin/atdgen
COPY . .
RUN yarn build && yarn webpack:production

# Create production image
FROM debian:buster-slim as stage
WORKDIR /app
COPY --from=base /async_app/_build/default/server/main.exe async_app.exe
COPY --from=base /async_app/_build/default/server/migrate/migrate.exe migrate.exe
COPY --from=client /app/server/static server/static

# Don't forget to install the dependencies, noted from
# the previous build.
COPY --from=base /async_app/depexts depexts
RUN apt-get update && cat depexts | xargs apt-get install -y && rm -rf /var/lib/apt/lists/*

CMD ./async_app.exe --port=$PORT

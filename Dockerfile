FROM ocaml/opam2:debian-10-ocaml-4.10 as base

WORKDIR /async_app

# Update opam-repository imperatively
RUN cd ~/opam-repository && (git cat-file -e 1089e2fbbb25dd2518069e614b4ed8f7088763ca || git fetch origin master) && git reset -q --hard 1089e2fbbb25dd2518069e614b4ed8f7088763ca && git log --no-decorate -n1 --oneline && opam update -u

RUN eval $(opam env)

# Install dependencies
COPY async_app.opam .
RUN opam pin add -yn async_app .
RUN opam depext async_app --with-test --update -iy
RUN OPAMCURL="curl --tlsv1 -kv" opam install . --with-doc --with-test

# Build the server app. Note: The chown is somehow necessary, as
# without it the `dune build` command will fail with
# permission errors.
# We also need to take note of the dependencies from depext.
COPY . .
RUN sudo chown -R opam:nogroup .
RUN opam exec dune build
RUN opam depext -ln async_app > depexts
# RUN dune test --force

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

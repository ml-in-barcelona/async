# ocaml_webapp

A minimal example of a lightweight webapp in OCaml.

It features a possible organization of files to maximize code sharing between server (native OCaml) and client (BuckleScript). Some of the things shared are:

- React components, which are server-side rendered with [Tyxml](https://github.com/ocsigen/tyxml) and hydrated with [ReasonReact](https://reasonml.github.io/reason-react/)
- Routes, through the OCaml library [Routes](https://github.com/anuragsoni/routes).
- API endpoints interface types, through library [ATD](https://github.com/ahrefs/atd), that also generates encoders / decoders automatically.

Potentially, `shared` folder can contain other shared code like validation functions, data processing, etc.

### Getting started

```bash
make dev
```
- Create an opam local switch
- Installs `dune` & `ocaml-lsp-server`
- Installs dependencies

Install all dependencies:

```bash
make install
```

Build client:

```
yarn
```
```
yarn webpack:dev
```

Build and run the server:
```bash
make run
```

Open the browser and go to http://localhost:3000/.

It's also possible to get hot reloading while developing. For that, start the server (to be able to serve API requests) with `make run`, run BuckleScript in `yarn start` and then start Webpack dev server with `yarn server`.

### Set up database locally

```
docker-compose -f docker-compose.dev.yml up -d
```

Open `localhost:8080` in the browser, login with `admin@server.com` and `secret`.

In pgadmin, go to "Create server". Enter `local` as name, and in the Connection tab, enter:
- `pgsql-server` as "Host name / address"
- user `admin`
- password `secret`

Then, right click in `local`, "Create" -> "Database", and create a new database with name `async_app`.

Finally, `make migrate`.

### Deploying to Heroku

Right now, the example allows to easily deploy the app to Heroku. Build times are longer than they should, but hopefully
this will be fixed [soon](https://github.com/jchavarri/async_app/issues/1).

#### Initial configuration

- Install the Heroku CLI: http://toolbelt.heroku.com/
- Run `heroku create your_app` from the app folder
- Set stack for the app to `container`: `heroku stack:set container`
- Provision the Postgres addon in the free `hobby-dev` plan: `heroku addons:create heroku-postgresql:hobby-dev`

Now, for [review apps](https://devcenter.heroku.com/articles/github-integration-review-apps) there is no need to provision the addon or seed the database, as this is done from the [`app.json` file](https://github.com/reason-in-barcelona/async/blob/5fc57c0e9b0b4c0ffd1719c38328f67d36546549/app.json#L15). But for the production database, it will be needed.

To do so:
- Start the sql command line tool with `heroku pg:psql`
- Manually run the `create table` statements shown in `migrate.re` in the Postgres interactive terminal.

#### Regular deploys

To deploy the app after changes, just run `git push heroku master`.

### Resources

- Amazing tutorial to create a lightweight OCaml webapp: https://shonfeder.gitlab.io/ocaml_webapp/
- Deploying native Reason/OCaml with Zeit's now.sh: https://jaredforsyth.com/posts/deploying-native-reason-ocaml-with-now-sh/
- Deploying OCaml server on Heroku: https://medium.com/@aleksandrasays/deploying-ocaml-server-on-heroku-f91dcac11f11
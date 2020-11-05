open! Core;
open Opium.Std;

/* Type aliases for the sake of documentation and explication */
type caqti_conn_pool('err) =
  Caqti_lwt.Pool.t(Caqti_lwt.connection, [> Caqti_error.connect] as 'err);

type query('res, 'err) =
  Caqti_lwt.connection => Lwt.t(result('res, [< Caqti_error.t] as 'err));

/** Configuration of the connection */

let connection_uri = Sys.getenv_exn("DATABASE_URL");

/* [connection ()] establishes a live database connection and is a pool of
   concurrent threads for accessing that connection. */
let connect = () =>
  connection_uri
  |> Uri.of_string
  |> Caqti_lwt.connect_pool(~max_size=10)
  |> (
    fun
    | Ok(pool) => pool
    | Error(err) => failwith(Caqti_error.show(err))
  );

/* [query_pool query pool] is the [Ok res] of the [res] obtained by executing
   the database [query], or else the [Error err] reporting the error causing
   the query to fail. */
let query_pool = (query, pool) =>
  Caqti_lwt.Pool.use(query, pool) |> Lwt_result.map_err(Caqti_error.show);

/* Seal the key type with a non-exported type, so the pool cannot be retrieved
   outside of this module */
type db_pool('err) = caqti_conn_pool('err);

let key: Opium.Hmap.key(db_pool(_)) =
  Opium.Hmap.Key.create(("db pool", _ => sexp_of_string("db_pool")));

/* Initiate a connection pool and add it to the app environment */
let middleware = app => {
  let pool = connect();
  let filter = (handler, req: Request.t) => {
    let env = Opium.Hmap.add(key, pool, Request.env(req));
    handler({...req, env});
  };

  let m = Rock.Middleware.create(~name="database connection pool", ~filter);
  middleware(m, app);
};

/* Execute a query on the database connection pool stored in the request
   environment */
let query_db = (query, req) =>
  Request.env(req) |> Opium.Hmap.get(key) |> query_pool(query);

/** Collects all the SQL queries */
module Query = {
  type query_result('res, 'err) =
    Lwt.t(result('res, [> Caqti_error.call_or_retrieve] as 'err));

  let add_excerpt:
    (Caqti_lwt.connection, Shared.Excerpt_t.t) => query_result(unit, 'err) = {
    open Shared.Excerpt_t;
    %rapper
    execute(
      {sql|
        INSERT INTO excerpts(author, excerpt, source, page)
        VALUES (%string{author}, %string{excerpt}, %string{source}, %string?{page})
        |sql},
      record_in,
    );
  };

  let get_excerpts_by_author:
    (Caqti_lwt.connection, ~author: string) =>
    query_result(list(Shared.Excerpt_t.t), 'err) = {
    open Shared.Excerpt_t;
    %rapper
    get_many(
      {sql|
        SELECT @string{author}, @string{excerpt}, @string{source}, @string?{page}
        FROM excerpts
        WHERE author = %string{author}
        |sql},
      record_out,
    );
  };

  let get_authors:
    (Caqti_lwt.connection, unit) => query_result(list(string), 'err) = [%rapper
    get_many(
      {sql|
        SELECT DISTINCT @string{author}
        FROM excerpts
        |sql},
    )
  ];
};

/* Execute queries for fetching data */
module Get = {
  let excerpts_by_author =
      author: (Request.t => Lwt_result.t(list(Shared.Excerpt_t.t), string)) =>
    query_db(Query.get_excerpts_by_author(~author));

  let authors: Request.t => Lwt_result.t(list(string), string) =
    query_db(c => Query.get_authors(c, ()));
};

/* Execute queries for updating data */
module Update = {
  let add_excerpt = excerpt: (Request.t => Lwt_result.t(unit, string)) =>
    query_db(c => Query.add_excerpt(c, excerpt));
};

module Migration = {
  type migration_error('a) =
    [< Caqti_error.t > `Connect_failed `Connect_rejected `Post_connect] as 'a;

  type migration_operation('a) =
    (Caqti_lwt.connection, unit) => Lwt.t(result(unit, migration_error('a)));

  type migration_step('a) = (string, migration_operation('a));

  let execute = migrations => {
    open Lwt;
    let rec run = (migrations, pool) =>
      switch (migrations) {
      | [] => Lwt_result.return()
      | [(name, migration), ...migrations] =>
        Lwt_io.printf("Running: %s\n", name)
        >>= (
          () =>
            query_pool(c => migration(c, ()), pool)
            >>= (
              fun
              | Ok () => run(migrations, pool)
              | Error(err) => return(Error(err))
            )
        )
      };

    return(connect()) >>= run(migrations);
  };
};

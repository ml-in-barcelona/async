open Opium.Std;
open Async_app;

let static =
  Middleware.static(~local_path="./server/static", ~uri_prefix="/static", ());

/** Build the Opium app */
let app: Opium.App.t =
  App.empty
  |> App.cmd_name("Ocaml Webapp Tutorial")
  |> middleware(static)
  |> Db.middleware
  |> middleware(Handlers.m);
/* |> Handlers.four_o_four; */

let log_level = Some(Logs.Debug);

/** Configure the logger */
let set_logger = () =>
  /* Logs.set_reporter (Logs_fmt.reporter ()); */
  Logs.set_level(log_level);

/** Run the application */
let () = {
  set_logger();
  /* run_command' generates a CLI that configures a deferred run of the app */
  switch (App.run_command'(app)) {
  /* The deferred unit signals the deferred execution of the app */
  | `Ok(app: Lwt.t(unit)) => Lwt_main.run(app)
  | `Error => exit(1)
  | `Not_running => exit(0)
  };
};

open Async_app;

let drop_excerpts_table = [%rapper
  execute({sql|
    DROP TABLE excerpts
  |sql})
];

let rollbacks = [("drop excerpts table", drop_excerpts_table)];

let () =
  switch (Lwt_main.run(Db.Migration.execute(rollbacks))) {
  | Ok () => print_endline("Rollback complete")
  | Error(err) => failwith(err)
  };

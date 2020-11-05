type standard = [
  | `GET
  | `HEAD
  | `POST
  | `PUT
  | `DELETE
  | `CONNECT
  | `OPTIONS
  | `TRACE
];

type router('a) = {
  get: Routes.router('a),
  post: Routes.router('a),
};

let one_of = routes => {
  let routes = List.rev(routes);
  let (get, post) =
    List.fold_left(
      ((get, post), (meth, route)) =>
        switch (meth) {
        | `GET => ([route, ...get], post)
        | `POST => (get, [route, ...post])
        },
      ([], []),
      routes,
    );

  {get: Routes.one_of(get), post: Routes.one_of(post)};
};

let match' = (~meth, ~target, {get, post}) =>
  switch (meth) {
  | `GET => Routes.match'(~target, get)
  | `POST => Routes.match'(~target, post)
  | _ => None
  };

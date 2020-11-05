[@ocaml.warning "-44"];

open Routes;

module type T = {
  type request;

  type response;

  module Pages: {
    let root: request => response;

    let hello: (string, request) => response;

    let hello_fallback: request => response;

    let excerpts_add: request => response;

    let excerpts_by_author: (string, request) => response;

    let authors_with_excerpts: request => response;

    let counter: request => response;
  };

  module Api: {
    let authors_with_excerpts: request => response;

    let excerpts_by_author: (string, request) => response;

    let add_excerpt: request => response;
  };
};

module PageRoutes = {
  let authors_with_excerpts = () => s("authors") /? nil;

  let counter = () => s("counter") /? nil;
};

module ApiRoutes = {
  let authors_with_excerpts = () => s("api") / s("authors") /? nil;

  let excerpts_by_author = () =>
    s("api") / s("excerpts") / s("author") / str /? nil;

  let add_excerpt = () => s("api") / s("excerpts") / s("add") /? nil;
};

module Make = (Handlers: T) => {
  open Handlers;

  let routes = [
    (`GET, empty @--> Pages.root),
    (`GET, s("hello") / str /? nil @--> Pages.hello),
    (`GET, s("hello") /? nil @--> Pages.hello_fallback),
    (`GET, s("excerpts") / s("add") /? nil @--> Pages.excerpts_add),
    (
      `GET,
      s("excerpts") / s("author") / str /? nil @--> Pages.excerpts_by_author,
    ),
    (
      `GET,
      PageRoutes.authors_with_excerpts() @--> Pages.authors_with_excerpts,
    ),
    (`GET, PageRoutes.counter() @--> Pages.counter),
    (`GET, ApiRoutes.authors_with_excerpts() @--> Api.authors_with_excerpts),
    (`GET, ApiRoutes.excerpts_by_author() @--> Api.excerpts_by_author),
    (`POST, ApiRoutes.add_excerpt() @--> Api.add_excerpt),
  ];
};

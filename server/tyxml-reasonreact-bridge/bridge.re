module React = {
  let string = Tyxml.Html.txt;

  let list = a => a;

  let useState: (unit => 'state) => ('state, ('state => 'state) => unit) =
    f => (f(), _ => ());

  let useReducer:
    (('state, 'action) => 'state, 'state) => ('state, 'action => unit) =
    (_, s) => (s, _ => ());

  let useEffect0: (unit => option(unit => unit)) => unit = _ => ();

  let useEffect1: (unit => option(unit => unit), array('a)) => unit =
    (_, _) => ();
};

module Js = {
  module Global = {
    type timeoutId = unit;

    let clearTimeout: timeoutId => unit = _ => ();

    let setTimeout: (unit => unit, int) => timeoutId = (_, _) => ();
  };
};

module Dom = {
  open Tyxml.Html;

  let opt_concat = (f, el, list) =>
    switch (el) {
    | None => list
    | Some(el) => [f(el), ...list]
    };

  module Div = {
    let createElement = (~cls=?, ~children, ()) =>
      div(~a=[] |> opt_concat(cls => a_class([cls]), cls), children);
  };

  module Ul = {
    let createElement = (~cls=?, ~children, ()) =>
      ul(~a=[] |> opt_concat(cls => a_class([cls]), cls), children);
  };

  module Form = {
    let createElement = (~action=?, ~form_method=?, ~children, ()) =>
      form(
        ~a=
          []
          |> opt_concat(a_action, action)
          |> opt_concat(a_method, form_method),
        children,
      );
  };

  /** Input is needed as ReasonReact does not have a high level type for type_ attribute, it's just plain string */
  module Input = {
    let createElement = (~cls=?, ~input_type, ~name=?, ~value=?, ()) =>
      input(
        ~a=
          [a_input_type(input_type)]
          |> opt_concat(a_name, name)
          |> opt_concat(a_value, value)
          |> opt_concat(cls => a_class([cls]), cls),
        (),
      );
  };

  module P = {
    let createElement = (~children, ()) => p(children);
  };

  module Textarea = {
    let createElement = (~cls=?, ~name, ~value, ()) =>
      textarea(
        ~a=[a_name(name)] |> opt_concat(cls => a_class([cls]), cls),
        Tyxml.Html.txt(value),
      );
  };
};

(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
    pull: bool;
    push: bool;
    admin: bool;
} [@@deriving yojson { strict = false }, show ];;

let create (pull : bool) (push : bool) (admin : bool) : t = {
    pull = pull;
    push = push;
    admin = admin;
}

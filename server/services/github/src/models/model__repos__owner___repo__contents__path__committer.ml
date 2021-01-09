(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 * Schema Model__repos__owner___repo__contents__path__committer.t : The person that committed the file. Default: the authenticated user.
 *)

type t = {
    (* The name of the author or committer of the commit. You'll receive a `422` status code if `name` is omitted. *)
    name: string;
    (* The email of the author or committer of the commit. You'll receive a `422` status code if `email` is omitted. *)
    email: string;
    date: string option [@default None];
} [@@deriving yojson { strict = false }, show ];;

(** The person that committed the file. Default: the authenticated user. *)
let create (name : string) (email : string) : t = {
    name = name;
    email = email;
    date = None;
}

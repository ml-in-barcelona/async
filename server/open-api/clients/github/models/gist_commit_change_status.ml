(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
  total : int32 option; [@default None]
  additions : int32 option; [@default None]
  deletions : int32 option; [@default None]
}
[@@deriving yojson { strict = false }, show]

let create () : t = { total = None; additions = None; deletions = None }
(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
  url : string option; [@default None]
  sha : string option; [@default None]
}
[@@deriving yojson { strict = false }, show]

let create () : t = { url = None; sha = None }
(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
    deletions: int32 option [@default None];
    additions: int32 option [@default None];
    total: int32 option [@default None];
} [@@deriving yojson { strict = false }, show ];;

let create () : t = {
    deletions = None;
    additions = None;
    total = None;
}

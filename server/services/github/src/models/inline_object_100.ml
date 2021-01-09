(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
    (* The SHA1 value to set this reference to *)
    sha: string;
    (* Indicates whether to force the update or to make sure the update is a fast-forward update. Leaving this out or setting it to `false` will make sure you're not overwriting work. *)
    force: bool option [@default None];
} [@@deriving yojson { strict = false }, show ];;

let create (sha : string) : t = {
    sha = sha;
    force = None;
}

(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 * Schema Blob.t : Blob
 *)

type t = {
    content: string;
    encoding: string;
    url: string;
    sha: string;
    size: int32 option;
    node_id: string;
    highlighted_content: string option [@default None];
} [@@deriving yojson { strict = false }, show ];;

(** Blob *)
let create (content : string) (encoding : string) (url : string) (sha : string) (size : int32 option) (node_id : string) : t = {
    content = content;
    encoding = encoding;
    url = url;
    sha = sha;
    size = size;
    node_id = node_id;
    highlighted_content = None;
}

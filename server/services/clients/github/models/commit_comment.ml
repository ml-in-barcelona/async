(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 * Schema Commit_comment.t : Commit Comment
 *)

type t = {
  html_url : string;
  url : string;
  id : int32;
  node_id : string;
  body : string;
  path : string option;
  position : int32 option;
  line : int32 option;
  commit_id : string;
  user : Simple_user.t option;
  created_at : string;
  updated_at : string;
  author_association : string;
  reactions : Reaction_rollup.t option; [@default None]
}
[@@deriving yojson { strict = false }, show]

(** Commit Comment *)
let create (html_url : string) (url : string) (id : int32) (node_id : string)
    (body : string) (path : string option) (position : int32 option)
    (line : int32 option) (commit_id : string) (user : Simple_user.t option)
    (created_at : string) (updated_at : string) (author_association : string) :
    t =
  {
    html_url;
    url;
    id;
    node_id;
    body;
    path;
    position;
    line;
    commit_id;
    user;
    created_at;
    updated_at;
    author_association;
    reactions = None;
  }
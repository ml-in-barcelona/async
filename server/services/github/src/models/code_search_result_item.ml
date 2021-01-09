(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 * Schema Code_search_result_item.t : Code Search Result Item
 *)

type t = {
    name: string;
    path: string;
    sha: string;
    url: string;
    git_url: string;
    html_url: string;
    repository: Minimal_repository.t;
    score: int32;
    file_size: int32 option [@default None];
    language: string option [@default None];
    last_modified_at: string option [@default None];
    line_numbers: string list;
    text_matches: Yojson.Safe.t list;
} [@@deriving yojson { strict = false }, show ];;

(** Code Search Result Item *)
let create (name : string) (path : string) (sha : string) (url : string) (git_url : string) (html_url : string) (repository : Minimal_repository.t) (score : int32) : t = {
    name = name;
    path = path;
    sha = sha;
    url = url;
    git_url = git_url;
    html_url = html_url;
    repository = repository;
    score = score;
    file_size = None;
    language = None;
    last_modified_at = None;
    line_numbers = [];
    text_matches = [];
}

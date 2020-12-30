(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
  (* The commit message *)
  message : string;
  (* The SHA of the tree object this commit points to *)
  tree : string;
  (* The SHAs of the commits that were the parents of this commit. If omitted or empty, the commit will be written as a root commit. For a single parent, an array of one SHA should be provided; for a merge commit, an array of more than one should be provided. *)
  parents : string list;
  author : Model__repos__owner___repo__git_commits_author.t option;
      [@default None]
  committer : Model__repos__owner___repo__git_commits_committer.t option;
      [@default None]
  (* The [PGP signature](https://en.wikipedia.org/wiki/Pretty_Good_Privacy) of the commit. GitHub adds the signature to the `gpgsig` header of the created commit. For a commit signature to be verifiable by Git or GitHub, it must be an ASCII-armored detached PGP signature over the string commit as it would be written to the object database. To pass a `signature` parameter, you need to first manually create a valid PGP signature, which can be complicated. You may find it easier to [use the command line](https://git-scm.com/book/id/v2/Git-Tools-Signing-Your-Work) to create signed commits. *)
  signature : string option; [@default None]
}
[@@deriving yojson { strict = false }, show]

let create (message : string) (tree : string) : t =
  {
    message;
    tree;
    parents = [];
    author = None;
    committer = None;
    signature = None;
  }
(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
    comments: Link.t;
    commits: Link.t;
    statuses: Link.t;
    html: Link.t;
    issue: Link.t;
    review_comments: Link.t;
    review_comment: Link.t;
    self: Link.t;
} [@@deriving yojson { strict = false }, show ];;

let create (comments : Link.t) (commits : Link.t) (statuses : Link.t) (html : Link.t) (issue : Link.t) (review_comments : Link.t) (review_comment : Link.t) (self : Link.t) : t = {
    comments = comments;
    commits = commits;
    statuses = statuses;
    html = html;
    issue = issue;
    review_comments = review_comments;
    review_comment = review_comment;
    self = self;
}

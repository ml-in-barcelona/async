(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 * Schema Project.t : Projects are a way to organize columns and cards of work.
 *)

type t = {
    owner_url: string;
    url: string;
    html_url: string;
    columns_url: string;
    id: int32;
    node_id: string;
    (* Name of the project *)
    name: string;
    (* Body of the project *)
    body: string option;
    number: int32;
    (* State of the project; either 'open' or 'closed' *)
    state: string;
    creator: Simple_user.t option;
    created_at: string;
    updated_at: string;
    (* The baseline permission that all organization members have on this project *)
    organization_permission: Enums.organization_permission option [@default None];
    (* Whether or not this project can be seen by everyone. *)
    _private: bool option [@default None];
    cards_url: string option [@default None];
    permissions: Project_permissions.t option [@default None];
} [@@deriving yojson { strict = false }, show ];;

(** Projects are a way to organize columns and cards of work. *)
let create (owner_url : string) (url : string) (html_url : string) (columns_url : string) (id : int32) (node_id : string) (name : string) (body : string option) (number : int32) (state : string) (creator : Simple_user.t option) (created_at : string) (updated_at : string) : t = {
    owner_url = owner_url;
    url = url;
    html_url = html_url;
    columns_url = columns_url;
    id = id;
    node_id = node_id;
    name = name;
    body = body;
    number = number;
    state = state;
    creator = creator;
    created_at = created_at;
    updated_at = updated_at;
    organization_permission = None;
    _private = None;
    cards_url = None;
    permissions = None;
}

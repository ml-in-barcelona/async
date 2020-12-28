(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
  _type : string option; [@default None]
  id : int32 option; [@default None]
  name : string option; [@default None]
  active : bool option; [@default None]
  events : string list;
  config : Global_hook_2_config.t option; [@default None]
  updated_at : string option; [@default None]
  created_at : string option; [@default None]
  url : string option; [@default None]
  ping_url : string option; [@default None]
}
[@@deriving yojson { strict = false }, show]

let create () : t =
  {
    _type = None;
    id = None;
    name = None;
    active = None;
    events = [];
    config = None;
    updated_at = None;
    created_at = None;
    url = None;
    ping_url = None;
  }
(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
  (* The security alert number. *)
  number : int32 option; [@default None]
  (* The time that the alert was created in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`. *)
  created_at : string option; [@default None]
  (* The REST API URL of the alert resource. *)
  url : string option; [@default None]
  (* The GitHub URL of the alert resource. *)
  html_url : string option; [@default None]
  instances : Yojson.Safe.t list;
  state : Enums.code_scanning_alert_state option; [@default None]
  dismissed_by : Simple_user.t option; [@default None]
  (* The time that the alert was dismissed in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`. *)
  dismissed_at : string option; [@default None]
  (* **Required when the state is dismissed.** The reason for dismissing or closing the alert. Can be one of: `false positive`, `won't fix`, and `used in tests`. *)
  dismissed_reason : string option; [@default None]
  rule : Code_scanning_alert_rule.t option; [@default None]
  tool : Code_scanning_analysis_tool.t option; [@default None]
}
[@@deriving yojson { strict = false }, show]

let create () : t =
  {
    number = None;
    created_at = None;
    url = None;
    html_url = None;
    instances = [];
    state = None;
    dismissed_by = None;
    dismissed_at = None;
    dismissed_reason = None;
    rule = None;
    tool = None;
  }
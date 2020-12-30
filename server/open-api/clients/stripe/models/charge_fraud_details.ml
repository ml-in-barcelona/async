(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
  (* Assessments from Stripe. If set, the value is `fraudulent`. *)
  stripe_report : string option; [@default None]
  (* Assessments reported by you. If set, possible values of are `safe` and `fraudulent`. *)
  user_report : string option; [@default None]
}
[@@deriving yojson { strict = false }, show]

let create () : t = { stripe_report = None; user_report = None }
(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
  (* The ID of the Charge that generated this PaymentMethod, if any. *)
  charge : Any_ofstringcharge.t option; [@default None]
  (* The ID of the SetupAttempt that generated this PaymentMethod, if any. *)
  setup_attempt : Any_ofstringsetup_attempt.t option; [@default None]
}
[@@deriving yojson { strict = false }, show]

let create () : t = { charge = None; setup_attempt = None }
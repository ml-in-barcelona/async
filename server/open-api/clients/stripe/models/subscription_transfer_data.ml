(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
  (* A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the destination account. By default, the entire amount is transferred to the destination. *)
  amount_percent : float option; [@default None]
  (* The account where funds from the payment will be transferred to upon payment success. *)
  destination : Any_ofstringaccount.t;
}
[@@deriving yojson { strict = false }, show]

let create (destination : Any_ofstringaccount.t) : t =
  { amount_percent = None; destination }
(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
    (* Whether the cardholder provided an address first line and if it matched the cardholder’s `billing.address.line1`. *)
    address_line1_check: Enums.address_line1_check;
    (* Whether the cardholder provided a postal code and if it matched the cardholder’s `billing.address.postal_code`. *)
    address_postal_code_check: Enums.address_line1_check;
    (* Whether the cardholder provided a CVC and if it matched Stripe’s record. *)
    cvc_check: Enums.address_line1_check;
    (* Whether the cardholder provided an expiry date and if it matched Stripe’s record. *)
    expiry_check: Enums.address_line1_check;
} [@@deriving yojson { strict = false }, show ];;

let create (address_line1_check : Enums.address_line1_check) (address_postal_code_check : Enums.address_line1_check) (cvc_check : Enums.address_line1_check) (expiry_check : Enums.address_line1_check) : t = {
    address_line1_check = address_line1_check;
    address_postal_code_check = address_postal_code_check;
    cvc_check = cvc_check;
    expiry_check = expiry_check;
}

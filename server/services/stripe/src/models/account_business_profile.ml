(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
    (* [The merchant category code for the account](https://stripe.com/docs/connect/setting-mcc). MCCs are used to classify businesses based on the goods or services they provide. *)
    mcc: string option [@default None];
    (* The customer-facing business name. *)
    name: string option [@default None];
    (* Internal-only description of the product sold or service provided by the business. It's used by Stripe for risk and underwriting purposes. *)
    product_description: string option [@default None];
    (* A publicly available mailing address for sending support issues to. *)
    support_address: Any_ofaddress.t option [@default None];
    (* A publicly available email address for sending support issues to. *)
    support_email: string option [@default None];
    (* A publicly available phone number to call with support issues. *)
    support_phone: string option [@default None];
    (* A publicly available website for handling support issues. *)
    support_url: string option [@default None];
    (* The business's publicly available website. *)
    url: string option [@default None];
} [@@deriving yojson { strict = false }, show ];;

let create () : t = {
    mcc = None;
    name = None;
    product_description = None;
    support_address = None;
    support_email = None;
    support_phone = None;
    support_url = None;
    url = None;
}

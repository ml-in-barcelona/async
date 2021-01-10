(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
    (* The total invoice amount threshold boundary if it triggered the threshold invoice. *)
    amount_gte: int32 option [@default None];
    (* Indicates which line items triggered a threshold invoice. *)
    item_reasons: Invoice_item_threshold_reason.t list;
} [@@deriving yojson { strict = false }, show ];;

let create (item_reasons : Invoice_item_threshold_reason.t list) : t = {
    amount_gte = None;
    item_reasons = item_reasons;
}

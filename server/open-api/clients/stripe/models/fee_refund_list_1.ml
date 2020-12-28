(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 * Schema Fee_refund_list_1.t : A list of refunds that have been applied to the fee.
 *)

type t = {
  (* Details about each object. *)
  data : Fee_refund.t list;
  (* True if this list has another page of items after this one that can be fetched. *)
  has_more : bool;
  (* String representing the object's type. Objects of the same type share the same value. Always has the value `list`. *)
  _object : Enums.listaccountcapability_object; [@default `List]
  (* The URL where this list can be accessed. *)
  url : string;
}
[@@deriving yojson { strict = false }, show]

(** A list of refunds that have been applied to the fee. *)
let create (data : Fee_refund.t list) (has_more : bool)
    (_object : Enums.listaccountcapability_object) (url : string) : t =
  { data; has_more; _object; url }
(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
    (* The amount, in %s, of the discount. *)
    amount: int32;
    (* The discount that was applied to get this discount amount. *)
    discount: Any_ofstringdiscountdeleted_discount.t;
} [@@deriving yojson { strict = false }, show ];;

let create (amount : int32) (discount : Any_ofstringdiscountdeleted_discount.t) : t = {
    amount = amount;
    discount = discount;
}

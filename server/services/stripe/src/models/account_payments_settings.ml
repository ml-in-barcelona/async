(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
    (* The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge. *)
    statement_descriptor: string option [@default None];
    (* The Kana variation of the default text that appears on credit card statements when a charge is made (Japan only) *)
    statement_descriptor_kana: string option [@default None];
    (* The Kanji variation of the default text that appears on credit card statements when a charge is made (Japan only) *)
    statement_descriptor_kanji: string option [@default None];
} [@@deriving yojson { strict = false }, show ];;

let create () : t = {
    statement_descriptor = None;
    statement_descriptor_kana = None;
    statement_descriptor_kanji = None;
}

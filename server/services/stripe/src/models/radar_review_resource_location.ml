(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
    (* The city where the payment originated. *)
    city: string option [@default None];
    (* Two-letter ISO code representing the country where the payment originated. *)
    country: string option [@default None];
    (* The geographic latitude where the payment originated. *)
    latitude: float option [@default None];
    (* The geographic longitude where the payment originated. *)
    longitude: float option [@default None];
    (* The state/county/province/region where the payment originated. *)
    region: string option [@default None];
} [@@deriving yojson { strict = false }, show ];;

let create () : t = {
    city = None;
    country = None;
    latitude = None;
    longitude = None;
    region = None;
}

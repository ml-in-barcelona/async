(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

val codes_of_conduct_get_all_codes_of_conduct :
  unit -> Code_of_conduct.t list Lwt.t

val codes_of_conduct_get_conduct_code : key:string -> Code_of_conduct.t Lwt.t

val codes_of_conduct_get_for_repo :
  owner:string -> repo:string -> Code_of_conduct.t Lwt.t
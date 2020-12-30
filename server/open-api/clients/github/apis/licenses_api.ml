(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

let licenses_get ~license =
  let open Lwt in
  let uri = Request.build_uri "/licenses/{license}" in
  let headers = Request.default_headers in
  let uri = Request.replace_path_param uri "license" (fun x -> x) license in
  Cohttp_lwt_unix.Client.call `GET uri ~headers >>= fun (resp, body) ->
  Request.read_json_body_as (JsonSupport.unwrap License.of_yojson) resp body

let licenses_get_all_commonly_used ?featured ?(per_page = 30l) () =
  let open Lwt in
  let uri = Request.build_uri "/licenses" in
  let headers = Request.default_headers in
  let uri =
    Request.maybe_add_query_param uri "featured" string_of_bool featured
  in
  let uri = Request.add_query_param uri "per_page" Int32.to_string per_page in
  Cohttp_lwt_unix.Client.call `GET uri ~headers >>= fun (resp, body) ->
  Request.read_json_body_as_list_of
    (JsonSupport.unwrap License_simple.of_yojson)
    resp body

let licenses_get_for_repo ~owner ~repo =
  let open Lwt in
  let uri = Request.build_uri "/repos/{owner}/{repo}/license" in
  let headers = Request.default_headers in
  let uri = Request.replace_path_param uri "owner" (fun x -> x) owner in
  let uri = Request.replace_path_param uri "repo" (fun x -> x) repo in
  Cohttp_lwt_unix.Client.call `GET uri ~headers >>= fun (resp, body) ->
  Request.read_json_body_as
    (JsonSupport.unwrap License_content.of_yojson)
    resp body
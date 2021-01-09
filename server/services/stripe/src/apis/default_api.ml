let get_account ?(expand = []) () =
    let open Lwt in
    let uri = Request.build_uri "/v1/account" in
    let headers = Request.default_headers in
    let uri = Request.add_query_param_list uri "expand" (List.map (fun x -> x)) expand in
    Cohttp_lwt_unix.Client.call `GET uri ~headers >>= fun (resp, body) ->
    Request.read_json_body_as (JsonSupport.unwrap Account.of_yojson) resp body

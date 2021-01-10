(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 *)

type t = {
    (* The browser used in this browser session (e.g., `Chrome`). *)
    browser: string option [@default None];
    (* Information about the device used for the browser session (e.g., `Samsung SM-G930T`). *)
    device: string option [@default None];
    (* The platform for the browser session (e.g., `Macintosh`). *)
    platform: string option [@default None];
    (* The version for the browser session (e.g., `61.0.3163.100`). *)
    version: string option [@default None];
} [@@deriving yojson { strict = false }, show ];;

let create () : t = {
    browser = None;
    device = None;
    platform = None;
    version = None;
}

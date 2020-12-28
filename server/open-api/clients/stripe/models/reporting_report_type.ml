(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 * Schema Reporting_report_type.t : The Report Type resource corresponds to a particular type of report, such as the \''Activity summary\'' or \''Itemized payouts\'' reports. These objects are identified by an ID belonging to a set of enumerated values. See [API Access to Reports documentation](https://stripe.com/docs/reporting/statements/api) for those Report Type IDs, along with required and optional parameters.  Note that reports can only be run based on your live-mode data (not test-mode data), and thus related requests must be made with a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).
 *)

type t = {
  (* Most recent time for which this Report Type is available. Measured in seconds since the Unix epoch. *)
  data_available_end : int32;
  (* Earliest time for which this Report Type is available. Measured in seconds since the Unix epoch. *)
  data_available_start : int32;
  (* List of column names that are included by default when this Report Type gets run. (If the Report Type doesn't support the `columns` parameter, this will be null.) *)
  default_columns : string list;
  (* The [ID of the Report Type](https://stripe.com/docs/reporting/statements/api#available-report-types), such as `balance.summary.1`. *)
  id : string;
  (* Human-readable name of the Report Type *)
  name : string;
  (* String representing the object's type. Objects of the same type share the same value. *)
  _object : Enums.reporting_report_type_object;
      [@default `ReportingPeriodreport_type]
  (* When this Report Type was latest updated. Measured in seconds since the Unix epoch. *)
  updated : int32;
  (* Version of the Report Type. Different versions report with the same ID will have the same purpose, but may take different run parameters or have different result schemas. *)
  version : int32;
}
[@@deriving yojson { strict = false }, show]

(** The Report Type resource corresponds to a particular type of report, such as the \''Activity summary\'' or \''Itemized payouts\'' reports. These objects are identified by an ID belonging to a set of enumerated values. See [API Access to Reports documentation](https://stripe.com/docs/reporting/statements/api) for those Report Type IDs, along with required and optional parameters.  Note that reports can only be run based on your live-mode data (not test-mode data), and thus related requests must be made with a [live-mode API key](https://stripe.com/docs/keys#test-live-modes). *)
let create (data_available_end : int32) (data_available_start : int32)
    (id : string) (name : string) (_object : Enums.reporting_report_type_object)
    (updated : int32) (version : int32) : t =
  {
    data_available_end;
    data_available_start;
    default_columns = [];
    id;
    name;
    _object;
    updated;
    version;
  }
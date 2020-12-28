(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 * Schema Bank_account.t : These bank accounts are payment methods on `Customer` objects.  On the other hand [External Accounts](https://stripe.com/docs/api#external_accounts) are transfer destinations on `Account` objects for [Custom accounts](https://stripe.com/docs/connect/custom-accounts). They can be bank accounts or debit cards as well, and are documented in the links above.  Related guide: [Bank Debits and Transfers](https://stripe.com/docs/payments/bank-debits-transfers).
 *)

type t = {
  (* The ID of the account that the bank account is associated with. *)
  account : Any_ofstringaccount.t option; [@default None]
  (* The name of the person or business that owns the bank account. *)
  account_holder_name : string option; [@default None]
  (* The type of entity that holds the account. This can be either `individual` or `company`. *)
  account_holder_type : string option; [@default None]
  (* A set of available payout methods for this bank account. Only values from this set should be passed as the `method` when creating a payout. *)
  available_payout_methods : Enums.available_payout_methods list;
  (* Name of the bank associated with the routing number (e.g., `WELLS FARGO`). *)
  bank_name : string option; [@default None]
  (* Two-letter ISO code representing the country the bank account is located in. *)
  country : string;
  (* Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account. *)
  currency : string;
  (* The ID of the customer that the bank account is associated with. *)
  customer : Any_ofstringcustomerdeleted_customer.t option; [@default None]
  (* Whether this bank account is the default external account for its currency. *)
  default_for_currency : bool option; [@default None]
  (* Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. *)
  fingerprint : string option; [@default None]
  (* Unique identifier for the object. *)
  id : string;
  (* The last four digits of the bank account number. *)
  last4 : string;
  (* Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. *)
  metadata : (string * string) list;
  (* String representing the object's type. Objects of the same type share the same value. *)
  _object : Enums.bank_account_object; [@default `Bank_account]
  (* The routing transit number for the bank account. *)
  routing_number : string option; [@default None]
  (* For bank accounts, possible values are `new`, `validated`, `verified`, `verification_failed`, or `errored`. A bank account that hasn't had any activity or validation performed is `new`. If Stripe can determine that the bank account exists, its status will be `validated`. Note that there often isn’t enough information to know (e.g., for smaller credit unions), and the validation is not always run. If customer bank account verification has succeeded, the bank account status will be `verified`. If the verification failed for any reason, such as microdeposit failure, the status will be `verification_failed`. If a transfer sent to this bank account fails, we'll set the status to `errored` and will not continue to send transfers until the bank details are updated.  For external accounts, possible values are `new` and `errored`. Validations aren't run against external accounts because they're only used for payouts. This means the other statuses don't apply. If a transfer fails, the status is set to `errored` and transfers are stopped until account details are updated. *)
  status : string;
}
[@@deriving yojson { strict = false }, show]

(** These bank accounts are payment methods on `Customer` objects.  On the other hand [External Accounts](https://stripe.com/docs/api#external_accounts) are transfer destinations on `Account` objects for [Custom accounts](https://stripe.com/docs/connect/custom-accounts). They can be bank accounts or debit cards as well, and are documented in the links above.  Related guide: [Bank Debits and Transfers](https://stripe.com/docs/payments/bank-debits-transfers). *)
let create (country : string) (currency : string) (id : string) (last4 : string)
    (_object : Enums.bank_account_object) (status : string) : t =
  {
    account = None;
    account_holder_name = None;
    account_holder_type = None;
    available_payout_methods = [];
    bank_name = None;
    country;
    currency;
    customer = None;
    default_for_currency = None;
    fingerprint = None;
    id;
    last4;
    metadata = [];
    _object;
    routing_number = None;
    status;
  }
(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 * Schema Issuing_card.t : You can [create physical or virtual cards](https://stripe.com/docs/issuing/cards) that are issued to cardholders.
 *)

type t = {
  (* The brand of the card. *)
  brand : string;
  (* The reason why the card was canceled. *)
  cancellation_reason : Enums.issuing_card_cancellation_reason option;
      [@default None]
  cardholder : Issuing_cardholder.t;
  (* Time at which the object was created. Measured in seconds since the Unix epoch. *)
  created : int32;
  (* Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). *)
  currency : string;
  (* The card's CVC. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available via the [\''Retrieve a card\'' endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not via \''List all cards\'' or any other endpoint. *)
  cvc : string option; [@default None]
  (* The expiration month of the card. *)
  exp_month : int32;
  (* The expiration year of the card. *)
  exp_year : int32;
  (* Unique identifier for the object. *)
  id : string;
  (* The last 4 digits of the card number. *)
  last4 : string;
  (* Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode. *)
  livemode : bool;
  (* Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. *)
  metadata : (string * string) list;
  (* The full unredacted card number. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available via the [\''Retrieve a card\'' endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not via \''List all cards\'' or any other endpoint. *)
  number : string option; [@default None]
  (* String representing the object's type. Objects of the same type share the same value. *)
  _object : Enums.issuing_card_object; [@default `IssuingPeriodcard]
  (* The latest card that replaces this card, if any. *)
  replaced_by : Any_ofstringissuing_card.t option; [@default None]
  (* The card this card replaces, if any. *)
  replacement_for : Any_ofstringissuing_card.t option; [@default None]
  (* The reason why the previous card needed to be replaced. *)
  replacement_reason : Enums.replacement_reason option; [@default None]
  (* Where and how the card will be shipped. *)
  shipping : Any_ofissuing_card_shipping.t option; [@default None]
  spending_controls : Issuing_card_authorization_controls.t;
  (* Whether authorizations can be approved on this card. *)
  status : Enums.issuing_card_status;
  (* The type of the card. *)
  _type : Enums.issuing_card_type;
}
[@@deriving yojson { strict = false }, show]

(** You can [create physical or virtual cards](https://stripe.com/docs/issuing/cards) that are issued to cardholders. *)
let create (brand : string) (cardholder : Issuing_cardholder.t)
    (created : int32) (currency : string) (exp_month : int32) (exp_year : int32)
    (id : string) (last4 : string) (livemode : bool)
    (metadata : (string * string) list) (_object : Enums.issuing_card_object)
    (spending_controls : Issuing_card_authorization_controls.t)
    (status : Enums.issuing_card_status) (_type : Enums.issuing_card_type) : t =
  {
    brand;
    cancellation_reason = None;
    cardholder;
    created;
    currency;
    cvc = None;
    exp_month;
    exp_year;
    id;
    last4;
    livemode;
    metadata;
    number = None;
    _object;
    replaced_by = None;
    replacement_for = None;
    replacement_reason = None;
    shipping = None;
    spending_controls;
    status;
    _type;
  }
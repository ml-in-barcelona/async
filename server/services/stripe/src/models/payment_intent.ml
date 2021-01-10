(*
 * This file has been generated by the OCamlClientCodegen generator for openapi-generator.
 *
 * Generated by: https://openapi-generator.tech
 *
 * Schema Payment_intent.t : A PaymentIntent guides you through the process of collecting a payment from your customer. We recommend that you create exactly one PaymentIntent for each order or customer session in your system. You can reference the PaymentIntent later to see the history of payment attempts for a particular session.  A PaymentIntent transitions through [multiple statuses](https://stripe.com/docs/payments/intents#intent-statuses) throughout its lifetime as it interfaces with Stripe.js to perform authentication flows and ultimately creates at most one successful charge.  Related guide: [Payment Intents API](https://stripe.com/docs/payments/payment-intents).
 *)

type t = {
    (* Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99). *)
    amount: int32;
    (* Amount that can be captured from this PaymentIntent. *)
    amount_capturable: int32 option [@default None];
    (* Amount that was collected by this PaymentIntent. *)
    amount_received: int32 option [@default None];
    (* ID of the Connect application that created the PaymentIntent. *)
    application: Any_ofstringapplication.t option [@default None];
    (* The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total payment amount. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts). *)
    application_fee_amount: int32 option [@default None];
    (* Populated when `status` is `canceled`, this is the time at which the PaymentIntent was canceled. Measured in seconds since the Unix epoch. *)
    canceled_at: int32 option [@default None];
    (* Reason for cancellation of this PaymentIntent, either user-provided (`duplicate`, `fraudulent`, `requested_by_customer`, or `abandoned`) or generated by Stripe internally (`failed_invoice`, `void_invoice`, or `automatic`). *)
    cancellation_reason: Enums.payment_intent_cancellation_reason option [@default None];
    (* Controls when the funds will be captured from the customer's account. *)
    capture_method: Enums.capture_method;
    charges: Payment_flows_payment_intent_resource_charge_list.t option [@default None];
    (* The client secret of this PaymentIntent. Used for client-side retrieval using a publishable key.   The client secret can be used to complete a payment from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.  Refer to our docs to [accept a payment](https://stripe.com/docs/payments/accept-a-payment?integration=elements) and learn about how `client_secret` should be handled. *)
    client_secret: string option [@default None];
    confirmation_method: Enums.capture_method;
    (* Time at which the object was created. Measured in seconds since the Unix epoch. *)
    created: int32;
    (* Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). *)
    currency: string;
    (* ID of the Customer this PaymentIntent belongs to, if one exists.  Payment methods attached to other Customers cannot be used with this PaymentIntent.  If present in combination with [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage), this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent has been confirmed and any required actions from the user are complete. *)
    customer: Any_ofstringcustomerdeleted_customer.t option [@default None];
    (* An arbitrary string attached to the object. Often useful for displaying to users. *)
    description: string option [@default None];
    (* Unique identifier for the object. *)
    id: string;
    (* ID of the invoice that created this PaymentIntent, if it exists. *)
    invoice: Any_ofstringinvoice.t option [@default None];
    (* The payment error encountered in the previous PaymentIntent confirmation. It will be cleared if the PaymentIntent is later updated for any reason. *)
    last_payment_error: Any_ofapi_errors.t option [@default None];
    (* Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode. *)
    livemode: bool;
    (* Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. For more information, see the [documentation](https://stripe.com/docs/payments/payment-intents/creating-payment-intents#storing-information-in-metadata). *)
    metadata: (string * string) list;
    (* If present, this property tells you what actions you need to take in order for your customer to fulfill a payment using the provided source. *)
    next_action: Any_ofpayment_intent_next_action.t option [@default None];
    (* String representing the object's type. Objects of the same type share the same value. *)
    _object: Enums.payment_intent_object[@default `Payment_intent];
    (* The account (if any) for which the funds of the PaymentIntent are intended. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details. *)
    on_behalf_of: Any_ofstringaccount.t option [@default None];
    (* ID of the payment method used in this PaymentIntent. *)
    payment_method: Any_ofstringpayment_method.t option [@default None];
    (* Payment-method-specific configuration for this PaymentIntent. *)
    payment_method_options: Any_ofpayment_intent_payment_method_options.t option [@default None];
    (* The list of payment method types (e.g. card) that this PaymentIntent is allowed to use. *)
    payment_method_types: string list;
    (* Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails). *)
    receipt_email: string option [@default None];
    (* ID of the review associated with this PaymentIntent, if any. *)
    review: Any_ofstringreview.t option [@default None];
    (* Indicates that you intend to make future payments with this PaymentIntent's payment method.  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication). *)
    setup_future_usage: Enums.payment_intent_setup_future_usage option [@default None];
    (* Shipping information for this PaymentIntent. *)
    shipping: Any_ofshipping.t option [@default None];
    (* For non-card charges, you can use this value as the complete description that appears on your customers’ statements. Must contain at least one letter, maximum 22 characters. *)
    statement_descriptor: string option [@default None];
    (* Provides information about a card payment that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor. *)
    statement_descriptor_suffix: string option [@default None];
    (* Status of this PaymentIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `requires_capture`, `canceled`, or `succeeded`. Read more about each PaymentIntent [status](https://stripe.com/docs/payments/intents#intent-statuses). *)
    status: Enums.payment_intent_status;
    (* The data with which to automatically create a Transfer when the payment is finalized. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details. *)
    transfer_data: Any_oftransfer_data.t option [@default None];
    (* A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details. *)
    transfer_group: string option [@default None];
} [@@deriving yojson { strict = false }, show ];;

(** A PaymentIntent guides you through the process of collecting a payment from your customer. We recommend that you create exactly one PaymentIntent for each order or customer session in your system. You can reference the PaymentIntent later to see the history of payment attempts for a particular session.  A PaymentIntent transitions through [multiple statuses](https://stripe.com/docs/payments/intents#intent-statuses) throughout its lifetime as it interfaces with Stripe.js to perform authentication flows and ultimately creates at most one successful charge.  Related guide: [Payment Intents API](https://stripe.com/docs/payments/payment-intents). *)
let create (amount : int32) (capture_method : Enums.capture_method) (confirmation_method : Enums.capture_method) (created : int32) (currency : string) (id : string) (livemode : bool) (_object : Enums.payment_intent_object) (payment_method_types : string list) (status : Enums.payment_intent_status) : t = {
    amount = amount;
    amount_capturable = None;
    amount_received = None;
    application = None;
    application_fee_amount = None;
    canceled_at = None;
    cancellation_reason = None;
    capture_method = capture_method;
    charges = None;
    client_secret = None;
    confirmation_method = confirmation_method;
    created = created;
    currency = currency;
    customer = None;
    description = None;
    id = id;
    invoice = None;
    last_payment_error = None;
    livemode = livemode;
    metadata = [];
    next_action = None;
    _object = _object;
    on_behalf_of = None;
    payment_method = None;
    payment_method_options = None;
    payment_method_types = payment_method_types;
    receipt_email = None;
    review = None;
    setup_future_usage = None;
    shipping = None;
    statement_descriptor = None;
    statement_descriptor_suffix = None;
    status = status;
    transfer_data = None;
    transfer_group = None;
}

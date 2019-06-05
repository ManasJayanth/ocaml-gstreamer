open Ctypes
open Foreign

type t = Unsupported_protocol | Bad_uri | Bad_state | Bad_reference

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unsupported_protocol
  else if v = Unsigned.UInt32.of_int 1 then Bad_uri
  else if v = Unsigned.UInt32.of_int 2 then Bad_state
  else if v = Unsigned.UInt32.of_int 3 then Bad_reference
  else raise (Invalid_argument "Unexpected URIError value")

let to_value = function
  | Unsupported_protocol -> Unsigned.UInt32.of_int 0
  | Bad_uri -> Unsigned.UInt32.of_int 1
  | Bad_state -> Unsigned.UInt32.of_int 2
  | Bad_reference -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t


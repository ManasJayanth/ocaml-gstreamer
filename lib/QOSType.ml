open Ctypes
open Foreign

type t = Overflow | Underflow | Throttle

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Overflow
  else if v = Unsigned.UInt32.of_int 1 then Underflow
  else if v = Unsigned.UInt32.of_int 2 then Throttle
  else raise (Invalid_argument "Unexpected QOSType value")

let to_value = function
  | Overflow -> Unsigned.UInt32.of_int 0
  | Underflow -> Unsigned.UInt32.of_int 1
  | Throttle -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


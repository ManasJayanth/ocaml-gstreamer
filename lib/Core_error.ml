open Ctypes
open Foreign

type t = Failed | Too_lazy | Not_implemented | State_change | Pad | Thread | Negotiation | Event | Seek | Caps | Tag | Missing_plugin | Clock | Disabled | Num_errors

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Failed
  else if v = Unsigned.UInt32.of_int 2 then Too_lazy
  else if v = Unsigned.UInt32.of_int 3 then Not_implemented
  else if v = Unsigned.UInt32.of_int 4 then State_change
  else if v = Unsigned.UInt32.of_int 5 then Pad
  else if v = Unsigned.UInt32.of_int 6 then Thread
  else if v = Unsigned.UInt32.of_int 7 then Negotiation
  else if v = Unsigned.UInt32.of_int 8 then Event
  else if v = Unsigned.UInt32.of_int 9 then Seek
  else if v = Unsigned.UInt32.of_int 10 then Caps
  else if v = Unsigned.UInt32.of_int 11 then Tag
  else if v = Unsigned.UInt32.of_int 12 then Missing_plugin
  else if v = Unsigned.UInt32.of_int 13 then Clock
  else if v = Unsigned.UInt32.of_int 14 then Disabled
  else if v = Unsigned.UInt32.of_int 15 then Num_errors
  else raise (Invalid_argument "Unexpected Core_error value")

let to_value = function
  | Failed -> Unsigned.UInt32.of_int 1
  | Too_lazy -> Unsigned.UInt32.of_int 2
  | Not_implemented -> Unsigned.UInt32.of_int 3
  | State_change -> Unsigned.UInt32.of_int 4
  | Pad -> Unsigned.UInt32.of_int 5
  | Thread -> Unsigned.UInt32.of_int 6
  | Negotiation -> Unsigned.UInt32.of_int 7
  | Event -> Unsigned.UInt32.of_int 8
  | Seek -> Unsigned.UInt32.of_int 9
  | Caps -> Unsigned.UInt32.of_int 10
  | Tag -> Unsigned.UInt32.of_int 11
  | Missing_plugin -> Unsigned.UInt32.of_int 12
  | Clock -> Unsigned.UInt32.of_int 13
  | Disabled -> Unsigned.UInt32.of_int 14
  | Num_errors -> Unsigned.UInt32.of_int 15

let t_view = view ~read:of_value ~write:to_value uint32_t


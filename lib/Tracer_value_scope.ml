open Ctypes
open Foreign

type t = Process | Thread | Element | Pad

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Process
  else if v = Unsigned.UInt32.of_int 1 then Thread
  else if v = Unsigned.UInt32.of_int 2 then Element
  else if v = Unsigned.UInt32.of_int 3 then Pad
  else raise (Invalid_argument "Unexpected Tracer_value_scope value")

let to_value = function
  | Process -> Unsigned.UInt32.of_int 0
  | Thread -> Unsigned.UInt32.of_int 1
  | Element -> Unsigned.UInt32.of_int 2
  | Pad -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t


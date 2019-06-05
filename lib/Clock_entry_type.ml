open Ctypes
open Foreign

type t = Single | Periodic

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Single
  else if v = Unsigned.UInt32.of_int 1 then Periodic
  else raise (Invalid_argument "Unexpected Clock_entry_type value")

let to_value = function
  | Single -> Unsigned.UInt32.of_int 0
  | Periodic -> Unsigned.UInt32.of_int 1

let t_view = view ~read:of_value ~write:to_value uint32_t


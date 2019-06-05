open Ctypes
open Foreign

type t = Done | Ok | Resync | Error

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Done
  else if v = Unsigned.UInt32.of_int 1 then Ok
  else if v = Unsigned.UInt32.of_int 2 then Resync
  else if v = Unsigned.UInt32.of_int 3 then Error
  else raise (Invalid_argument "Unexpected Iterator_result value")

let to_value = function
  | Done -> Unsigned.UInt32.of_int 0
  | Ok -> Unsigned.UInt32.of_int 1
  | Resync -> Unsigned.UInt32.of_int 2
  | Error -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t


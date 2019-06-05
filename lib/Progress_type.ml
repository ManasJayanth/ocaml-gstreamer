open Ctypes
open Foreign

type t = Start | Continue | Complete | Canceled | Error

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Start
  else if v = Unsigned.UInt32.of_int 1 then Continue
  else if v = Unsigned.UInt32.of_int 2 then Complete
  else if v = Unsigned.UInt32.of_int 3 then Canceled
  else if v = Unsigned.UInt32.of_int 4 then Error
  else raise (Invalid_argument "Unexpected Progress_type value")

let to_value = function
  | Start -> Unsigned.UInt32.of_int 0
  | Continue -> Unsigned.UInt32.of_int 1
  | Complete -> Unsigned.UInt32.of_int 2
  | Canceled -> Unsigned.UInt32.of_int 3
  | Error -> Unsigned.UInt32.of_int 4

let t_view = view ~read:of_value ~write:to_value uint32_t


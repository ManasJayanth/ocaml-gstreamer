open Ctypes
open Foreign

type t = Failure | Success | Async | No_preroll

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Failure
  else if v = Unsigned.UInt32.of_int 1 then Success
  else if v = Unsigned.UInt32.of_int 2 then Async
  else if v = Unsigned.UInt32.of_int 3 then No_preroll
  else raise (Invalid_argument "Unexpected State_change_return value")

let to_value = function
  | Failure -> Unsigned.UInt32.of_int 0
  | Success -> Unsigned.UInt32.of_int 1
  | Async -> Unsigned.UInt32.of_int 2
  | No_preroll -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t


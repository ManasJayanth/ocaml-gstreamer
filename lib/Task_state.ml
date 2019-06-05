open Ctypes
open Foreign

type t = Started | Stopped | Paused

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Started
  else if v = Unsigned.UInt32.of_int 1 then Stopped
  else if v = Unsigned.UInt32.of_int 2 then Paused
  else raise (Invalid_argument "Unexpected Task_state value")

let to_value = function
  | Started -> Unsigned.UInt32.of_int 0
  | Stopped -> Unsigned.UInt32.of_int 1
  | Paused -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


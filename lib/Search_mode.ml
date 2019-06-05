open Ctypes
open Foreign

type t = Exact | Before | After

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Exact
  else if v = Unsigned.UInt32.of_int 1 then Before
  else if v = Unsigned.UInt32.of_int 2 then After
  else raise (Invalid_argument "Unexpected Search_mode value")

let to_value = function
  | Exact -> Unsigned.UInt32.of_int 0
  | Before -> Unsigned.UInt32.of_int 1
  | After -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


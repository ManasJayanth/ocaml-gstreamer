open Ctypes
open Foreign

type t = None | Push | Pull

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Push
  else if v = Unsigned.UInt32.of_int 2 then Pull
  else raise (Invalid_argument "Unexpected Pad_mode value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | Push -> Unsigned.UInt32.of_int 1
  | Pull -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


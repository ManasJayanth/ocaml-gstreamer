open Ctypes
open Foreign

type t = Off | On | Unix

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Off
  else if v = Unsigned.UInt32.of_int 1 then On
  else if v = Unsigned.UInt32.of_int 2 then Unix
  else raise (Invalid_argument "Unexpected Debug_color_mode value")

let to_value = function
  | Off -> Unsigned.UInt32.of_int 0
  | On -> Unsigned.UInt32.of_int 1
  | Unix -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


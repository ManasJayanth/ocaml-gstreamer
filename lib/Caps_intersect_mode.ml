open Ctypes
open Foreign

type t = Zig_zag | First

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Zig_zag
  else if v = Unsigned.UInt32.of_int 1 then First
  else raise (Invalid_argument "Unexpected Caps_intersect_mode value")

let to_value = function
  | Zig_zag -> Unsigned.UInt32.of_int 0
  | First -> Unsigned.UInt32.of_int 1

let t_view = view ~read:of_value ~write:to_value uint32_t


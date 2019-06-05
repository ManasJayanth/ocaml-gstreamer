open Ctypes
open Foreign

type t = Stream | Global

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Stream
  else if v = Unsigned.UInt32.of_int 1 then Global
  else raise (Invalid_argument "Unexpected Tag_scope value")

let to_value = function
  | Stream -> Unsigned.UInt32.of_int 0
  | Global -> Unsigned.UInt32.of_int 1

let t_view = view ~read:of_value ~write:to_value uint32_t


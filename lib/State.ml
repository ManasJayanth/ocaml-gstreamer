open Ctypes
open Foreign

type t = Void_pending | Null | Ready | Paused | Playing

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Void_pending
  else if v = Unsigned.UInt32.of_int 1 then Null
  else if v = Unsigned.UInt32.of_int 2 then Ready
  else if v = Unsigned.UInt32.of_int 3 then Paused
  else if v = Unsigned.UInt32.of_int 4 then Playing
  else raise (Invalid_argument "Unexpected State value")

let to_value = function
  | Void_pending -> Unsigned.UInt32.of_int 0
  | Null -> Unsigned.UInt32.of_int 1
  | Ready -> Unsigned.UInt32.of_int 2
  | Paused -> Unsigned.UInt32.of_int 3
  | Playing -> Unsigned.UInt32.of_int 4

let t_view = view ~read:of_value ~write:to_value uint32_t


open Ctypes
open Foreign

type t = Unknown | Src | Sink

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unknown
  else if v = Unsigned.UInt32.of_int 1 then Src
  else if v = Unsigned.UInt32.of_int 2 then Sink
  else raise (Invalid_argument "Unexpected Pad_direction value")

let to_value = function
  | Unknown -> Unsigned.UInt32.of_int 0
  | Src -> Unsigned.UInt32.of_int 1
  | Sink -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


open Ctypes
open Foreign

type t = Unknown | Sink | Src

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unknown
  else if v = Unsigned.UInt32.of_int 1 then Sink
  else if v = Unsigned.UInt32.of_int 2 then Src
  else raise (Invalid_argument "Unexpected URIType value")

let to_value = function
  | Unknown -> Unsigned.UInt32.of_int 0
  | Sink -> Unsigned.UInt32.of_int 1
  | Src -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


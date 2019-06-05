open Ctypes
open Foreign

type t = Undefined | Default | Bytes | Time | Buffers | Percent

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Undefined
  else if v = Unsigned.UInt32.of_int 1 then Default
  else if v = Unsigned.UInt32.of_int 2 then Bytes
  else if v = Unsigned.UInt32.of_int 3 then Time
  else if v = Unsigned.UInt32.of_int 4 then Buffers
  else if v = Unsigned.UInt32.of_int 5 then Percent
  else raise (Invalid_argument "Unexpected Format value")

let to_value = function
  | Undefined -> Unsigned.UInt32.of_int 0
  | Default -> Unsigned.UInt32.of_int 1
  | Bytes -> Unsigned.UInt32.of_int 2
  | Time -> Unsigned.UInt32.of_int 3
  | Buffers -> Unsigned.UInt32.of_int 4
  | Percent -> Unsigned.UInt32.of_int 5

let t_view = view ~read:of_value ~write:to_value uint32_t


open Ctypes
open Foreign

type t = Global | Current

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Global
  else if v = Unsigned.UInt32.of_int 2 then Current
  else raise (Invalid_argument "Unexpected Toc_scope value")

let to_value = function
  | Global -> Unsigned.UInt32.of_int 1
  | Current -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


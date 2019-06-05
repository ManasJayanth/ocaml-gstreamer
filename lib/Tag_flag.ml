open Ctypes
open Foreign

type t = Undefined | Meta | Encoded | Decoded | Count

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Undefined
  else if v = Unsigned.UInt32.of_int 1 then Meta
  else if v = Unsigned.UInt32.of_int 2 then Encoded
  else if v = Unsigned.UInt32.of_int 3 then Decoded
  else if v = Unsigned.UInt32.of_int 4 then Count
  else raise (Invalid_argument "Unexpected Tag_flag value")

let to_value = function
  | Undefined -> Unsigned.UInt32.of_int 0
  | Meta -> Unsigned.UInt32.of_int 1
  | Encoded -> Unsigned.UInt32.of_int 2
  | Decoded -> Unsigned.UInt32.of_int 3
  | Count -> Unsigned.UInt32.of_int 4

let t_view = view ~read:of_value ~write:to_value uint32_t


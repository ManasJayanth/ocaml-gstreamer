open Ctypes
open Foreign

type t = Undefined | Replace_all | Replace | Append | Prepend | Keep | Keep_all | Count

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Undefined
  else if v = Unsigned.UInt32.of_int 1 then Replace_all
  else if v = Unsigned.UInt32.of_int 2 then Replace
  else if v = Unsigned.UInt32.of_int 3 then Append
  else if v = Unsigned.UInt32.of_int 4 then Prepend
  else if v = Unsigned.UInt32.of_int 5 then Keep
  else if v = Unsigned.UInt32.of_int 6 then Keep_all
  else if v = Unsigned.UInt32.of_int 7 then Count
  else raise (Invalid_argument "Unexpected Tag_merge_mode value")

let to_value = function
  | Undefined -> Unsigned.UInt32.of_int 0
  | Replace_all -> Unsigned.UInt32.of_int 1
  | Replace -> Unsigned.UInt32.of_int 2
  | Append -> Unsigned.UInt32.of_int 3
  | Prepend -> Unsigned.UInt32.of_int 4
  | Keep -> Unsigned.UInt32.of_int 5
  | Keep_all -> Unsigned.UInt32.of_int 6
  | Count -> Unsigned.UInt32.of_int 7

let t_view = view ~read:of_value ~write:to_value uint32_t


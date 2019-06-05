open Ctypes
open Foreign

type t = None | Error | Warning | Fixme | Info | Debug | Log | Trace | Memdump | Count

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Error
  else if v = Unsigned.UInt32.of_int 2 then Warning
  else if v = Unsigned.UInt32.of_int 3 then Fixme
  else if v = Unsigned.UInt32.of_int 4 then Info
  else if v = Unsigned.UInt32.of_int 5 then Debug
  else if v = Unsigned.UInt32.of_int 6 then Log
  else if v = Unsigned.UInt32.of_int 7 then Trace
  else if v = Unsigned.UInt32.of_int 9 then Memdump
  else if v = Unsigned.UInt32.of_int 10 then Count
  else raise (Invalid_argument "Unexpected Debug_level value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | Error -> Unsigned.UInt32.of_int 1
  | Warning -> Unsigned.UInt32.of_int 2
  | Fixme -> Unsigned.UInt32.of_int 3
  | Info -> Unsigned.UInt32.of_int 4
  | Debug -> Unsigned.UInt32.of_int 5
  | Log -> Unsigned.UInt32.of_int 6
  | Trace -> Unsigned.UInt32.of_int 7
  | Memdump -> Unsigned.UInt32.of_int 9
  | Count -> Unsigned.UInt32.of_int 10

let t_view = view ~read:of_value ~write:to_value uint32_t


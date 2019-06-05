open Ctypes
open Foreign

type t = Pending | Interrupted | Replied | Expired

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Pending
  else if v = Unsigned.UInt32.of_int 1 then Interrupted
  else if v = Unsigned.UInt32.of_int 2 then Replied
  else if v = Unsigned.UInt32.of_int 3 then Expired
  else raise (Invalid_argument "Unexpected Promise_result value")

let to_value = function
  | Pending -> Unsigned.UInt32.of_int 0
  | Interrupted -> Unsigned.UInt32.of_int 1
  | Replied -> Unsigned.UInt32.of_int 2
  | Expired -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t


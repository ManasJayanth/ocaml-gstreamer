open Ctypes
open Foreign

type t = Drop | Pass | Async

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Drop
  else if v = Unsigned.UInt32.of_int 1 then Pass
  else if v = Unsigned.UInt32.of_int 2 then Async
  else raise (Invalid_argument "Unexpected Bus_sync_reply value")

let to_value = function
  | Drop -> Unsigned.UInt32.of_int 0
  | Pass -> Unsigned.UInt32.of_int 1
  | Async -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


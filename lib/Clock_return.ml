open Ctypes
open Foreign

type t = Ok | Early | Unscheduled | Busy | Badtime | Error | Unsupported | Done

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Ok
  else if v = Unsigned.UInt32.of_int 1 then Early
  else if v = Unsigned.UInt32.of_int 2 then Unscheduled
  else if v = Unsigned.UInt32.of_int 3 then Busy
  else if v = Unsigned.UInt32.of_int 4 then Badtime
  else if v = Unsigned.UInt32.of_int 5 then Error
  else if v = Unsigned.UInt32.of_int 6 then Unsupported
  else if v = Unsigned.UInt32.of_int 7 then Done
  else raise (Invalid_argument "Unexpected Clock_return value")

let to_value = function
  | Ok -> Unsigned.UInt32.of_int 0
  | Early -> Unsigned.UInt32.of_int 1
  | Unscheduled -> Unsigned.UInt32.of_int 2
  | Busy -> Unsigned.UInt32.of_int 3
  | Badtime -> Unsigned.UInt32.of_int 4
  | Error -> Unsigned.UInt32.of_int 5
  | Unsupported -> Unsigned.UInt32.of_int 6
  | Done -> Unsigned.UInt32.of_int 7

let t_view = view ~read:of_value ~write:to_value uint32_t


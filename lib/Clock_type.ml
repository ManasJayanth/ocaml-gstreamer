open Ctypes
open Foreign

type t = Realtime | Monotonic | Other

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Realtime
  else if v = Unsigned.UInt32.of_int 1 then Monotonic
  else if v = Unsigned.UInt32.of_int 2 then Other
  else raise (Invalid_argument "Unexpected Clock_type value")

let to_value = function
  | Realtime -> Unsigned.UInt32.of_int 0
  | Monotonic -> Unsigned.UInt32.of_int 1
  | Other -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


open Ctypes
open Foreign

type t = Drop | Ok | Remove | Pass | Handled

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Drop
  else if v = Unsigned.UInt32.of_int 1 then Ok
  else if v = Unsigned.UInt32.of_int 2 then Remove
  else if v = Unsigned.UInt32.of_int 3 then Pass
  else if v = Unsigned.UInt32.of_int 4 then Handled
  else raise (Invalid_argument "Unexpected Pad_probe_return value")

let to_value = function
  | Drop -> Unsigned.UInt32.of_int 0
  | Ok -> Unsigned.UInt32.of_int 1
  | Remove -> Unsigned.UInt32.of_int 2
  | Pass -> Unsigned.UInt32.of_int 3
  | Handled -> Unsigned.UInt32.of_int 4

let t_view = view ~read:of_value ~write:to_value uint32_t


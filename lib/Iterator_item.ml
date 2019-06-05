open Ctypes
open Foreign

type t = Skip | Pass | End

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Skip
  else if v = Unsigned.UInt32.of_int 1 then Pass
  else if v = Unsigned.UInt32.of_int 2 then End
  else raise (Invalid_argument "Unexpected Iterator_item value")

let to_value = function
  | Skip -> Unsigned.UInt32.of_int 0
  | Pass -> Unsigned.UInt32.of_int 1
  | End -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


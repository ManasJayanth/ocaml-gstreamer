open Ctypes
open Foreign

type t = Link | Unlink

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Link
  else if v = Unsigned.UInt32.of_int 1 then Unlink
  else raise (Invalid_argument "Unexpected Structure_change_type value")

let to_value = function
  | Link -> Unsigned.UInt32.of_int 0
  | Unlink -> Unsigned.UInt32.of_int 1

let t_view = view ~read:of_value ~write:to_value uint32_t


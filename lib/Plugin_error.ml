open Ctypes
open Foreign

type t = Module | Dependencies | Name_mismatch

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Module
  else if v = Unsigned.UInt32.of_int 1 then Dependencies
  else if v = Unsigned.UInt32.of_int 2 then Name_mismatch
  else raise (Invalid_argument "Unexpected Plugin_error value")

let to_value = function
  | Module -> Unsigned.UInt32.of_int 0
  | Dependencies -> Unsigned.UInt32.of_int 1
  | Name_mismatch -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


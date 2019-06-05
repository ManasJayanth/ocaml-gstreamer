open Ctypes
open Foreign

type t = None | Marginal | Secondary | Primary

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 64 then Marginal
  else if v = Unsigned.UInt32.of_int 128 then Secondary
  else if v = Unsigned.UInt32.of_int 256 then Primary
  else raise (Invalid_argument "Unexpected Rank value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | Marginal -> Unsigned.UInt32.of_int 64
  | Secondary -> Unsigned.UInt32.of_int 128
  | Primary -> Unsigned.UInt32.of_int 256

let t_view = view ~read:of_value ~write:to_value uint32_t


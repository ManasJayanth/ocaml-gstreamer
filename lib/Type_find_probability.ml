open Ctypes
open Foreign

type t = None | Minimum | Possible | Likely | Nearly_certain | Maximum

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Minimum
  else if v = Unsigned.UInt32.of_int 50 then Possible
  else if v = Unsigned.UInt32.of_int 80 then Likely
  else if v = Unsigned.UInt32.of_int 99 then Nearly_certain
  else if v = Unsigned.UInt32.of_int 100 then Maximum
  else raise (Invalid_argument "Unexpected Type_find_probability value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | Minimum -> Unsigned.UInt32.of_int 1
  | Possible -> Unsigned.UInt32.of_int 50
  | Likely -> Unsigned.UInt32.of_int 80
  | Nearly_certain -> Unsigned.UInt32.of_int 99
  | Maximum -> Unsigned.UInt32.of_int 100

let t_view = view ~read:of_value ~write:to_value uint32_t


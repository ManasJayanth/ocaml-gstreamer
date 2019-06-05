open Ctypes
open Foreign

type t = Ok | Wrong_hierarchy | Was_linked | Wrong_direction | Noformat | Nosched | Refused

let of_value v =
  if v = Int32.of_int 0 then Ok
  else if v = Int32.of_int (-1) then Wrong_hierarchy
  else if v = Int32.of_int (-2) then Was_linked
  else if v = Int32.of_int (-3) then Wrong_direction
  else if v = Int32.of_int (-4) then Noformat
  else if v = Int32.of_int (-5) then Nosched
  else if v = Int32.of_int (-6) then Refused
  else raise (Invalid_argument "Unexpected Pad_link_return value")

let to_value = function
  | Ok -> Int32.of_int 0
  | Wrong_hierarchy -> Int32.of_int (-1)
  | Was_linked -> Int32.of_int (-2)
  | Wrong_direction -> Int32.of_int (-3)
  | Noformat -> Int32.of_int (-4)
  | Nosched -> Int32.of_int (-5)
  | Refused -> Int32.of_int (-6)

let t_view = view ~read:of_value ~write:to_value int32_t


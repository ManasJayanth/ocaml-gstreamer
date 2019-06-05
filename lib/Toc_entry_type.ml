open Ctypes
open Foreign

type t = Angle | Version | Edition | Invalid | Title | Track | Chapter

let of_value v =
  if v = Int32.of_int (-3) then Angle
  else if v = Int32.of_int (-2) then Version
  else if v = Int32.of_int (-1) then Edition
  else if v = Int32.of_int 0 then Invalid
  else if v = Int32.of_int 1 then Title
  else if v = Int32.of_int 2 then Track
  else if v = Int32.of_int 3 then Chapter
  else raise (Invalid_argument "Unexpected Toc_entry_type value")

let to_value = function
  | Angle -> Int32.of_int (-3)
  | Version -> Int32.of_int (-2)
  | Edition -> Int32.of_int (-1)
  | Invalid -> Int32.of_int 0
  | Title -> Int32.of_int 1
  | Track -> Int32.of_int 2
  | Chapter -> Int32.of_int 3

let t_view = view ~read:of_value ~write:to_value int32_t


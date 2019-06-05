open Ctypes
open Foreign

type t = Syntax | No_such_element | No_such_property | Link | Could_not_set_property | Empty_bin | Empty | Delayed_link

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Syntax
  else if v = Unsigned.UInt32.of_int 1 then No_such_element
  else if v = Unsigned.UInt32.of_int 2 then No_such_property
  else if v = Unsigned.UInt32.of_int 3 then Link
  else if v = Unsigned.UInt32.of_int 4 then Could_not_set_property
  else if v = Unsigned.UInt32.of_int 5 then Empty_bin
  else if v = Unsigned.UInt32.of_int 6 then Empty
  else if v = Unsigned.UInt32.of_int 7 then Delayed_link
  else raise (Invalid_argument "Unexpected Parse_error value")

let to_value = function
  | Syntax -> Unsigned.UInt32.of_int 0
  | No_such_element -> Unsigned.UInt32.of_int 1
  | No_such_property -> Unsigned.UInt32.of_int 2
  | Link -> Unsigned.UInt32.of_int 3
  | Could_not_set_property -> Unsigned.UInt32.of_int 4
  | Empty_bin -> Unsigned.UInt32.of_int 5
  | Empty -> Unsigned.UInt32.of_int 6
  | Delayed_link -> Unsigned.UInt32.of_int 7

let t_view = view ~read:of_value ~write:to_value uint32_t


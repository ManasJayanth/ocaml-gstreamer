open Ctypes
open Foreign

type t = Failed | Too_lazy | Init | Shutdown | Settings | Encode | Num_errors

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Failed
  else if v = Unsigned.UInt32.of_int 2 then Too_lazy
  else if v = Unsigned.UInt32.of_int 3 then Init
  else if v = Unsigned.UInt32.of_int 4 then Shutdown
  else if v = Unsigned.UInt32.of_int 5 then Settings
  else if v = Unsigned.UInt32.of_int 6 then Encode
  else if v = Unsigned.UInt32.of_int 7 then Num_errors
  else raise (Invalid_argument "Unexpected Library_error value")

let to_value = function
  | Failed -> Unsigned.UInt32.of_int 1
  | Too_lazy -> Unsigned.UInt32.of_int 2
  | Init -> Unsigned.UInt32.of_int 3
  | Shutdown -> Unsigned.UInt32.of_int 4
  | Settings -> Unsigned.UInt32.of_int 5
  | Encode -> Unsigned.UInt32.of_int 6
  | Num_errors -> Unsigned.UInt32.of_int 7

let t_view = view ~read:of_value ~write:to_value uint32_t


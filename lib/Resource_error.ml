open Ctypes
open Foreign

type t = Failed | Too_lazy | Not_found | Busy | Open_read | Open_write | Open_read_write | Close | Read | Write | Seek | Sync | Settings | No_space_left | Not_authorized | Num_errors

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Failed
  else if v = Unsigned.UInt32.of_int 2 then Too_lazy
  else if v = Unsigned.UInt32.of_int 3 then Not_found
  else if v = Unsigned.UInt32.of_int 4 then Busy
  else if v = Unsigned.UInt32.of_int 5 then Open_read
  else if v = Unsigned.UInt32.of_int 6 then Open_write
  else if v = Unsigned.UInt32.of_int 7 then Open_read_write
  else if v = Unsigned.UInt32.of_int 8 then Close
  else if v = Unsigned.UInt32.of_int 9 then Read
  else if v = Unsigned.UInt32.of_int 10 then Write
  else if v = Unsigned.UInt32.of_int 11 then Seek
  else if v = Unsigned.UInt32.of_int 12 then Sync
  else if v = Unsigned.UInt32.of_int 13 then Settings
  else if v = Unsigned.UInt32.of_int 14 then No_space_left
  else if v = Unsigned.UInt32.of_int 15 then Not_authorized
  else if v = Unsigned.UInt32.of_int 16 then Num_errors
  else raise (Invalid_argument "Unexpected Resource_error value")

let to_value = function
  | Failed -> Unsigned.UInt32.of_int 1
  | Too_lazy -> Unsigned.UInt32.of_int 2
  | Not_found -> Unsigned.UInt32.of_int 3
  | Busy -> Unsigned.UInt32.of_int 4
  | Open_read -> Unsigned.UInt32.of_int 5
  | Open_write -> Unsigned.UInt32.of_int 6
  | Open_read_write -> Unsigned.UInt32.of_int 7
  | Close -> Unsigned.UInt32.of_int 8
  | Read -> Unsigned.UInt32.of_int 9
  | Write -> Unsigned.UInt32.of_int 10
  | Seek -> Unsigned.UInt32.of_int 11
  | Sync -> Unsigned.UInt32.of_int 12
  | Settings -> Unsigned.UInt32.of_int 13
  | No_space_left -> Unsigned.UInt32.of_int 14
  | Not_authorized -> Unsigned.UInt32.of_int 15
  | Num_errors -> Unsigned.UInt32.of_int 16

let t_view = view ~read:of_value ~write:to_value uint32_t


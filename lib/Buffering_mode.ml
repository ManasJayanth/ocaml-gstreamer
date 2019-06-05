open Ctypes
open Foreign

type t = Stream | Download | Timeshift | Live

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Stream
  else if v = Unsigned.UInt32.of_int 1 then Download
  else if v = Unsigned.UInt32.of_int 2 then Timeshift
  else if v = Unsigned.UInt32.of_int 3 then Live
  else raise (Invalid_argument "Unexpected Buffering_mode value")

let to_value = function
  | Stream -> Unsigned.UInt32.of_int 0
  | Download -> Unsigned.UInt32.of_int 1
  | Timeshift -> Unsigned.UInt32.of_int 2
  | Live -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t


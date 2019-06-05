open Ctypes
open Foreign

type t = None | Forward | Reverse | Ping_pong

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Forward
  else if v = Unsigned.UInt32.of_int 2 then Reverse
  else if v = Unsigned.UInt32.of_int 3 then Ping_pong
  else raise (Invalid_argument "Unexpected Toc_loop_type value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | Forward -> Unsigned.UInt32.of_int 1
  | Reverse -> Unsigned.UInt32.of_int 2
  | Ping_pong -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t


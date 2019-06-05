open Ctypes
open Foreign

type t = Always | Sometimes | Request

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Always
  else if v = Unsigned.UInt32.of_int 1 then Sometimes
  else if v = Unsigned.UInt32.of_int 2 then Request
  else raise (Invalid_argument "Unexpected Pad_presence value")

let to_value = function
  | Always -> Unsigned.UInt32.of_int 0
  | Sometimes -> Unsigned.UInt32.of_int 1
  | Request -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t


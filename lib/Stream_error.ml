open Ctypes
open Foreign

type t = Failed | Too_lazy | Not_implemented | Type_not_found | Wrong_type | Codec_not_found | Decode | Encode | Demux | Mux | Format | Decrypt | Decrypt_nokey | Num_errors

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Failed
  else if v = Unsigned.UInt32.of_int 2 then Too_lazy
  else if v = Unsigned.UInt32.of_int 3 then Not_implemented
  else if v = Unsigned.UInt32.of_int 4 then Type_not_found
  else if v = Unsigned.UInt32.of_int 5 then Wrong_type
  else if v = Unsigned.UInt32.of_int 6 then Codec_not_found
  else if v = Unsigned.UInt32.of_int 7 then Decode
  else if v = Unsigned.UInt32.of_int 8 then Encode
  else if v = Unsigned.UInt32.of_int 9 then Demux
  else if v = Unsigned.UInt32.of_int 10 then Mux
  else if v = Unsigned.UInt32.of_int 11 then Format
  else if v = Unsigned.UInt32.of_int 12 then Decrypt
  else if v = Unsigned.UInt32.of_int 13 then Decrypt_nokey
  else if v = Unsigned.UInt32.of_int 14 then Num_errors
  else raise (Invalid_argument "Unexpected Stream_error value")

let to_value = function
  | Failed -> Unsigned.UInt32.of_int 1
  | Too_lazy -> Unsigned.UInt32.of_int 2
  | Not_implemented -> Unsigned.UInt32.of_int 3
  | Type_not_found -> Unsigned.UInt32.of_int 4
  | Wrong_type -> Unsigned.UInt32.of_int 5
  | Codec_not_found -> Unsigned.UInt32.of_int 6
  | Decode -> Unsigned.UInt32.of_int 7
  | Encode -> Unsigned.UInt32.of_int 8
  | Demux -> Unsigned.UInt32.of_int 9
  | Mux -> Unsigned.UInt32.of_int 10
  | Format -> Unsigned.UInt32.of_int 11
  | Decrypt -> Unsigned.UInt32.of_int 12
  | Decrypt_nokey -> Unsigned.UInt32.of_int 13
  | Num_errors -> Unsigned.UInt32.of_int 14

let t_view = view ~read:of_value ~write:to_value uint32_t


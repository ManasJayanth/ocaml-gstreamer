open Ctypes
open Foreign

type t = Null_to_ready | Ready_to_paused | Paused_to_playing | Playing_to_paused | Paused_to_ready | Ready_to_null | Null_to_null | Ready_to_ready | Paused_to_paused | Playing_to_playing

let of_value v =
  if v = Unsigned.UInt32.of_int 10 then Null_to_ready
  else if v = Unsigned.UInt32.of_int 19 then Ready_to_paused
  else if v = Unsigned.UInt32.of_int 28 then Paused_to_playing
  else if v = Unsigned.UInt32.of_int 35 then Playing_to_paused
  else if v = Unsigned.UInt32.of_int 26 then Paused_to_ready
  else if v = Unsigned.UInt32.of_int 17 then Ready_to_null
  else if v = Unsigned.UInt32.of_int 9 then Null_to_null
  else if v = Unsigned.UInt32.of_int 18 then Ready_to_ready
  else if v = Unsigned.UInt32.of_int 27 then Paused_to_paused
  else if v = Unsigned.UInt32.of_int 36 then Playing_to_playing
  else raise (Invalid_argument "Unexpected State_change value")

let to_value = function
  | Null_to_ready -> Unsigned.UInt32.of_int 10
  | Ready_to_paused -> Unsigned.UInt32.of_int 19
  | Paused_to_playing -> Unsigned.UInt32.of_int 28
  | Playing_to_paused -> Unsigned.UInt32.of_int 35
  | Paused_to_ready -> Unsigned.UInt32.of_int 26
  | Ready_to_null -> Unsigned.UInt32.of_int 17
  | Null_to_null -> Unsigned.UInt32.of_int 9
  | Ready_to_ready -> Unsigned.UInt32.of_int 18
  | Paused_to_paused -> Unsigned.UInt32.of_int 27
  | Playing_to_playing -> Unsigned.UInt32.of_int 36

let t_view = view ~read:of_value ~write:to_value uint32_t


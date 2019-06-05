open Ctypes
open Foreign

type t = Create | Enter | Leave | Destroy | Start | Pause | Stop

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Create
  else if v = Unsigned.UInt32.of_int 1 then Enter
  else if v = Unsigned.UInt32.of_int 2 then Leave
  else if v = Unsigned.UInt32.of_int 3 then Destroy
  else if v = Unsigned.UInt32.of_int 8 then Start
  else if v = Unsigned.UInt32.of_int 9 then Pause
  else if v = Unsigned.UInt32.of_int 10 then Stop
  else raise (Invalid_argument "Unexpected Stream_status_type value")

let to_value = function
  | Create -> Unsigned.UInt32.of_int 0
  | Enter -> Unsigned.UInt32.of_int 1
  | Leave -> Unsigned.UInt32.of_int 2
  | Destroy -> Unsigned.UInt32.of_int 3
  | Start -> Unsigned.UInt32.of_int 8
  | Pause -> Unsigned.UInt32.of_int 9
  | Stop -> Unsigned.UInt32.of_int 10

let t_view = view ~read:of_value ~write:to_value uint32_t


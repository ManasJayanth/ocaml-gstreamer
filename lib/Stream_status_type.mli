open Ctypes

type t = Create | Enter | Leave | Destroy | Start | Pause | Stop

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


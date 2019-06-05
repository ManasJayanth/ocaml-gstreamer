open Ctypes

type t = Void_pending | Null | Ready | Paused | Playing

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


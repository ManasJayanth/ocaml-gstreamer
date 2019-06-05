open Ctypes

type t = Null_to_ready | Ready_to_paused | Paused_to_playing | Playing_to_paused | Paused_to_ready | Ready_to_null | Null_to_null | Ready_to_ready | Paused_to_paused | Playing_to_playing

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


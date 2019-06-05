open Ctypes

type t = Ok | Wrong_hierarchy | Was_linked | Wrong_direction | Noformat | Nosched | Refused

val of_value:
  int32 -> t

val to_value:
  t -> int32

val t_view: t typ


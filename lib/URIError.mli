open Ctypes

type t = Unsupported_protocol | Bad_uri | Bad_state | Bad_reference

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


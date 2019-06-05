open Ctypes

type t = Undefined | Replace_all | Replace | Append | Prepend | Keep | Keep_all | Count

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


open Ctypes

type t = Undefined | Meta | Encoded | Decoded | Count

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


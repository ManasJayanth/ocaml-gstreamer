open Ctypes

type t = None | Minimum | Possible | Likely | Nearly_certain | Maximum

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


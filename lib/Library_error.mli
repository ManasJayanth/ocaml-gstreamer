open Ctypes

type t = Failed | Too_lazy | Init | Shutdown | Settings | Encode | Num_errors

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


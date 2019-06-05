open Ctypes

type t = None | Error | Warning | Fixme | Info | Debug | Log | Trace | Memdump | Count

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


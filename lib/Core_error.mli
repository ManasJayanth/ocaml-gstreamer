open Ctypes

type t = Failed | Too_lazy | Not_implemented | State_change | Pad | Thread | Negotiation | Event | Seek | Caps | Tag | Missing_plugin | Clock | Disabled | Num_errors

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


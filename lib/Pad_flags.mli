open Ctypes

type t = Blocked | Flushing | Eos | Blocking | Need_parent | Need_reconfigure | Pending_events | Fixed_caps | Proxy_caps | Proxy_allocation | Proxy_scheduling | Accept_intersect | Accept_template | Last
type t_list = t list

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val list_of_value:
  Unsigned.uint32 -> t_list

val list_to_value:
  t_list -> Unsigned.uint32

val t_list_view : t_list typ


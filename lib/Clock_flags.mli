open Ctypes

type t = Can_do_single_sync | Can_do_single_async | Can_do_periodic_sync | Can_do_periodic_async | Can_set_resolution | Can_set_master | Needs_startup_sync | Last
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


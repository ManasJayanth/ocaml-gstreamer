open Ctypes

type t = Failed | Too_lazy | Not_found | Busy | Open_read | Open_write | Open_read_write | Close | Read | Write | Seek | Sync | Settings | No_space_left | Not_authorized | Num_errors

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


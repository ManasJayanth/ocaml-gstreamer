open Ctypes

type t = Syntax | No_such_element | No_such_property | Link | Could_not_set_property | Empty_bin | Empty | Delayed_link

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


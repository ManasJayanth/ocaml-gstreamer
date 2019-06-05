open Ctypes

type t = Fg_black | Fg_red | Fg_green | Fg_yellow | Fg_blue | Fg_magenta | Fg_cyan | Fg_white | Bg_black | Bg_red | Bg_green | Bg_yellow | Bg_blue | Bg_magenta | Bg_cyan | Bg_white | Bold | Underline
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


open Ctypes

type t
val t_typ : t typ

val create :
  string option -> t ptr
val add_stream :
  t ptr -> Stream.t ptr -> bool
val get_size :
  t ptr -> Unsigned.uint32
val get_stream :
  t ptr -> Unsigned.uint32 -> Stream.t ptr option
val get_upstream_id :
  t ptr -> string option

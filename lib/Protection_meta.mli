open Ctypes

type t
val t_typ : t structure typ

val f_meta: (Meta.t structure, t structure) field
val f_info: (Structure.t structure ptr, t structure) field

val get_info :
  unit -> Meta_info.t structure ptr

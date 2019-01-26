open Ctypes

type t
val t_typ : t structure typ

val f_parent: (Meta.t structure, t structure) field
(* val f_buffer: (Buffer.t structure ptr, t structure) field *)

val get_info :
  unit -> Meta_info.t structure ptr

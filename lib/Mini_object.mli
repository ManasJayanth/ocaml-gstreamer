open Ctypes

type t
val t_typ : t structure typ

(*Struct field Mini_object : gType tag not implemented*)
val f_refcount: (int32, t structure) field
val f_lockstate: (int32, t structure) field
val f_flags: (Unsigned.uint32, t structure) field
val f_copy: (unit ptr, t structure) field
(*Struct field Mini_object : callback tag not implemented*)
(*Struct field Mini_object : callback tag not implemented*)
val f_n_qdata: (Unsigned.uint32, t structure) field
val f_qdata: (unit ptr, t structure) field

val get_qdata :
  t structure ptr -> Unsigned.uint32 -> unit ptr option
val is_writable :
  t structure ptr -> bool
val lock :
  t structure ptr -> Lock_flags.t_list -> bool
(*Not implemented gst_mini_object_set_qdata type callback not implemented*)
val steal_qdata :
  t structure ptr -> Unsigned.uint32 -> unit ptr option
val unlock :
  t structure ptr -> Lock_flags.t_list -> unit
val replace :
  t structure ptr option -> t structure ptr option -> (bool * t structure ptr option)
(* val take :
 *   t structure ptr -> t structure ptr -> (bool * t structure ptr) *)

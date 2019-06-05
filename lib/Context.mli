open Ctypes

type t
val t_typ : t structure typ

val create :
  string -> bool -> t structure ptr
val get_context_type :
  t structure ptr -> string option
val get_structure :
  t structure ptr -> Structure.t structure ptr
val has_context_type :
  t structure ptr -> string -> bool
val is_persistent :
  t structure ptr -> bool
val writable_structure :
  t structure ptr -> Structure.t structure ptr

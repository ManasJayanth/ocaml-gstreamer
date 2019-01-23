open Ctypes

type t
val t_typ : t structure typ

(* val f_memory: (Memory.t structure ptr, t structure) field *)
val f_flags: (Map_flags.t_list, t structure) field
(*Struct field Map_info : C Array type for Types.Array tag tag not implemented*)
val f_size: (Unsigned.uint64, t structure) field
val f_maxsize: (Unsigned.uint64, t structure) field
(*Struct field Map_info : C Array type for Types.Array tag tag not implemented*)
(*Struct field Map_info : C Array type for Types.Array tag tag not implemented*)


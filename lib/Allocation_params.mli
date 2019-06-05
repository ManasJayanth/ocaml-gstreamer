open Ctypes

type t
val t_typ : t structure typ

val f_flags: (Memory_flags.t_list, t structure) field
val f_align: (Unsigned.uint64, t structure) field
val f_prefix: (Unsigned.uint64, t structure) field
val f_padding: (Unsigned.uint64, t structure) field
(*Struct field Allocation_params : C Array type for Types.Array tag tag not implemented*)

val copy :
  t structure ptr -> t structure ptr option
val free :
  t structure ptr -> unit
val init :
  t structure ptr -> unit

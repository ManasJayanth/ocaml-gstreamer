open Ctypes

type t
val t_typ : t structure typ

(*Struct field Iterator : callback tag not implemented*)
(*Struct field Iterator : callback tag not implemented*)
(*Struct field Iterator : callback tag not implemented*)
(*Struct field Iterator : callback tag not implemented*)
(*Struct field Iterator : callback tag not implemented*)
val f_pushed: (t structure ptr, t structure) field
(*Struct field Iterator : gType tag not implemented*)
(*Struct field Iterator : union tag not implemented*)
val f_cookie: (Unsigned.uint32, t structure) field
val f_master_cookie: (Unsigned.uint32 ptr, t structure) field
val f_size: (Unsigned.uint32, t structure) field
(*Struct field Iterator : C Array type for Types.Array tag tag not implemented*)

(*Not implemented gst_iterator_new_single type gType not implemented*)
val copy :
  t structure ptr -> t structure ptr
(*Not implemented gst_iterator_filter type callback not implemented*)
(*Not implemented gst_iterator_find_custom type callback not implemented*)
(*Not implemented gst_iterator_fold type callback not implemented*)
(*Not implemented gst_iterator_foreach type callback not implemented*)
val free :
  t structure ptr -> unit
val next :
  t structure ptr -> (Iterator_result.t * Value.t structure)
val push :
  t structure ptr -> t structure ptr -> unit
val resync :
  t structure ptr -> unit

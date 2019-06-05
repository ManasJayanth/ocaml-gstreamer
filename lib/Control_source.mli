open Ctypes

type t
val t_typ : t typ

val control_source_get_value :
  t ptr -> Unsigned.uint64 -> (bool * float)
(*Not implemented gst_control_source_get_value_array type C Array type for Types.Array tag not implemented*)

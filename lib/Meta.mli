open Ctypes

type t
val t_typ : t structure typ

val f_flags: (Meta_flags.t_list, t structure) field
val f_info: (Meta_info.t structure ptr, t structure) field

val compare_seqnum :
  t structure ptr -> t structure ptr -> int32
val get_seqnum :
  t structure ptr -> Unsigned.uint64
(*Not implemented gst_meta_api_type_get_tags type gType not implemented*)
(*Not implemented gst_meta_api_type_has_tag type gType not implemented*)
(*Not implemented gst_meta_api_type_register type C Array type for Types.Array tag not implemented*)
val get_info :
  string -> Meta_info.t structure ptr option
(*Not implemented gst_meta_register type gType not implemented*)

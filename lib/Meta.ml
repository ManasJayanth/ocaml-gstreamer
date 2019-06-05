open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Meta"

let f_flags = field t_typ "flags" (Meta_flags.t_list_view)
let f_info = field t_typ "info" (ptr Meta_info.t_typ)
let _ = seal t_typ

let compare_seqnum =
  foreign "gst_meta_compare_seqnum" (ptr t_typ @-> ptr t_typ @-> returning (int32_t))
let get_seqnum =
  foreign "gst_meta_get_seqnum" (ptr t_typ @-> returning (uint64_t))
(*Not implemented gst_meta_api_type_get_tags type gType not implemented*)
(*Not implemented gst_meta_api_type_has_tag type gType not implemented*)
(*Not implemented gst_meta_api_type_register type C Array type for Types.Array tag not implemented*)
let get_info =
  foreign "gst_meta_get_info" (string @-> returning (ptr_opt Meta_info.t_typ))
(*Not implemented gst_meta_register type gType not implemented*)

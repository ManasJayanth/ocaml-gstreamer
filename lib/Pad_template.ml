open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

let create =
  foreign "gst_pad_template_new" (string @-> Pad_direction.t_view @-> Pad_presence.t_view @-> ptr Caps.t_typ @-> returning (ptr_opt t_typ))
(*Not implemented gst_pad_template_new_from_static_pad_template_with_gtype type gType not implemented*)
(*Not implemented gst_pad_template_new_with_gtype type gType not implemented*)
let get_caps =
  foreign "gst_pad_template_get_caps" (ptr t_typ @-> returning (ptr Caps.t_typ))
let pad_created =
  foreign "gst_pad_template_pad_created" (ptr t_typ @-> ptr Pad.t_typ @-> returning (void))

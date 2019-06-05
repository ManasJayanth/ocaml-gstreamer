open Ctypes

type t
val t_typ : t typ

val create :
  string -> Pad_direction.t -> Pad_presence.t -> Caps.t structure ptr -> t ptr option
(*Not implemented gst_pad_template_new_from_static_pad_template_with_gtype type gType not implemented*)
(*Not implemented gst_pad_template_new_with_gtype type gType not implemented*)
val get_caps :
  t ptr -> Caps.t structure ptr
val pad_created :
  t ptr -> Pad.t ptr -> unit

open Ctypes

type t
val t_typ : t structure typ

val create :
  Buffer.t structure ptr option -> Caps.t structure ptr option -> Segment.t structure ptr option -> Structure.t structure ptr option -> t structure ptr
val get_buffer :
  t structure ptr -> Buffer.t structure ptr option
val get_buffer_list :
  t structure ptr -> Buffer_list.t structure ptr option
val get_caps :
  t structure ptr -> Caps.t structure ptr option
val get_info :
  t structure ptr -> Structure.t structure ptr option
val get_segment :
  t structure ptr -> Segment.t structure ptr
val set_buffer :
  t structure ptr -> Buffer.t structure ptr -> unit
val set_buffer_list :
  t structure ptr -> Buffer_list.t structure ptr -> unit
val set_caps :
  t structure ptr -> Caps.t structure ptr -> unit
val set_info :
  t structure ptr -> Structure.t structure ptr -> bool
val set_segment :
  t structure ptr -> Segment.t structure ptr -> unit

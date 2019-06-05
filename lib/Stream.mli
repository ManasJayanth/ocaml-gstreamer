open Ctypes

type t
val t_typ : t typ

val create :
  string option -> Caps.t structure ptr option -> Stream_type.t_list -> Stream_flags.t_list -> t ptr
val get_caps :
  t ptr -> Caps.t structure ptr option
val get_stream_flags :
  t ptr -> Stream_flags.t_list
val get_stream_id :
  t ptr -> string option
val get_stream_type :
  t ptr -> Stream_type.t_list
val get_tags :
  t ptr -> Tag_list.t structure ptr option
val set_caps :
  t ptr -> Caps.t structure ptr option -> unit
val set_stream_flags :
  t ptr -> Stream_flags.t_list -> unit
val set_stream_type :
  t ptr -> Stream_type.t_list -> unit
val set_tags :
  t ptr -> Tag_list.t structure ptr option -> unit

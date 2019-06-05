open Ctypes

type t
val t_typ : t typ

val create :
  string option -> Element.t ptr
val add :
  t ptr -> Element.t ptr -> bool
val find_unlinked_pad :
  t ptr -> Pad_direction.t -> Pad.t ptr option
(*Not implemented gst_bin_get_by_interface type gType not implemented*)
val get_by_name :
  t ptr -> string -> Element.t ptr option
val get_by_name_recurse_up :
  t ptr -> string -> Element.t ptr option
val get_suppressed_flags :
  t ptr -> Element_flags.t_list
(*Not implemented gst_bin_iterate_all_by_interface type gType not implemented*)
val iterate_elements :
  t ptr -> Iterator.t structure ptr option
val iterate_recurse :
  t ptr -> Iterator.t structure ptr option
val iterate_sinks :
  t ptr -> Iterator.t structure ptr option
val iterate_sorted :
  t ptr -> Iterator.t structure ptr option
val iterate_sources :
  t ptr -> Iterator.t structure ptr option
val recalculate_latency :
  t ptr -> bool
val remove :
  t ptr -> Element.t ptr -> bool
val set_suppressed_flags :
  t ptr -> Element_flags.t_list -> unit
val sync_children_states :
  t ptr -> bool

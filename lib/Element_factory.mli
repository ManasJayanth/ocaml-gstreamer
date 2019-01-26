open Ctypes

type t
val t_typ : t typ

val find :
  string -> t ptr option
(* val list_filter :
 *   List.t structure (\* Not implemented : interface *\) ptr -> Caps.t structure ptr -> Pad_direction.t -> bool -> List.t structure (\* Not implemented : interface *\) ptr *)
(* val list_get_elements :
 *   Unsigned.uint64 -> Rank.t -> List.t structure (\* Not implemented : interface *\) ptr *)
(* val make :
 *   string -> string option -> Element.t ptr option *)
val can_sink_all_caps :
  t ptr -> Caps.t structure ptr -> bool
val can_sink_any_caps :
  t ptr -> Caps.t structure ptr -> bool
val can_src_all_caps :
  t ptr -> Caps.t structure ptr -> bool
val can_src_any_caps :
  t ptr -> Caps.t structure ptr -> bool
(* val create :
 *   t ptr -> string option -> Element.t ptr option *)
(*Not implemented gst_element_factory_get_element_type return type gType not handled*)
val get_metadata :
  t ptr -> string -> string option
(*Not implemented gst_element_factory_get_metadata_keys return type C Array type for Types.Array tag not handled*)
val get_num_pad_templates :
  t ptr -> Unsigned.uint32
(* val get_static_pad_templates :
 *   t ptr -> List.t structure (\* Not implemented : interface *\) ptr *)
(*Not implemented gst_element_factory_get_uri_protocols return type C Array type for Types.Array tag not handled*)
val get_uri_type :
  t ptr -> URIType.t
val has_interface :
  t ptr -> string -> bool
(* val list_is_type :
 *   t ptr -> Unsigned.uint64 -> bool *)

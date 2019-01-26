open Ctypes

type t
val t_typ : t typ

(* val create_element :
 *   t ptr -> string option -> Element.t ptr option *)
val get_caps :
  t ptr -> Caps.t structure ptr option
val get_device_class :
  t ptr -> string option
val get_display_name :
  t ptr -> string option
val get_properties :
  t ptr -> Structure.t structure ptr option
val has_classes :
  t ptr -> string -> bool
(*Not implemented gst_device_has_classesv type C Array type for Types.Array tag not implemented*)
(* val reconfigure_element :
 *   t ptr -> Element.t ptr -> bool *)

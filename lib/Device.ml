open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

(* let create_element =
 *   foreign "gst_device_create_element" (ptr t_typ @-> string_opt @-> returning (ptr_opt Element.t_typ)) *)
let get_caps =
  foreign "gst_device_get_caps" (ptr t_typ @-> returning (ptr_opt Caps.t_typ))
let get_device_class =
  foreign "gst_device_get_device_class" (ptr t_typ @-> returning (string_opt))
let get_display_name =
  foreign "gst_device_get_display_name" (ptr t_typ @-> returning (string_opt))
let get_properties =
  foreign "gst_device_get_properties" (ptr t_typ @-> returning (ptr_opt Structure.t_typ))
let has_classes =
  foreign "gst_device_has_classes" (ptr t_typ @-> string @-> returning (bool))
(*Not implemented gst_device_has_classesv type C Array type for Types.Array tag not implemented*)
(* let reconfigure_element =
 *   foreign "gst_device_reconfigure_element" (ptr t_typ @-> ptr Element.t_typ @-> returning (bool)) *)

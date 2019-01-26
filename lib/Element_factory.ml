open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

let find =
  foreign "gst_element_factory_find" (string @-> returning (ptr_opt t_typ))
(* let list_filter =
 *   foreign "gst_element_factory_list_filter" (ptr List.t_typ @-> ptr Caps.t_typ @-> Pad_direction.t_view @-> bool @-> returning (ptr List.t_typ)) *)
(* let list_get_elements =
 *   foreign "gst_element_factory_list_get_elements" (uint64_t @-> Rank.t_view @-> returning (ptr List.t_typ)) *)
(* let make =
 *   foreign "gst_element_factory_make" (string @-> string_opt @-> returning (ptr_opt Element.t_typ)) *)
let can_sink_all_caps =
  foreign "gst_element_factory_can_sink_all_caps" (ptr t_typ @-> ptr Caps.t_typ @-> returning (bool))
let can_sink_any_caps =
  foreign "gst_element_factory_can_sink_any_caps" (ptr t_typ @-> ptr Caps.t_typ @-> returning (bool))
let can_src_all_caps =
  foreign "gst_element_factory_can_src_all_caps" (ptr t_typ @-> ptr Caps.t_typ @-> returning (bool))
let can_src_any_caps =
  foreign "gst_element_factory_can_src_any_caps" (ptr t_typ @-> ptr Caps.t_typ @-> returning (bool))
(* let create =
 *   foreign "gst_element_factory_create" (ptr t_typ @-> string_opt @-> returning (ptr_opt Element.t_typ)) *)
(*Not implemented gst_element_factory_get_element_type return type gType not handled*)
let get_metadata =
  foreign "gst_element_factory_get_metadata" (ptr t_typ @-> string @-> returning (string_opt))
(*Not implemented gst_element_factory_get_metadata_keys return type C Array type for Types.Array tag not handled*)
let get_num_pad_templates =
  foreign "gst_element_factory_get_num_pad_templates" (ptr t_typ @-> returning (uint32_t))
(* let get_static_pad_templates =
 *   foreign "gst_element_factory_get_static_pad_templates" (ptr t_typ @-> returning (ptr List.t_typ)) *)
(*Not implemented gst_element_factory_get_uri_protocols return type C Array type for Types.Array tag not handled*)
let get_uri_type =
  foreign "gst_element_factory_get_uri_type" (ptr t_typ @-> returning (URIType.t_view))
let has_interface =
  foreign "gst_element_factory_has_interface" (ptr t_typ @-> string @-> returning (bool))
(* let list_is_type =
 *   foreign "gst_element_factory_list_is_type" (ptr t_typ @-> uint64_t @-> returning (bool)) *)

open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Caps"

let f_mini_object = field t_typ "mini_object" (Mini_object.t_typ)
let _ = seal t_typ

let create_any =
  foreign "gst_caps_new_any" (void @-> returning (ptr t_typ))
let create_empty =
  foreign "gst_caps_new_empty" (void @-> returning (ptr t_typ))
let create_empty_simple =
  foreign "gst_caps_new_empty_simple" (string @-> returning (ptr t_typ))
let append =
  foreign "gst_caps_append" (ptr t_typ @-> ptr t_typ @-> returning (void))
(* let append_structure =
 *   foreign "gst_caps_append_structure" (ptr t_typ @-> ptr Structure.t_typ @-> returning (void)) *)
(* let append_structure_full =
 *   foreign "gst_caps_append_structure_full" (ptr t_typ @-> ptr Structure.t_typ @-> ptr_opt Caps_features.t_typ @-> returning (void)) *)
let can_intersect =
  foreign "gst_caps_can_intersect" (ptr t_typ @-> ptr t_typ @-> returning (bool))
let copy_nth =
  foreign "gst_caps_copy_nth" (ptr t_typ @-> uint32_t @-> returning (ptr t_typ))
(*Not implemented gst_caps_filter_and_map_in_place type callback not implemented*)
let fixate =
  foreign "gst_caps_fixate" (ptr t_typ @-> returning (ptr t_typ))
(*Not implemented gst_caps_foreach type callback not implemented*)
(* let get_features =
 *   foreign "gst_caps_get_features" (ptr t_typ @-> uint32_t @-> returning (ptr_opt Caps_features.t_typ)) *)
let get_size =
  foreign "gst_caps_get_size" (ptr t_typ @-> returning (uint32_t))
(* let get_structure =
 *   foreign "gst_caps_get_structure" (ptr t_typ @-> uint32_t @-> returning (ptr Structure.t_typ)) *)
let intersect =
  foreign "gst_caps_intersect" (ptr t_typ @-> ptr t_typ @-> returning (ptr t_typ))
(* let intersect_full =
 *   foreign "gst_caps_intersect_full" (ptr t_typ @-> ptr t_typ @-> Caps_intersect_mode.t_view @-> returning (ptr t_typ)) *)
let is_always_compatible =
  foreign "gst_caps_is_always_compatible" (ptr t_typ @-> ptr t_typ @-> returning (bool))
let is_any =
  foreign "gst_caps_is_any" (ptr t_typ @-> returning (bool))
let is_empty =
  foreign "gst_caps_is_empty" (ptr t_typ @-> returning (bool))
let is_equal =
  foreign "gst_caps_is_equal" (ptr t_typ @-> ptr t_typ @-> returning (bool))
let is_equal_fixed =
  foreign "gst_caps_is_equal_fixed" (ptr t_typ @-> ptr t_typ @-> returning (bool))
let is_fixed =
  foreign "gst_caps_is_fixed" (ptr t_typ @-> returning (bool))
let is_strictly_equal =
  foreign "gst_caps_is_strictly_equal" (ptr t_typ @-> ptr t_typ @-> returning (bool))
let is_subset =
  foreign "gst_caps_is_subset" (ptr t_typ @-> ptr t_typ @-> returning (bool))
(* let is_subset_structure =
 *   foreign "gst_caps_is_subset_structure" (ptr t_typ @-> ptr Structure.t_typ @-> returning (bool))
 * let is_subset_structure_full =
 *   foreign "gst_caps_is_subset_structure_full" (ptr t_typ @-> ptr Structure.t_typ @-> ptr_opt Caps_features.t_typ @-> returning (bool)) *)
(*Not implemented gst_caps_map_in_place type callback not implemented*)
let merge =
  foreign "gst_caps_merge" (ptr t_typ @-> ptr t_typ @-> returning (ptr t_typ))
(* let merge_structure =
 *   foreign "gst_caps_merge_structure" (ptr t_typ @-> ptr Structure.t_typ @-> returning (ptr t_typ))
 * let merge_structure_full =
 *   foreign "gst_caps_merge_structure_full" (ptr t_typ @-> ptr Structure.t_typ @-> ptr_opt Caps_features.t_typ @-> returning (ptr t_typ)) *)
let normalize =
  foreign "gst_caps_normalize" (ptr t_typ @-> returning (ptr t_typ))
let remove_structure =
  foreign "gst_caps_remove_structure" (ptr t_typ @-> uint32_t @-> returning (void))
(* let set_features =
 *   foreign "gst_caps_set_features" (ptr t_typ @-> uint32_t @-> ptr_opt Caps_features.t_typ @-> returning (void))
 * let set_value =
 *   foreign "gst_caps_set_value" (ptr t_typ @-> string @-> ptr Value.t_typ @-> returning (void)) *)
let simplify =
  foreign "gst_caps_simplify" (ptr t_typ @-> returning (ptr t_typ))
(* let steal_structure =
 *   foreign "gst_caps_steal_structure" (ptr t_typ @-> uint32_t @-> returning (ptr_opt Structure.t_typ)) *)
let subtract =
  foreign "gst_caps_subtract" (ptr t_typ @-> ptr t_typ @-> returning (ptr t_typ))
let to_string =
  foreign "gst_caps_to_string" (ptr t_typ @-> returning (string_opt))
let truncate =
  foreign "gst_caps_truncate" (ptr t_typ @-> returning (ptr t_typ))
let from_string =
  foreign "gst_caps_from_string" (string @-> returning (ptr_opt t_typ))

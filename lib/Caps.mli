open Ctypes

type t
val t_typ : t structure typ

val f_mini_object: (Mini_object.t structure, t structure) field

val create_any :
  unit -> t structure ptr
val create_empty :
  unit -> t structure ptr
val create_empty_simple :
  string -> t structure ptr
val append :
  t structure ptr -> t structure ptr -> unit
(* val append_structure :
 *   t structure ptr -> Structure.t structure ptr -> unit
 * val append_structure_full :
 *   t structure ptr -> Structure.t structure ptr -> Caps_features.t structure ptr option -> unit *)
val can_intersect :
  t structure ptr -> t structure ptr -> bool
val copy_nth :
  t structure ptr -> Unsigned.uint32 -> t structure ptr
(*Not implemented gst_caps_filter_and_map_in_place type callback not implemented*)
val fixate :
  t structure ptr -> t structure ptr
(*Not implemented gst_caps_foreach type callback not implemented*)
(* val get_features :
 *   t structure ptr -> Unsigned.uint32 -> Caps_features.t structure ptr option *)
val get_size :
  t structure ptr -> Unsigned.uint32
(* val get_structure :
 *   t structure ptr -> Unsigned.uint32 -> Structure.t structure ptr *)
val intersect :
  t structure ptr -> t structure ptr -> t structure ptr
(* val intersect_full :
 *   t structure ptr -> t structure ptr -> Caps_intersect_mode.t -> t structure ptr *)
val is_always_compatible :
  t structure ptr -> t structure ptr -> bool
val is_any :
  t structure ptr -> bool
val is_empty :
  t structure ptr -> bool
val is_equal :
  t structure ptr -> t structure ptr -> bool
val is_equal_fixed :
  t structure ptr -> t structure ptr -> bool
val is_fixed :
  t structure ptr -> bool
val is_strictly_equal :
  t structure ptr -> t structure ptr -> bool
val is_subset :
  t structure ptr -> t structure ptr -> bool
(* val is_subset_structure :
 *   t structure ptr -> Structure.t structure ptr -> bool
 * val is_subset_structure_full :
 *   t structure ptr -> Structure.t structure ptr -> Caps_features.t structure ptr option -> bool *)
(*Not implemented gst_caps_map_in_place type callback not implemented*)
val merge :
  t structure ptr -> t structure ptr -> t structure ptr
(* val merge_structure :
 *   t structure ptr -> Structure.t structure ptr -> t structure ptr
 * val merge_structure_full :
 *   t structure ptr -> Structure.t structure ptr -> Caps_features.t structure ptr option -> t structure ptr *)
val normalize :
  t structure ptr -> t structure ptr
val remove_structure :
  t structure ptr -> Unsigned.uint32 -> unit
(* val set_features :
 *   t structure ptr -> Unsigned.uint32 -> Caps_features.t structure ptr option -> unit *)
(* val set_value :
 *   t structure ptr -> string -> Value.t structure ptr -> unit *)
val simplify :
  t structure ptr -> t structure ptr
(* val steal_structure :
 *   t structure ptr -> Unsigned.uint32 -> Structure.t structure ptr option *)
val subtract :
  t structure ptr -> t structure ptr -> t structure ptr
val to_string :
  t structure ptr -> string option
val truncate :
  t structure ptr -> t structure ptr
val from_string :
  string -> t structure ptr option

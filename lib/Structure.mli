open Ctypes

type t
val t_typ : t structure typ

(*Struct field Structure : gType tag not implemented*)
val f_name: (Unsigned.uint32, t structure) field

val create_empty :
  string -> t structure ptr
val create_from_string :
  string -> t structure ptr option
val create_id_empty :
  Unsigned.uint32 -> t structure ptr
val can_intersect :
  t structure ptr -> t structure ptr -> bool
val copy :
  t structure ptr -> t structure ptr
(*Not implemented gst_structure_filter_and_map_in_place type callback not implemented*)
val fixate :
  t structure ptr -> unit
val fixate_field :
  t structure ptr -> string -> bool
val fixate_field_boolean :
  t structure ptr -> string -> bool -> bool
val fixate_field_nearest_double :
  t structure ptr -> string -> float -> bool
val fixate_field_nearest_fraction :
  t structure ptr -> string -> int32 -> int32 -> bool
val fixate_field_nearest_int :
  t structure ptr -> string -> int32 -> bool
val fixate_field_string :
  t structure ptr -> string -> string -> bool
(*Not implemented gst_structure_foreach type callback not implemented*)
val free :
  t structure ptr -> unit
(* val get_array :
 *   t structure ptr -> string -> (bool * Value_array.t structure ptr) *)
(* val get_boolean :
 *   t structure ptr -> string -> (bool * bool) *)
(* val get_clock_time :
 *   t structure ptr -> string -> (bool * Unsigned.uint64) *)
(* val get_date :
 *   t structure ptr -> string -> (bool * Date.t structure ptr) *)
(* val get_date_time :
 *   t structure ptr -> string -> (bool * Date_time.t structure ptr) *)
(* val get_double :
 *   t structure ptr -> string -> (bool * float) *)
(*Not implemented gst_structure_get_enum type gType not implemented*)
(*Not implemented gst_structure_get_field_type return type gType not handled*)
(* val get_flagset :
 *   t structure ptr -> string -> (bool * Unsigned.uint32 * Unsigned.uint32)
 * val get_fraction :
 *   t structure ptr -> string -> (bool * int32 * int32)
 * val get_int :
 *   t structure ptr -> string -> (bool * int32)
 * val get_int64 :
 *   t structure ptr -> string -> (bool * int64)
 * val get_list :
 *   t structure ptr -> string -> (bool * Value_array.t structure ptr) *)
val get_name :
  t structure ptr -> string option
val get_name_id :
  t structure ptr -> Unsigned.uint32
val get_string :
  t structure ptr -> string -> string option
val get_uint :
  t structure ptr -> string -> (bool * Unsigned.uint32)
val get_uint64 :
  t structure ptr -> string -> (bool * Unsigned.uint64)
val get_value :
  t structure ptr -> string -> Value.t structure ptr option
val has_field :
  t structure ptr -> string -> bool
(*Not implemented gst_structure_has_field_typed type gType not implemented*)
val has_name :
  t structure ptr -> string -> bool
val id_get_value :
  t structure ptr -> Unsigned.uint32 -> Value.t structure ptr option
val id_has_field :
  t structure ptr -> Unsigned.uint32 -> bool
(*Not implemented gst_structure_id_has_field_typed type gType not implemented*)
val id_set_value :
  t structure ptr -> Unsigned.uint32 -> Value.t structure ptr -> unit
val id_take_value :
  t structure ptr -> Unsigned.uint32 -> Value.t structure ptr -> unit
val intersect :
  t structure ptr -> t structure ptr -> t structure ptr option
val is_equal :
  t structure ptr -> t structure ptr -> bool
val is_subset :
  t structure ptr -> t structure ptr -> bool
(*Not implemented gst_structure_map_in_place type callback not implemented*)
val n_fields :
  t structure ptr -> int32
val nth_field_name :
  t structure ptr -> Unsigned.uint32 -> string option
val remove_all_fields :
  t structure ptr -> unit
val remove_field :
  t structure ptr -> string -> unit
val set_array :
  t structure ptr -> string -> Value_array.t structure ptr -> unit
val set_list :
  t structure ptr -> string -> Value_array.t structure ptr -> unit
val set_name :
  t structure ptr -> string -> unit
val set_parent_refcount :
  t structure ptr -> int32 ptr -> bool
val set_value :
  t structure ptr -> string -> Value.t structure ptr -> unit
val take_value :
  t structure ptr -> string -> Value.t structure ptr -> unit
val to_string :
  t structure ptr -> string option
val from_string :
  string -> (t structure ptr option * string)

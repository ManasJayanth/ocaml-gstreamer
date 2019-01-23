open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Structure"

(*Struct field Structure : gType tag not implemented*)
let f_name = field t_typ "name" (uint32_t)
let _ = seal t_typ

let create_empty =
  foreign "gst_structure_new_empty" (string @-> returning (ptr t_typ))
let create_from_string =
  foreign "gst_structure_new_from_string" (string @-> returning (ptr_opt t_typ))
let create_id_empty =
  foreign "gst_structure_new_id_empty" (uint32_t @-> returning (ptr t_typ))
let can_intersect =
  foreign "gst_structure_can_intersect" (ptr t_typ @-> ptr t_typ @-> returning (bool))
let copy =
  foreign "gst_structure_copy" (ptr t_typ @-> returning (ptr t_typ))
(*Not implemented gst_structure_filter_and_map_in_place type callback not implemented*)
let fixate =
  foreign "gst_structure_fixate" (ptr t_typ @-> returning (void))
let fixate_field =
  foreign "gst_structure_fixate_field" (ptr t_typ @-> string @-> returning (bool))
let fixate_field_boolean =
  foreign "gst_structure_fixate_field_boolean" (ptr t_typ @-> string @-> bool @-> returning (bool))
let fixate_field_nearest_double =
  foreign "gst_structure_fixate_field_nearest_double" (ptr t_typ @-> string @-> double @-> returning (bool))
let fixate_field_nearest_fraction =
  foreign "gst_structure_fixate_field_nearest_fraction" (ptr t_typ @-> string @-> int32_t @-> int32_t @-> returning (bool))
let fixate_field_nearest_int =
  foreign "gst_structure_fixate_field_nearest_int" (ptr t_typ @-> string @-> int32_t @-> returning (bool))
let fixate_field_string =
  foreign "gst_structure_fixate_field_string" (ptr t_typ @-> string @-> string @-> returning (bool))
(*Not implemented gst_structure_foreach type callback not implemented*)
let free =
  foreign "gst_structure_free" (ptr t_typ @-> returning (void))
(* let get_array self fieldname =
 *   let get_array_raw =
 *     foreign "gst_structure_get_array" (ptr t_typ @-> string @-> ptr (ptr Value_array.t_typ) @-> returning (bool))
 *   in
 *   let _array_ptr = allocate (ptr_opt Value_array.t_typ) None in
 *   let ret = get_array_raw self fieldname _array_ptr in
 *   let _array = !@ _array_ptr in
 *   (ret, _array) *)
(* let get_boolean self fieldname =
 *   let get_boolean_raw =
 *     foreign "gst_structure_get_boolean" (ptr t_typ @-> string @-> ptr (bool) @-> returning (bool))
 *   in
 *   let value_ptr = allocate bool false in
 *   let ret = get_boolean_raw self fieldname value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_clock_time self fieldname =
 *   let get_clock_time_raw =
 *     foreign "gst_structure_get_clock_time" (ptr t_typ @-> string @-> ptr (uint64_t) @-> returning (bool))
 *   in
 *   let value_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let ret = get_clock_time_raw self fieldname value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value) *)
(* let get_date self fieldname =
 *   let get_date_raw =
 *     foreign "gst_structure_get_date" (ptr t_typ @-> string @-> ptr (ptr Date.t_typ) @-> returning (bool))
 *   in
 *   let value_ptr = allocate (ptr_opt Date.t_typ) None in
 *   let ret = get_date_raw self fieldname value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value) *)
(* let get_date_time self fieldname =
 *   let get_date_time_raw =
 *     foreign "gst_structure_get_date_time" (ptr t_typ @-> string @-> ptr (ptr Date_time.t_typ) @-> returning (bool))
 *   in
 *   let value_ptr = allocate (ptr_opt Date_time.t_typ) None in
 *   let ret = get_date_time_raw self fieldname value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value) *)
(* let get_double self fieldname =
 *   let get_double_raw =
 *     foreign "gst_structure_get_double" (ptr t_typ @-> string @-> ptr (double) @-> returning (bool))
 *   in
 *   let value_ptr = allocate double 0.0 in
 *   let ret = get_double_raw self fieldname value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value) *)
(*Not implemented gst_structure_get_enum type gType not implemented*)
(*Not implemented gst_structure_get_field_type return type gType not handled*)
(* let get_flagset self fieldname =
 *   let get_flagset_raw =
 *     foreign "gst_structure_get_flagset" (ptr t_typ @-> string @-> ptr (uint32_t) @-> ptr (uint32_t) @-> returning (bool))
 *   in
 *   let value_flags_ptr = allocate uint32_t Unsigned.UInt32.zero in
 *   let value_mask_ptr = allocate uint32_t Unsigned.UInt32.zero in
 *   let ret = get_flagset_raw self fieldname value_flags_ptr value_mask_ptr in
 *   let value_flags = !@ value_flags_ptr in
 *   let value_mask = !@ value_mask_ptr in
 *   (ret, value_flags, value_mask)
 * let get_fraction self fieldname =
 *   let get_fraction_raw =
 *     foreign "gst_structure_get_fraction" (ptr t_typ @-> string @-> ptr (int32_t) @-> ptr (int32_t) @-> returning (bool))
 *   in
 *   let value_numerator_ptr = allocate int32_t Int32.zero in
 *   let value_denominator_ptr = allocate int32_t Int32.zero in
 *   let ret = get_fraction_raw self fieldname value_numerator_ptr value_denominator_ptr in
 *   let value_numerator = !@ value_numerator_ptr in
 *   let value_denominator = !@ value_denominator_ptr in
 *   (ret, value_numerator, value_denominator)
 * let get_int self fieldname =
 *   let get_int_raw =
 *     foreign "gst_structure_get_int" (ptr t_typ @-> string @-> ptr (int32_t) @-> returning (bool))
 *   in
 *   let value_ptr = allocate int32_t Int32.zero in
 *   let ret = get_int_raw self fieldname value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_int64 self fieldname =
 *   let get_int64_raw =
 *     foreign "gst_structure_get_int64" (ptr t_typ @-> string @-> ptr (int64_t) @-> returning (bool))
 *   in
 *   let value_ptr = allocate int64_t Int64.zero in
 *   let ret = get_int64_raw self fieldname value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_list self fieldname =
 *   let get_list_raw =
 *     foreign "gst_structure_get_list" (ptr t_typ @-> string @-> ptr (ptr Value_array.t_typ) @-> returning (bool))
 *   in
 *   let _array_ptr = allocate (ptr_opt Value_array.t_typ) None in
 *   let ret = get_list_raw self fieldname _array_ptr in
 *   let _array = !@ _array_ptr in
 *   (ret, _array) *)
let get_name =
  foreign "gst_structure_get_name" (ptr t_typ @-> returning (string_opt))
let get_name_id =
  foreign "gst_structure_get_name_id" (ptr t_typ @-> returning (uint32_t))
let get_string =
  foreign "gst_structure_get_string" (ptr t_typ @-> string @-> returning (string_opt))
let get_uint self fieldname =
  let get_uint_raw =
    foreign "gst_structure_get_uint" (ptr t_typ @-> string @-> ptr (uint32_t) @-> returning (bool))
  in
  let value_ptr = allocate uint32_t Unsigned.UInt32.zero in
  let ret = get_uint_raw self fieldname value_ptr in
  let value = !@ value_ptr in
  (ret, value)
let get_uint64 self fieldname =
  let get_uint64_raw =
    foreign "gst_structure_get_uint64" (ptr t_typ @-> string @-> ptr (uint64_t) @-> returning (bool))
  in
  let value_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let ret = get_uint64_raw self fieldname value_ptr in
  let value = !@ value_ptr in
  (ret, value)
let get_value =
  foreign "gst_structure_get_value" (ptr t_typ @-> string @-> returning (ptr_opt Value.t_typ))
let has_field =
  foreign "gst_structure_has_field" (ptr t_typ @-> string @-> returning (bool))
(*Not implemented gst_structure_has_field_typed type gType not implemented*)
let has_name =
  foreign "gst_structure_has_name" (ptr t_typ @-> string @-> returning (bool))
let id_get_value =
  foreign "gst_structure_id_get_value" (ptr t_typ @-> uint32_t @-> returning (ptr_opt Value.t_typ))
let id_has_field =
  foreign "gst_structure_id_has_field" (ptr t_typ @-> uint32_t @-> returning (bool))
(*Not implemented gst_structure_id_has_field_typed type gType not implemented*)
let id_set_value =
  foreign "gst_structure_id_set_value" (ptr t_typ @-> uint32_t @-> ptr Value.t_typ @-> returning (void))
let id_take_value =
  foreign "gst_structure_id_take_value" (ptr t_typ @-> uint32_t @-> ptr Value.t_typ @-> returning (void))
let intersect =
  foreign "gst_structure_intersect" (ptr t_typ @-> ptr t_typ @-> returning (ptr_opt t_typ))
let is_equal =
  foreign "gst_structure_is_equal" (ptr t_typ @-> ptr t_typ @-> returning (bool))
let is_subset =
  foreign "gst_structure_is_subset" (ptr t_typ @-> ptr t_typ @-> returning (bool))
(*Not implemented gst_structure_map_in_place type callback not implemented*)
let n_fields =
  foreign "gst_structure_n_fields" (ptr t_typ @-> returning (int32_t))
let nth_field_name =
  foreign "gst_structure_nth_field_name" (ptr t_typ @-> uint32_t @-> returning (string_opt))
let remove_all_fields =
  foreign "gst_structure_remove_all_fields" (ptr t_typ @-> returning (void))
let remove_field =
  foreign "gst_structure_remove_field" (ptr t_typ @-> string @-> returning (void))
let set_array =
  foreign "gst_structure_set_array" (ptr t_typ @-> string @-> ptr Value_array.t_typ @-> returning (void))
let set_list =
  foreign "gst_structure_set_list" (ptr t_typ @-> string @-> ptr Value_array.t_typ @-> returning (void))
let set_name =
  foreign "gst_structure_set_name" (ptr t_typ @-> string @-> returning (void))
let set_parent_refcount =
  foreign "gst_structure_set_parent_refcount" (ptr t_typ @-> ptr int32_t @-> returning (bool))
let set_value =
  foreign "gst_structure_set_value" (ptr t_typ @-> string @-> ptr Value.t_typ @-> returning (void))
let take_value =
  foreign "gst_structure_take_value" (ptr t_typ @-> string @-> ptr Value.t_typ @-> returning (void))
let to_string =
  foreign "gst_structure_to_string" (ptr t_typ @-> returning (string_opt))
let from_string _string =
  let from_string_raw =
    foreign "gst_structure_from_string" (string @-> ptr (string) @-> returning (ptr_opt t_typ))
  in
  let _end_ptr = allocate string " " in
  let ret = from_string_raw _string _end_ptr in
  let _end = !@ _end_ptr in
  (ret, _end)

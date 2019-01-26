open Ctypes

type t
val t_typ : t structure typ

val f_mini_object: (Mini_object.t structure, t structure) field

val create_empty :
  unit -> t structure ptr
val create_from_string :
  string -> t structure ptr option
val add_value :
  t structure ptr -> Tag_merge_mode.t -> string -> Value.t structure ptr -> unit
(*Not implemented gst_tag_list_foreach type callback not implemented*)
(* val get_boolean :
 *   t structure ptr -> string -> (bool * bool)
 * val get_boolean_index :
 *   t structure ptr -> string -> Unsigned.uint32 -> (bool * bool)
 * val get_date :
 *   t structure ptr -> string -> (bool * Date.t structure ptr)
 * val get_date_index :
 *   t structure ptr -> string -> Unsigned.uint32 -> (bool * Date.t structure ptr)
 * val get_date_time :
 *   t structure ptr -> string -> (bool * Date_time.t structure ptr)
 * val get_date_time_index :
 *   t structure ptr -> string -> Unsigned.uint32 -> (bool * Date_time.t structure ptr)
 * val get_double :
 *   t structure ptr -> string -> (bool * float)
 * val get_double_index :
 *   t structure ptr -> string -> Unsigned.uint32 -> (bool * float)
 * val get_float :
 *   t structure ptr -> string -> (bool * float)
 * val get_float_index :
 *   t structure ptr -> string -> Unsigned.uint32 -> (bool * float)
 * val get_int :
 *   t structure ptr -> string -> (bool * int32)
 * val get_int64 :
 *   t structure ptr -> string -> (bool * int64)
 * val get_int64_index :
 *   t structure ptr -> string -> Unsigned.uint32 -> (bool * int64)
 * val get_int_index :
 *   t structure ptr -> string -> Unsigned.uint32 -> (bool * int32)
 * val get_pointer :
 *   t structure ptr -> string -> (bool * unit ptr option)
 * val get_pointer_index :
 *   t structure ptr -> string -> Unsigned.uint32 -> (bool * unit ptr option)
 * val get_sample :
 *   t structure ptr -> string -> (bool * Sample.t structure ptr)
 * val get_sample_index :
 *   t structure ptr -> string -> Unsigned.uint32 -> (bool * Sample.t structure ptr) *)
val get_scope :
  t structure ptr -> Tag_scope.t
val get_string :
  t structure ptr -> string -> (bool * string)
val get_string_index :
  t structure ptr -> string -> Unsigned.uint32 -> (bool * string)
val get_tag_size :
  t structure ptr -> string -> Unsigned.uint32
val get_uint :
  t structure ptr -> string -> (bool * Unsigned.uint32)
val get_uint64 :
  t structure ptr -> string -> (bool * Unsigned.uint64)
val get_uint64_index :
  t structure ptr -> string -> Unsigned.uint32 -> (bool * Unsigned.uint64)
val get_uint_index :
  t structure ptr -> string -> Unsigned.uint32 -> (bool * Unsigned.uint32)
val get_value_index :
  t structure ptr -> string -> Unsigned.uint32 -> Value.t structure ptr option
val insert :
  t structure ptr -> t structure ptr -> Tag_merge_mode.t -> unit
val is_empty :
  t structure ptr -> bool
val is_equal :
  t structure ptr -> t structure ptr -> bool
val merge :
  t structure ptr -> t structure ptr option -> Tag_merge_mode.t -> t structure ptr option
val n_tags :
  t structure ptr -> int32
val nth_tag_name :
  t structure ptr -> Unsigned.uint32 -> string option
val peek_string_index :
  t structure ptr -> string -> Unsigned.uint32 -> (bool * string)
val remove_tag :
  t structure ptr -> string -> unit
val set_scope :
  t structure ptr -> Tag_scope.t -> unit
val to_string :
  t structure ptr -> string option
val copy_value :
  t structure ptr -> string -> (bool * Value.t structure)

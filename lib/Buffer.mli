open Ctypes

type t
val t_typ : t structure typ

val f_mini_object: (Mini_object.t structure, t structure) field
val f_pool: (Buffer_pool.t ptr, t structure) field
val f_pts: (Unsigned.uint64, t structure) field
val f_dts: (Unsigned.uint64, t structure) field
val f_duration: (Unsigned.uint64, t structure) field
val f_offset: (Unsigned.uint64, t structure) field
val f_offset_end: (Unsigned.uint64, t structure) field

val create :
  unit -> t structure ptr
val create_allocate :
  Allocator.t ptr option -> Unsigned.uint64 -> Allocation_params.t structure ptr option -> t structure ptr option
(*Not implemented gst_buffer_new_wrapped type C Array type for Types.Array tag not implemented*)
(* val create_wrapped_bytes :
 *   Bytes.t structure ptr -> t structure ptr *)
(*Not implemented gst_buffer_new_wrapped_full type C Array type for Types.Array tag not implemented*)
val add_meta :
  t structure ptr -> Meta_info.t structure ptr -> unit ptr option -> Meta.t structure ptr option
val add_parent_buffer_meta :
  t structure ptr -> t structure ptr -> Parent_buffer_meta.t structure ptr option
val add_protection_meta :
  t structure ptr -> Structure.t structure ptr -> Protection_meta.t structure ptr
(* val add_reference_timestamp_meta :
 *   t structure ptr -> Caps.t structure ptr -> Unsigned.uint64 -> Unsigned.uint64 -> Reference_timestamp_meta.t structure ptr option
 * val append :
 *   t structure ptr -> t structure ptr -> t structure ptr
 * val append_memory :
 *   t structure ptr -> Memory.t structure ptr -> unit
 * val append_region :
 *   t structure ptr -> t structure ptr -> int64 -> int64 -> t structure ptr
 * val copy_deep :
 *   t structure ptr -> t structure ptr
 * val copy_into :
 *   t structure ptr -> t structure ptr -> Buffer_copy_flags.t_list -> Unsigned.uint64 -> Unsigned.uint64 -> bool
 * val copy_region :
 *   t structure ptr -> Buffer_copy_flags.t_list -> Unsigned.uint64 -> Unsigned.uint64 -> t structure ptr
 * (\*Not implemented gst_buffer_extract type C Array type for Types.Array tag not implemented*\)
 * (\*Not implemented gst_buffer_extract_dup type C Array type for Types.Array tag not implemented*\)
 * (\*Not implemented gst_buffer_fill type C Array type for Types.Array tag not implemented*\)
 * val find_memory :
 *   t structure ptr -> Unsigned.uint64 -> Unsigned.uint64 -> (bool * Unsigned.uint32 * Unsigned.uint32 * Unsigned.uint64)
 * (\*Not implemented gst_buffer_foreach_meta type callback not implemented*\)
 * val get_all_memory :
 *   t structure ptr -> Memory.t structure ptr option
 * val get_flags :
 *   t structure ptr -> Buffer_flags.t_list
 * val get_memory :
 *   t structure ptr -> Unsigned.uint32 -> Memory.t structure ptr option
 * val get_memory_range :
 *   t structure ptr -> Unsigned.uint32 -> int32 -> Memory.t structure ptr option
 * (\*Not implemented gst_buffer_get_meta type gType not implemented*\)
 * (\*Not implemented gst_buffer_get_n_meta type gType not implemented*\)
 * val get_reference_timestamp_meta :
 *   t structure ptr -> Caps.t structure ptr option -> Reference_timestamp_meta.t structure ptr option
 * val get_size :
 *   t structure ptr -> Unsigned.uint64
 * val get_sizes :
 *   t structure ptr -> (Unsigned.uint64 * Unsigned.uint64 * Unsigned.uint64)
 * val get_sizes_range :
 *   t structure ptr -> Unsigned.uint32 -> int32 -> (Unsigned.uint64 * Unsigned.uint64 * Unsigned.uint64)
 * val has_flags :
 *   t structure ptr -> Buffer_flags.t_list -> bool
 * val insert_memory :
 *   t structure ptr -> int32 -> Memory.t structure ptr -> unit
 * val is_all_memory_writable :
 *   t structure ptr -> bool
 * val is_memory_range_writable :
 *   t structure ptr -> Unsigned.uint32 -> int32 -> bool
 * val map :
 *   t structure ptr -> Map_flags.t_list -> (bool * Map_info.t structure)
 * val map_range :
 *   t structure ptr -> Unsigned.uint32 -> int32 -> Map_flags.t_list -> (bool * Map_info.t structure)
 * (\*Not implemented gst_buffer_memcmp type C Array type for Types.Array tag not implemented*\)
 * val memset :
 *   t structure ptr -> Unsigned.uint64 -> Unsigned.uint8 -> Unsigned.uint64 -> Unsigned.uint64
 * val n_memory :
 *   t structure ptr -> Unsigned.uint32
 * val peek_memory :
 *   t structure ptr -> Unsigned.uint32 -> Memory.t structure ptr option
 * val prepend_memory :
 *   t structure ptr -> Memory.t structure ptr -> unit
 * val remove_all_memory :
 *   t structure ptr -> unit
 * val remove_memory :
 *   t structure ptr -> Unsigned.uint32 -> unit
 * val remove_memory_range :
 *   t structure ptr -> Unsigned.uint32 -> int32 -> unit
 * val remove_meta :
 *   t structure ptr -> Meta.t structure ptr -> bool
 * val replace_all_memory :
 *   t structure ptr -> Memory.t structure ptr -> unit
 * val replace_memory :
 *   t structure ptr -> Unsigned.uint32 -> Memory.t structure ptr -> unit
 * val replace_memory_range :
 *   t structure ptr -> Unsigned.uint32 -> int32 -> Memory.t structure ptr -> unit
 * val resize :
 *   t structure ptr -> int64 -> int64 -> unit
 * val resize_range :
 *   t structure ptr -> Unsigned.uint32 -> int32 -> int64 -> int64 -> bool
 * val set_flags :
 *   t structure ptr -> Buffer_flags.t_list -> bool
 * val set_size :
 *   t structure ptr -> int64 -> unit
 * val unmap :
 *   t structure ptr -> Map_info.t structure ptr -> unit
 * val unset_flags :
 *   t structure ptr -> Buffer_flags.t_list -> bool
 * val get_max_memory :
 *   unit -> Unsigned.uint32 *)

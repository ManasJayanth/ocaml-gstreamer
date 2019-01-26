open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Buffer"

let f_mini_object = field t_typ "mini_object" (Mini_object.t_typ)
let f_pool = field t_typ "pool" (ptr Buffer_pool.t_typ)
let f_pts = field t_typ "pts" (uint64_t)
let f_dts = field t_typ "dts" (uint64_t)
let f_duration = field t_typ "duration" (uint64_t)
let f_offset = field t_typ "offset" (uint64_t)
let f_offset_end = field t_typ "offset_end" (uint64_t)
let _ = seal t_typ

let create =
  foreign "gst_buffer_new" (void @-> returning (ptr t_typ))
let create_allocate =
  foreign "gst_buffer_new_allocate" (ptr_opt Allocator.t_typ @-> uint64_t @-> ptr_opt Allocation_params.t_typ @-> returning (ptr_opt t_typ))
(*Not implemented gst_buffer_new_wrapped type C Array type for Types.Array tag not implemented*)
(* let create_wrapped_bytes =
 *   foreign "gst_buffer_new_wrapped_bytes" (ptr Bytes.t_typ @-> returning (ptr t_typ)) *)
(*Not implemented gst_buffer_new_wrapped_full type C Array type for Types.Array tag not implemented*)
let add_meta =
  foreign "gst_buffer_add_meta" (ptr t_typ @-> ptr Meta_info.t_typ @-> ptr_opt void @-> returning (ptr_opt Meta.t_typ))
let add_parent_buffer_meta =
  foreign "gst_buffer_add_parent_buffer_meta" (ptr t_typ @-> ptr t_typ @-> returning (ptr_opt Parent_buffer_meta.t_typ))
let add_protection_meta =
  foreign "gst_buffer_add_protection_meta" (ptr t_typ @-> ptr Structure.t_typ @-> returning (ptr Protection_meta.t_typ))
(* let add_reference_timestamp_meta =
 *   foreign "gst_buffer_add_reference_timestamp_meta" (ptr t_typ @-> ptr Caps.t_typ @-> uint64_t @-> uint64_t @-> returning (ptr_opt Reference_timestamp_meta.t_typ))
 * let append =
 *   foreign "gst_buffer_append" (ptr t_typ @-> ptr t_typ @-> returning (ptr t_typ))
 * let append_memory =
 *   foreign "gst_buffer_append_memory" (ptr t_typ @-> ptr Memory.t_typ @-> returning (void))
 * let append_region =
 *   foreign "gst_buffer_append_region" (ptr t_typ @-> ptr t_typ @-> int64_t @-> int64_t @-> returning (ptr t_typ))
 * let copy_deep =
 *   foreign "gst_buffer_copy_deep" (ptr t_typ @-> returning (ptr t_typ))
 * let copy_into =
 *   foreign "gst_buffer_copy_into" (ptr t_typ @-> ptr t_typ @-> Buffer_copy_flags.t_list_view @-> uint64_t @-> uint64_t @-> returning (bool))
 * let copy_region =
 *   foreign "gst_buffer_copy_region" (ptr t_typ @-> Buffer_copy_flags.t_list_view @-> uint64_t @-> uint64_t @-> returning (ptr t_typ))
 * (\*Not implemented gst_buffer_extract type C Array type for Types.Array tag not implemented*\)
 * (\*Not implemented gst_buffer_extract_dup type C Array type for Types.Array tag not implemented*\)
 * (\*Not implemented gst_buffer_fill type C Array type for Types.Array tag not implemented*\)
 * let find_memory self offset size =
 *   let find_memory_raw =
 *     foreign "gst_buffer_find_memory" (ptr t_typ @-> uint64_t @-> uint64_t @-> ptr (uint32_t) @-> ptr (uint32_t) @-> ptr (uint64_t) @-> returning (bool))
 *   in
 *   let idx_ptr = allocate uint32_t Unsigned.UInt32.zero in
 *   let length_ptr = allocate uint32_t Unsigned.UInt32.zero in
 *   let skip_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let ret = find_memory_raw self offset size idx_ptr length_ptr skip_ptr in
 *   let idx = !@ idx_ptr in
 *   let length = !@ length_ptr in
 *   let skip = !@ skip_ptr in
 *   (ret, idx, length, skip)
 * (\*Not implemented gst_buffer_foreach_meta type callback not implemented*\)
 * let get_all_memory =
 *   foreign "gst_buffer_get_all_memory" (ptr t_typ @-> returning (ptr_opt Memory.t_typ))
 * let get_flags =
 *   foreign "gst_buffer_get_flags" (ptr t_typ @-> returning (Buffer_flags.t_list_view))
 * let get_memory =
 *   foreign "gst_buffer_get_memory" (ptr t_typ @-> uint32_t @-> returning (ptr_opt Memory.t_typ))
 * let get_memory_range =
 *   foreign "gst_buffer_get_memory_range" (ptr t_typ @-> uint32_t @-> int32_t @-> returning (ptr_opt Memory.t_typ))
 * (\*Not implemented gst_buffer_get_meta type gType not implemented*\)
 * (\*Not implemented gst_buffer_get_n_meta type gType not implemented*\)
 * let get_reference_timestamp_meta =
 *   foreign "gst_buffer_get_reference_timestamp_meta" (ptr t_typ @-> ptr_opt Caps.t_typ @-> returning (ptr_opt Reference_timestamp_meta.t_typ))
 * let get_size =
 *   foreign "gst_buffer_get_size" (ptr t_typ @-> returning (uint64_t))
 * let get_sizes self =
 *   let get_sizes_raw =
 *     foreign "gst_buffer_get_sizes" (ptr t_typ @-> ptr (uint64_t) @-> ptr (uint64_t) @-> returning (uint64_t))
 *   in
 *   let offset_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let maxsize_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let ret = get_sizes_raw self offset_ptr maxsize_ptr in
 *   let offset = !@ offset_ptr in
 *   let maxsize = !@ maxsize_ptr in
 *   (ret, offset, maxsize)
 * let get_sizes_range self idx length =
 *   let get_sizes_range_raw =
 *     foreign "gst_buffer_get_sizes_range" (ptr t_typ @-> uint32_t @-> int32_t @-> ptr (uint64_t) @-> ptr (uint64_t) @-> returning (uint64_t))
 *   in
 *   let offset_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let maxsize_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let ret = get_sizes_range_raw self idx length offset_ptr maxsize_ptr in
 *   let offset = !@ offset_ptr in
 *   let maxsize = !@ maxsize_ptr in
 *   (ret, offset, maxsize)
 * let has_flags =
 *   foreign "gst_buffer_has_flags" (ptr t_typ @-> Buffer_flags.t_list_view @-> returning (bool))
 * let insert_memory =
 *   foreign "gst_buffer_insert_memory" (ptr t_typ @-> int32_t @-> ptr Memory.t_typ @-> returning (void))
 * let is_all_memory_writable =
 *   foreign "gst_buffer_is_all_memory_writable" (ptr t_typ @-> returning (bool))
 * let is_memory_range_writable =
 *   foreign "gst_buffer_is_memory_range_writable" (ptr t_typ @-> uint32_t @-> int32_t @-> returning (bool))
 * let map self flags =
 *   let map_raw =
 *     foreign "gst_buffer_map" (ptr t_typ @-> Map_flags.t_list_view @-> ptr (Map_info.t_typ) @-> returning (bool))
 *   in
 *   let info_ptr = allocate Map_info.t_typ (make Map_info.t_typ) in
 *   let ret = map_raw self flags info_ptr in
 *   let info = !@ info_ptr in
 *   (ret, info)
 * let map_range self idx length flags =
 *   let map_range_raw =
 *     foreign "gst_buffer_map_range" (ptr t_typ @-> uint32_t @-> int32_t @-> Map_flags.t_list_view @-> ptr (Map_info.t_typ) @-> returning (bool))
 *   in
 *   let info_ptr = allocate Map_info.t_typ (make Map_info.t_typ) in
 *   let ret = map_range_raw self idx length flags info_ptr in
 *   let info = !@ info_ptr in
 *   (ret, info)
 * (\*Not implemented gst_buffer_memcmp type C Array type for Types.Array tag not implemented*\)
 * let memset =
 *   foreign "gst_buffer_memset" (ptr t_typ @-> uint64_t @-> uint8_t @-> uint64_t @-> returning (uint64_t))
 * let n_memory =
 *   foreign "gst_buffer_n_memory" (ptr t_typ @-> returning (uint32_t))
 * let peek_memory =
 *   foreign "gst_buffer_peek_memory" (ptr t_typ @-> uint32_t @-> returning (ptr_opt Memory.t_typ))
 * let prepend_memory =
 *   foreign "gst_buffer_prepend_memory" (ptr t_typ @-> ptr Memory.t_typ @-> returning (void))
 * let remove_all_memory =
 *   foreign "gst_buffer_remove_all_memory" (ptr t_typ @-> returning (void))
 * let remove_memory =
 *   foreign "gst_buffer_remove_memory" (ptr t_typ @-> uint32_t @-> returning (void))
 * let remove_memory_range =
 *   foreign "gst_buffer_remove_memory_range" (ptr t_typ @-> uint32_t @-> int32_t @-> returning (void))
 * let remove_meta =
 *   foreign "gst_buffer_remove_meta" (ptr t_typ @-> ptr Meta.t_typ @-> returning (bool))
 * let replace_all_memory =
 *   foreign "gst_buffer_replace_all_memory" (ptr t_typ @-> ptr Memory.t_typ @-> returning (void))
 * let replace_memory =
 *   foreign "gst_buffer_replace_memory" (ptr t_typ @-> uint32_t @-> ptr Memory.t_typ @-> returning (void))
 * let replace_memory_range =
 *   foreign "gst_buffer_replace_memory_range" (ptr t_typ @-> uint32_t @-> int32_t @-> ptr Memory.t_typ @-> returning (void))
 * let resize =
 *   foreign "gst_buffer_resize" (ptr t_typ @-> int64_t @-> int64_t @-> returning (void))
 * let resize_range =
 *   foreign "gst_buffer_resize_range" (ptr t_typ @-> uint32_t @-> int32_t @-> int64_t @-> int64_t @-> returning (bool))
 * let set_flags =
 *   foreign "gst_buffer_set_flags" (ptr t_typ @-> Buffer_flags.t_list_view @-> returning (bool))
 * let set_size =
 *   foreign "gst_buffer_set_size" (ptr t_typ @-> int64_t @-> returning (void))
 * let unmap =
 *   foreign "gst_buffer_unmap" (ptr t_typ @-> ptr Map_info.t_typ @-> returning (void))
 * let unset_flags =
 *   foreign "gst_buffer_unset_flags" (ptr t_typ @-> Buffer_flags.t_list_view @-> returning (bool))
 * let get_max_memory =
 *   foreign "gst_buffer_get_max_memory" (void @-> returning (uint32_t)) *)

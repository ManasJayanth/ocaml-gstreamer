open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Memory"

let f_mini_object = field t_typ "mini_object" (Mini_object.t_typ)
(* let f_allocator = field t_typ "allocator" (ptr Allocator.t_typ) *)
let f_parent = field t_typ "parent" (ptr t_typ)
let f_maxsize = field t_typ "maxsize" (uint64_t)
let f_align = field t_typ "align" (uint64_t)
let f_offset = field t_typ "offset" (uint64_t)
let f_size = field t_typ "size" (uint64_t)
let _ = seal t_typ

(*Not implemented gst_memory_new_wrapped type C Array type for Types.Array tag not implemented*)
let copy =
  foreign "gst_memory_copy" (ptr t_typ @-> int64_t @-> int64_t @-> returning (ptr t_typ))
let get_sizes self =
  let get_sizes_raw =
    foreign "gst_memory_get_sizes" (ptr t_typ @-> ptr (uint64_t) @-> ptr (uint64_t) @-> returning (uint64_t))
  in
  let offset_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let maxsize_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let ret = get_sizes_raw self offset_ptr maxsize_ptr in
  let offset = !@ offset_ptr in
  let maxsize = !@ maxsize_ptr in
  (ret, offset, maxsize)
let is_span self mem2 =
  let is_span_raw =
    foreign "gst_memory_is_span" (ptr t_typ @-> ptr t_typ @-> ptr (uint64_t) @-> returning (bool))
  in
  let offset_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let ret = is_span_raw self mem2 offset_ptr in
  let offset = !@ offset_ptr in
  (ret, offset)
let is_type =
  foreign "gst_memory_is_type" (ptr t_typ @-> string @-> returning (bool))
let make_mapped self flags =
  let make_mapped_raw =
    foreign "gst_memory_make_mapped" (ptr t_typ @-> Map_flags.t_list_view @-> ptr (Map_info.t_typ) @-> returning (ptr_opt t_typ))
  in
  let info_ptr = allocate Map_info.t_typ (make Map_info.t_typ) in
  let ret = make_mapped_raw self flags info_ptr in
  let info = !@ info_ptr in
  (ret, info)
let map self flags =
  let map_raw =
    foreign "gst_memory_map" (ptr t_typ @-> Map_flags.t_list_view @-> ptr (Map_info.t_typ) @-> returning (bool))
  in
  let info_ptr = allocate Map_info.t_typ (make Map_info.t_typ) in
  let ret = map_raw self flags info_ptr in
  let info = !@ info_ptr in
  (ret, info)
let resize =
  foreign "gst_memory_resize" (ptr t_typ @-> int64_t @-> uint64_t @-> returning (void))
let share =
  foreign "gst_memory_share" (ptr t_typ @-> int64_t @-> int64_t @-> returning (ptr t_typ))
let unmap =
  foreign "gst_memory_unmap" (ptr t_typ @-> ptr Map_info.t_typ @-> returning (void))

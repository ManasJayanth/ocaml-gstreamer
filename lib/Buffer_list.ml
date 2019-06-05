open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Buffer_list"

let create =
  foreign "gst_buffer_list_new" (void @-> returning (ptr t_typ))
let create_sized =
  foreign "gst_buffer_list_new_sized" (uint32_t @-> returning (ptr t_typ))
let calculate_size =
  foreign "gst_buffer_list_calculate_size" (ptr t_typ @-> returning (uint64_t))
let copy_deep =
  foreign "gst_buffer_list_copy_deep" (ptr t_typ @-> returning (ptr t_typ))
(*Not implemented gst_buffer_list_foreach type callback not implemented*)
let get =
  foreign "gst_buffer_list_get" (ptr t_typ @-> uint32_t @-> returning (ptr_opt Buffer.t_typ))
let get_writable =
  foreign "gst_buffer_list_get_writable" (ptr t_typ @-> uint32_t @-> returning (ptr_opt Buffer.t_typ))
let insert =
  foreign "gst_buffer_list_insert" (ptr t_typ @-> int32_t @-> ptr Buffer.t_typ @-> returning (void))
let length =
  foreign "gst_buffer_list_length" (ptr t_typ @-> returning (uint32_t))
let remove =
  foreign "gst_buffer_list_remove" (ptr t_typ @-> uint32_t @-> uint32_t @-> returning (void))

open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

let create =
  foreign "gst_buffer_pool_new" (void @-> returning (ptr t_typ))
let config_add_option =
  foreign "gst_buffer_pool_config_add_option" (ptr Structure.t_typ @-> string @-> returning (void))
(* let config_get_allocator config =
 *   let config_get_allocator_raw =
 *     foreign "gst_buffer_pool_config_get_allocator" (ptr Structure.t_typ @-> ptr (ptr Allocator.t_typ) @-> ptr (Allocation_params.t_typ) @-> returning (bool))
 *   in
 *   let allocator_ptr = allocate (ptr_opt Allocator.t_typ) None in
 *   let params_ptr = allocate Allocation_params.t_typ (make Allocation_params.t_typ) in
 *   let ret = config_get_allocator_raw config allocator_ptr params_ptr in
 *   let allocator = !@ allocator_ptr in
 *   let params = !@ params_ptr in
 *   (ret, allocator, params) *)
(* let config_get_option =
 *   foreign "gst_buffer_pool_config_get_option" (ptr Structure.t_typ @-> uint32_t @-> returning (string_opt))
 * let config_get_params config =
 *   let config_get_params_raw =
 *     foreign "gst_buffer_pool_config_get_params" (ptr Structure.t_typ @-> ptr (ptr Caps.t_typ) @-> ptr (uint32_t) @-> ptr (uint32_t) @-> ptr (uint32_t) @-> returning (bool))
 *   in
 *   let caps_ptr = allocate (ptr_opt Caps.t_typ) None in
 *   let size_ptr = allocate uint32_t Unsigned.UInt32.zero in
 *   let min_buffers_ptr = allocate uint32_t Unsigned.UInt32.zero in
 *   let max_buffers_ptr = allocate uint32_t Unsigned.UInt32.zero in
 *   let ret = config_get_params_raw config caps_ptr size_ptr min_buffers_ptr max_buffers_ptr in
 *   let caps = !@ caps_ptr in
 *   let size = !@ size_ptr in
 *   let min_buffers = !@ min_buffers_ptr in
 *   let max_buffers = !@ max_buffers_ptr in
 *   (ret, caps, size, min_buffers, max_buffers)
 * let config_has_option =
 *   foreign "gst_buffer_pool_config_has_option" (ptr Structure.t_typ @-> string @-> returning (bool))
 * let config_n_options =
 *   foreign "gst_buffer_pool_config_n_options" (ptr Structure.t_typ @-> returning (uint32_t))
 * let config_set_allocator =
 *   foreign "gst_buffer_pool_config_set_allocator" (ptr Structure.t_typ @-> ptr_opt Allocator.t_typ @-> ptr_opt Allocation_params.t_typ @-> returning (void))
 * let config_set_params =
 *   foreign "gst_buffer_pool_config_set_params" (ptr Structure.t_typ @-> ptr Caps.t_typ @-> uint32_t @-> uint32_t @-> uint32_t @-> returning (void))
 * let config_validate_params =
 *   foreign "gst_buffer_pool_config_validate_params" (ptr Structure.t_typ @-> ptr Caps.t_typ @-> uint32_t @-> uint32_t @-> uint32_t @-> returning (bool)) *)
(* let acquire_buffer self params =
 *   let acquire_buffer_raw =
 *     foreign "gst_buffer_pool_acquire_buffer" (ptr t_typ @-> ptr_opt Buffer_pool_acquire_params.t_typ @-> ptr (ptr Buffer.t_typ) @-> returning (Flow_return.t_view))
 *   in
 *   let buffer_ptr = allocate (ptr_opt Buffer.t_typ) None in
 *   let ret = acquire_buffer_raw self params buffer_ptr in
 *   let buffer = !@ buffer_ptr in
 *   (ret, buffer) *)
let get_config =
  foreign "gst_buffer_pool_get_config" (ptr t_typ @-> returning (ptr Structure.t_typ))
(*Not implemented gst_buffer_pool_get_options return type C Array type for Types.Array tag not handled*)
let has_option =
  foreign "gst_buffer_pool_has_option" (ptr t_typ @-> string @-> returning (bool))
let is_active =
  foreign "gst_buffer_pool_is_active" (ptr t_typ @-> returning (bool))
(* let release_buffer =
 *   foreign "gst_buffer_pool_release_buffer" (ptr t_typ @-> ptr Buffer.t_typ @-> returning (void)) *)
let set_active =
  foreign "gst_buffer_pool_set_active" (ptr t_typ @-> bool @-> returning (bool))
let set_config =
  foreign "gst_buffer_pool_set_config" (ptr t_typ @-> ptr Structure.t_typ @-> returning (bool))
let set_flushing =
  foreign "gst_buffer_pool_set_flushing" (ptr t_typ @-> bool @-> returning (void))

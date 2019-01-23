open Ctypes

type t
val t_typ : t typ

val create :
  unit -> t ptr
val config_add_option :
  Structure.t structure ptr -> string -> unit
(* val config_get_allocator :
 *   Structure.t structure ptr -> (bool * Allocator.t ptr * Allocation_params.t structure) *)
(* val config_get_option :
 *   Structure.t structure ptr -> Unsigned.uint32 -> string option *)
(* val config_get_params :
 *   Structure.t structure ptr -> (bool * Caps.t structure ptr * Unsigned.uint32 * Unsigned.uint32 * Unsigned.uint32)
 * val config_has_option :
 *   Structure.t structure ptr -> string -> bool
 * val config_n_options :
 *   Structure.t structure ptr -> Unsigned.uint32
 * val config_set_allocator :
 *   Structure.t structure ptr -> Allocator.t ptr option -> Allocation_params.t structure ptr option -> unit
 * val config_set_params :
 *   Structure.t structure ptr -> Caps.t structure ptr -> Unsigned.uint32 -> Unsigned.uint32 -> Unsigned.uint32 -> unit *)
(* val config_validate_params :
 *   Structure.t structure ptr -> Caps.t structure ptr -> Unsigned.uint32 -> Unsigned.uint32 -> Unsigned.uint32 -> bool *)
(* val acquire_buffer :
 *   t ptr -> Buffer_pool_acquire_params.t structure ptr option -> (Flow_return.t * Buffer.t structure ptr) *)
val get_config :
  t ptr -> Structure.t structure ptr
(*Not implemented gst_buffer_pool_get_options return type C Array type for Types.Array tag not handled*)
val has_option :
  t ptr -> string -> bool
val is_active :
  t ptr -> bool
(* val release_buffer :
 *   t ptr -> Buffer.t structure ptr -> unit *)
val set_active :
  t ptr -> bool -> bool
val set_config :
  t ptr -> Structure.t structure ptr -> bool
val set_flushing :
  t ptr -> bool -> unit

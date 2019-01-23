open Ctypes

type t
val t_typ : t structure typ

val f_mini_object: (Mini_object.t structure, t structure) field
(* val f_allocator: (Allocator.t ptr, t structure) field *)
val f_parent: (t structure ptr, t structure) field
val f_maxsize: (Unsigned.uint64, t structure) field
val f_align: (Unsigned.uint64, t structure) field
val f_offset: (Unsigned.uint64, t structure) field
val f_size: (Unsigned.uint64, t structure) field

(*Not implemented gst_memory_new_wrapped type C Array type for Types.Array tag not implemented*)
val copy :
  t structure ptr -> int64 -> int64 -> t structure ptr
val get_sizes :
  t structure ptr -> (Unsigned.uint64 * Unsigned.uint64 * Unsigned.uint64)
val is_span :
  t structure ptr -> t structure ptr -> (bool * Unsigned.uint64)
val is_type :
  t structure ptr -> string -> bool
val make_mapped :
  t structure ptr -> Map_flags.t_list -> (t structure ptr option * Map_info.t structure)
val map :
  t structure ptr -> Map_flags.t_list -> (bool * Map_info.t structure)
val resize :
  t structure ptr -> int64 -> Unsigned.uint64 -> unit
val share :
  t structure ptr -> int64 -> int64 -> t structure ptr
val unmap :
  t structure ptr -> Map_info.t structure ptr -> unit

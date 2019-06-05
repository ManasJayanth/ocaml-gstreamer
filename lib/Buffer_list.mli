open Ctypes

type t
val t_typ : t structure typ

val create :
  unit -> t structure ptr
val create_sized :
  Unsigned.uint32 -> t structure ptr
val calculate_size :
  t structure ptr -> Unsigned.uint64
val copy_deep :
  t structure ptr -> t structure ptr
(*Not implemented gst_buffer_list_foreach type callback not implemented*)
val get :
  t structure ptr -> Unsigned.uint32 -> Buffer.t structure ptr option
val get_writable :
  t structure ptr -> Unsigned.uint32 -> Buffer.t structure ptr option
val insert :
  t structure ptr -> int32 -> Buffer.t structure ptr -> unit
val length :
  t structure ptr -> Unsigned.uint32
val remove :
  t structure ptr -> Unsigned.uint32 -> Unsigned.uint32 -> unit

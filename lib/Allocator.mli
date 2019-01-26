open Ctypes

type t
val t_typ : t typ

val find :
  string option -> t ptr option
val register :
  string -> t ptr -> unit
val alloc :
  t ptr -> Unsigned.uint64 -> Allocation_params.t structure ptr option -> Memory.t structure ptr option
val free :
  t ptr -> Memory.t structure ptr -> unit
val set_default :
  t ptr -> unit

open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Allocation_params"

let f_flags = field t_typ "flags" (Memory_flags.t_list_view)
let f_align = field t_typ "align" (uint64_t)
let f_prefix = field t_typ "prefix" (uint64_t)
let f_padding = field t_typ "padding" (uint64_t)
(*Struct field Allocation_params : C Array type for Types.Array tag tag not implemented*)
let _ = seal t_typ

let copy =
  foreign "gst_allocation_params_copy" (ptr t_typ @-> returning (ptr_opt t_typ))
let free =
  foreign "gst_allocation_params_free" (ptr t_typ @-> returning (void))
let init =
  foreign "gst_allocation_params_init" (ptr t_typ @-> returning (void))

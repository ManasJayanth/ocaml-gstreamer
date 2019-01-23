open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Map_info"

(* let f_memory = field t_typ "memory" (ptr Memory.t_typ) *)
let f_flags = field t_typ "flags" (Map_flags.t_list_view)
(*Struct field Map_info : C Array type for Types.Array tag tag not implemented*)
let f_size = field t_typ "size" (uint64_t)
let f_maxsize = field t_typ "maxsize" (uint64_t)
(*Struct field Map_info : C Array type for Types.Array tag tag not implemented*)
(*Struct field Map_info : C Array type for Types.Array tag tag not implemented*)
let _ = seal t_typ


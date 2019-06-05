open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Meta_info"

(*Struct field Meta_info : gType tag not implemented*)
(*Struct field Meta_info : gType tag not implemented*)
let f_size = field t_typ "size" (uint64_t)
(*Struct field Meta_info : callback tag not implemented*)
(*Struct field Meta_info : callback tag not implemented*)
(*Struct field Meta_info : callback tag not implemented*)
let _ = seal t_typ


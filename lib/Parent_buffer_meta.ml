open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Parent_buffer_meta"

let f_parent = field t_typ "parent" (Meta.t_typ)
(* let f_buffer = field t_typ "buffer" (ptr Buffer.t_typ) *)
let _ = seal t_typ

let get_info =
  foreign "gst_parent_buffer_meta_get_info" (void @-> returning (ptr Meta_info.t_typ))

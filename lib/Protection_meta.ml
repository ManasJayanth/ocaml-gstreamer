open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Protection_meta"

let f_meta = field t_typ "meta" (Meta.t_typ)
let f_info = field t_typ "info" (ptr Structure.t_typ)
let _ = seal t_typ

let get_info =
  foreign "gst_protection_meta_get_info" (void @-> returning (ptr Meta_info.t_typ))

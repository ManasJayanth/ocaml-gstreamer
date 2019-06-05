open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Context"

let create =
  foreign "gst_context_new" (string @-> bool @-> returning (ptr t_typ))
let get_context_type =
  foreign "gst_context_get_context_type" (ptr t_typ @-> returning (string_opt))
let get_structure =
  foreign "gst_context_get_structure" (ptr t_typ @-> returning (ptr Structure.t_typ))
let has_context_type =
  foreign "gst_context_has_context_type" (ptr t_typ @-> string @-> returning (bool))
let is_persistent =
  foreign "gst_context_is_persistent" (ptr t_typ @-> returning (bool))
let writable_structure =
  foreign "gst_context_writable_structure" (ptr t_typ @-> returning (ptr Structure.t_typ))

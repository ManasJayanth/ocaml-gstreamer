open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Toc"

let create =
  foreign "gst_toc_new" (Toc_scope.t_view @-> returning (ptr t_typ))
let append_entry =
  foreign "gst_toc_append_entry" (ptr t_typ @-> ptr Toc_entry.t_typ @-> returning (void))
let dump =
  foreign "gst_toc_dump" (ptr t_typ @-> returning (void))
let find_entry =
  foreign "gst_toc_find_entry" (ptr t_typ @-> string @-> returning (ptr_opt Toc_entry.t_typ))
(* let get_entries =
 *   foreign "gst_toc_get_entries" (ptr t_typ @-> returning (ptr List.t_typ)) *)
let get_scope =
  foreign "gst_toc_get_scope" (ptr t_typ @-> returning (Toc_scope.t_view))
let get_tags =
  foreign "gst_toc_get_tags" (ptr t_typ @-> returning (ptr Tag_list.t_typ))
let merge_tags =
  foreign "gst_toc_merge_tags" (ptr t_typ @-> ptr_opt Tag_list.t_typ @-> Tag_merge_mode.t_view @-> returning (void))
let set_tags =
  foreign "gst_toc_set_tags" (ptr t_typ @-> ptr_opt Tag_list.t_typ @-> returning (void))

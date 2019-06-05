open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

let create =
  foreign "gst_stream_new" (string_opt @-> ptr_opt Caps.t_typ @-> Stream_type.t_list_view @-> Stream_flags.t_list_view @-> returning (ptr t_typ))
let get_caps =
  foreign "gst_stream_get_caps" (ptr t_typ @-> returning (ptr_opt Caps.t_typ))
let get_stream_flags =
  foreign "gst_stream_get_stream_flags" (ptr t_typ @-> returning (Stream_flags.t_list_view))
let get_stream_id =
  foreign "gst_stream_get_stream_id" (ptr t_typ @-> returning (string_opt))
let get_stream_type =
  foreign "gst_stream_get_stream_type" (ptr t_typ @-> returning (Stream_type.t_list_view))
let get_tags =
  foreign "gst_stream_get_tags" (ptr t_typ @-> returning (ptr_opt Tag_list.t_typ))
let set_caps =
  foreign "gst_stream_set_caps" (ptr t_typ @-> ptr_opt Caps.t_typ @-> returning (void))
let set_stream_flags =
  foreign "gst_stream_set_stream_flags" (ptr t_typ @-> Stream_flags.t_list_view @-> returning (void))
let set_stream_type =
  foreign "gst_stream_set_stream_type" (ptr t_typ @-> Stream_type.t_list_view @-> returning (void))
let set_tags =
  foreign "gst_stream_set_tags" (ptr t_typ @-> ptr_opt Tag_list.t_typ @-> returning (void))

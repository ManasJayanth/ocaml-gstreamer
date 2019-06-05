open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

let create =
  foreign "gst_stream_collection_new" (string_opt @-> returning (ptr t_typ))
let add_stream =
  foreign "gst_stream_collection_add_stream" (ptr t_typ @-> ptr Stream.t_typ @-> returning (bool))
let get_size =
  foreign "gst_stream_collection_get_size" (ptr t_typ @-> returning (uint32_t))
let get_stream =
  foreign "gst_stream_collection_get_stream" (ptr t_typ @-> uint32_t @-> returning (ptr_opt Stream.t_typ))
let get_upstream_id =
  foreign "gst_stream_collection_get_upstream_id" (ptr t_typ @-> returning (string_opt))

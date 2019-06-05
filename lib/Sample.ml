open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Sample"

let create =
  foreign "gst_sample_new" (ptr_opt Buffer.t_typ @-> ptr_opt Caps.t_typ @-> ptr_opt Segment.t_typ @-> ptr_opt Structure.t_typ @-> returning (ptr t_typ))
let get_buffer =
  foreign "gst_sample_get_buffer" (ptr t_typ @-> returning (ptr_opt Buffer.t_typ))
let get_buffer_list =
  foreign "gst_sample_get_buffer_list" (ptr t_typ @-> returning (ptr_opt Buffer_list.t_typ))
let get_caps =
  foreign "gst_sample_get_caps" (ptr t_typ @-> returning (ptr_opt Caps.t_typ))
let get_info =
  foreign "gst_sample_get_info" (ptr t_typ @-> returning (ptr_opt Structure.t_typ))
let get_segment =
  foreign "gst_sample_get_segment" (ptr t_typ @-> returning (ptr Segment.t_typ))
let set_buffer =
  foreign "gst_sample_set_buffer" (ptr t_typ @-> ptr Buffer.t_typ @-> returning (void))
let set_buffer_list =
  foreign "gst_sample_set_buffer_list" (ptr t_typ @-> ptr Buffer_list.t_typ @-> returning (void))
let set_caps =
  foreign "gst_sample_set_caps" (ptr t_typ @-> ptr Caps.t_typ @-> returning (void))
let set_info =
  foreign "gst_sample_set_info" (ptr t_typ @-> ptr Structure.t_typ @-> returning (bool))
let set_segment =
  foreign "gst_sample_set_segment" (ptr t_typ @-> ptr Segment.t_typ @-> returning (void))

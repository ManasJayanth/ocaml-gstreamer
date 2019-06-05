open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

let create =
  foreign "gst_bin_new" (string_opt @-> returning (ptr Element.t_typ))
let add =
  foreign "gst_bin_add" (ptr t_typ @-> ptr Element.t_typ @-> returning (bool))
let find_unlinked_pad =
  foreign "gst_bin_find_unlinked_pad" (ptr t_typ @-> Pad_direction.t_view @-> returning (ptr_opt Pad.t_typ))
(*Not implemented gst_bin_get_by_interface type gType not implemented*)
let get_by_name =
  foreign "gst_bin_get_by_name" (ptr t_typ @-> string @-> returning (ptr_opt Element.t_typ))
let get_by_name_recurse_up =
  foreign "gst_bin_get_by_name_recurse_up" (ptr t_typ @-> string @-> returning (ptr_opt Element.t_typ))
let get_suppressed_flags =
  foreign "gst_bin_get_suppressed_flags" (ptr t_typ @-> returning (Element_flags.t_list_view))
(*Not implemented gst_bin_iterate_all_by_interface type gType not implemented*)
let iterate_elements =
  foreign "gst_bin_iterate_elements" (ptr t_typ @-> returning (ptr_opt Iterator.t_typ))
let iterate_recurse =
  foreign "gst_bin_iterate_recurse" (ptr t_typ @-> returning (ptr_opt Iterator.t_typ))
let iterate_sinks =
  foreign "gst_bin_iterate_sinks" (ptr t_typ @-> returning (ptr_opt Iterator.t_typ))
let iterate_sorted =
  foreign "gst_bin_iterate_sorted" (ptr t_typ @-> returning (ptr_opt Iterator.t_typ))
let iterate_sources =
  foreign "gst_bin_iterate_sources" (ptr t_typ @-> returning (ptr_opt Iterator.t_typ))
let recalculate_latency =
  foreign "gst_bin_recalculate_latency" (ptr t_typ @-> returning (bool))
let remove =
  foreign "gst_bin_remove" (ptr t_typ @-> ptr Element.t_typ @-> returning (bool))
let set_suppressed_flags =
  foreign "gst_bin_set_suppressed_flags" (ptr t_typ @-> Element_flags.t_list_view @-> returning (void))
let sync_children_states =
  foreign "gst_bin_sync_children_states" (ptr t_typ @-> returning (bool))

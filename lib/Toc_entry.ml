open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Toc_entry"

let create =
  foreign "gst_toc_entry_new" (Toc_entry_type.t_view @-> string @-> returning (ptr t_typ))
let append_sub_entry =
  foreign "gst_toc_entry_append_sub_entry" (ptr t_typ @-> ptr t_typ @-> returning (void))
let get_entry_type =
  foreign "gst_toc_entry_get_entry_type" (ptr t_typ @-> returning (Toc_entry_type.t_view))
(* let get_loop self =
 *   let get_loop_raw =
 *     foreign "gst_toc_entry_get_loop" (ptr t_typ @-> ptr (Toc_loop_type.t_view) @-> ptr (int32_t) @-> returning (bool))
 *   in
 *   let loop_type_ptr = allocate Toc_loop_type.t_view (Toc_loop_type.t_view.of_value (Unsigned.UInt32.zero)) in
 *   let repeat_count_ptr = allocate int32_t Int32.zero in
 *   let ret = get_loop_raw self loop_type_ptr repeat_count_ptr in
 *   let loop_type = (!@ loop_type_ptr) in
 *   let repeat_count = !@ repeat_count_ptr in
 *   (ret, loop_type, repeat_count) *)
let get_parent =
  foreign "gst_toc_entry_get_parent" (ptr t_typ @-> returning (ptr_opt t_typ))
let get_start_stop_times self =
  let get_start_stop_times_raw =
    foreign "gst_toc_entry_get_start_stop_times" (ptr t_typ @-> ptr (int64_t) @-> ptr (int64_t) @-> returning (bool))
  in
  let start_ptr = allocate int64_t Int64.zero in
  let stop_ptr = allocate int64_t Int64.zero in
  let ret = get_start_stop_times_raw self start_ptr stop_ptr in
  let start = !@ start_ptr in
  let stop = !@ stop_ptr in
  (ret, start, stop)
(* let get_sub_entries =
 *   foreign "gst_toc_entry_get_sub_entries" (ptr t_typ @-> returning (ptr List.t_typ)) *)
let get_tags =
  foreign "gst_toc_entry_get_tags" (ptr t_typ @-> returning (ptr Tag_list.t_typ))
(* let get_toc =
 *   foreign "gst_toc_entry_get_toc" (ptr t_typ @-> returning (ptr Toc.t_typ)) *)
let get_uid =
  foreign "gst_toc_entry_get_uid" (ptr t_typ @-> returning (string_opt))
let is_alternative =
  foreign "gst_toc_entry_is_alternative" (ptr t_typ @-> returning (bool))
let is_sequence =
  foreign "gst_toc_entry_is_sequence" (ptr t_typ @-> returning (bool))
let merge_tags =
  foreign "gst_toc_entry_merge_tags" (ptr t_typ @-> ptr_opt Tag_list.t_typ @-> Tag_merge_mode.t_view @-> returning (void))
let set_loop =
  foreign "gst_toc_entry_set_loop" (ptr t_typ @-> Toc_loop_type.t_view @-> int32_t @-> returning (void))
let set_start_stop_times =
  foreign "gst_toc_entry_set_start_stop_times" (ptr t_typ @-> int64_t @-> int64_t @-> returning (void))
let set_tags =
  foreign "gst_toc_entry_set_tags" (ptr t_typ @-> ptr_opt Tag_list.t_typ @-> returning (void))

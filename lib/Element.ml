open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

let make_from_uri _type uri elementname =
  let make_from_uri_raw =
    foreign "gst_element_make_from_uri" (URIType.t_view @-> string @-> string_opt @-> ptr (ptr_opt Error.t_typ) @-> returning (ptr_opt t_typ))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let ret = make_from_uri_raw _type uri elementname err_ptr_ptr in
  match (!@ err_ptr_ptr) with
  | None -> Ok ret
  | Some _ -> let err_ptr = !@ err_ptr_ptr in
    let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
    Error (err_ptr)
(*Not implemented gst_element_register type gType not implemented*)
let state_change_return_get_name =
  foreign "gst_element_state_change_return_get_name" (State_change_return.t_view @-> returning (string_opt))
let state_get_name =
  foreign "gst_element_state_get_name" (State.t_view @-> returning (string_opt))
let abort_state =
  foreign "gst_element_abort_state" (ptr t_typ @-> returning (void))
let add_pad =
  foreign "gst_element_add_pad" (ptr t_typ @-> ptr Pad.t_typ @-> returning (bool))
let add_property_deep_notify_watch =
  foreign "gst_element_add_property_deep_notify_watch" (ptr t_typ @-> string_opt @-> bool @-> returning (uint64_t))
let add_property_notify_watch =
  foreign "gst_element_add_property_notify_watch" (ptr t_typ @-> string_opt @-> bool @-> returning (uint64_t))
(*Not implemented gst_element_call_async type callback not implemented*)
let change_state =
  foreign "gst_element_change_state" (ptr t_typ @-> State_change.t_view @-> returning (State_change_return.t_view))
let continue_state =
  foreign "gst_element_continue_state" (ptr t_typ @-> State_change_return.t_view @-> returning (State_change_return.t_view))
let create_all_pads =
  foreign "gst_element_create_all_pads" (ptr t_typ @-> returning (void))
(*Not implemented gst_element_foreach_pad type callback not implemented*)
(*Not implemented gst_element_foreach_sink_pad type callback not implemented*)
(*Not implemented gst_element_foreach_src_pad type callback not implemented*)
let get_base_time =
  foreign "gst_element_get_base_time" (ptr t_typ @-> returning (uint64_t))
let get_bus =
  foreign "gst_element_get_bus" (ptr t_typ @-> returning (ptr_opt Bus.t_typ))
let get_clock =
  foreign "gst_element_get_clock" (ptr t_typ @-> returning (ptr_opt Clock.t_typ))
let get_compatible_pad =
  foreign "gst_element_get_compatible_pad" (ptr t_typ @-> ptr Pad.t_typ @-> ptr_opt Caps.t_typ @-> returning (ptr_opt Pad.t_typ))
let get_compatible_pad_template =
  foreign "gst_element_get_compatible_pad_template" (ptr t_typ @-> ptr Pad_template.t_typ @-> returning (ptr_opt Pad_template.t_typ))
let get_context =
  foreign "gst_element_get_context" (ptr t_typ @-> string @-> returning (ptr Context.t_typ))
let get_context_unlocked =
  foreign "gst_element_get_context_unlocked" (ptr t_typ @-> string @-> returning (ptr_opt Context.t_typ))
(* let get_contexts =
 *   foreign "gst_element_get_contexts" (ptr t_typ @-> returning (ptr List.t_typ)) *)
let get_factory =
  foreign "gst_element_get_factory" (ptr t_typ @-> returning (ptr Element_factory.t_typ))
let get_metadata =
  foreign "gst_element_get_metadata" (ptr t_typ @-> string @-> returning (string_opt))
let get_pad_template =
  foreign "gst_element_get_pad_template" (ptr t_typ @-> string @-> returning (ptr_opt Pad_template.t_typ))
(* let get_pad_template_list =
 *   foreign "gst_element_get_pad_template_list" (ptr t_typ @-> returning (ptr List.t_typ)) *)
let get_request_pad =
  foreign "gst_element_get_request_pad" (ptr t_typ @-> string @-> returning (ptr_opt Pad.t_typ))
let get_start_time =
  foreign "gst_element_get_start_time" (ptr t_typ @-> returning (uint64_t))
let get_state self timeout =
  let get_state_raw =
    foreign "gst_element_get_state" (ptr t_typ @-> uint64_t @-> ptr (State.t_view) @-> ptr (State.t_view) @-> returning (State_change_return.t_view))
  in
  let state_ptr = allocate State.t_view (State.of_value (Unsigned.UInt32.zero)) in
  let pending_ptr = allocate State.t_view (State.of_value (Unsigned.UInt32.zero)) in
  let ret = get_state_raw self timeout state_ptr pending_ptr in
  let state = (!@ state_ptr) in
  let pending = (!@ pending_ptr) in
  (ret, state, pending)
let get_static_pad =
  foreign "gst_element_get_static_pad" (ptr t_typ @-> string @-> returning (ptr_opt Pad.t_typ))
let is_locked_state =
  foreign "gst_element_is_locked_state" (ptr t_typ @-> returning (bool))
(* let iterate_pads =
 *   foreign "gst_element_iterate_pads" (ptr t_typ @-> returning (ptr Iterator.t_typ))
 * let iterate_sink_pads =
 *   foreign "gst_element_iterate_sink_pads" (ptr t_typ @-> returning (ptr Iterator.t_typ))
 * let iterate_src_pads =
 *   foreign "gst_element_iterate_src_pads" (ptr t_typ @-> returning (ptr Iterator.t_typ))
 * let link =
 *   foreign "gst_element_link" (ptr t_typ @-> ptr t_typ @-> returning (bool))
 * let link_filtered =
 *   foreign "gst_element_link_filtered" (ptr t_typ @-> ptr t_typ @-> ptr_opt Caps.t_typ @-> returning (bool))
 * let link_pads =
 *   foreign "gst_element_link_pads" (ptr t_typ @-> string_opt @-> ptr t_typ @-> string_opt @-> returning (bool))
 * let link_pads_filtered =
 *   foreign "gst_element_link_pads_filtered" (ptr t_typ @-> string_opt @-> ptr t_typ @-> string_opt @-> ptr_opt Caps.t_typ @-> returning (bool))
 * let link_pads_full =
 *   foreign "gst_element_link_pads_full" (ptr t_typ @-> string_opt @-> ptr t_typ @-> string_opt @-> Pad_link_check.t_list_view @-> returning (bool))
 * let lost_state =
 *   foreign "gst_element_lost_state" (ptr t_typ @-> returning (void))
 * let message_full =
 *   foreign "gst_element_message_full" (ptr t_typ @-> Message_type.t_list_view @-> uint32_t @-> int32_t @-> string_opt @-> string_opt @-> string @-> string @-> int32_t @-> returning (void))
 * let message_full_with_details =
 *   foreign "gst_element_message_full_with_details" (ptr t_typ @-> Message_type.t_list_view @-> uint32_t @-> int32_t @-> string_opt @-> string_opt @-> string @-> string @-> int32_t @-> ptr Structure.t_typ @-> returning (void))
 * let no_more_pads =
 *   foreign "gst_element_no_more_pads" (ptr t_typ @-> returning (void))
 * let post_message =
 *   foreign "gst_element_post_message" (ptr t_typ @-> ptr Message.t_typ @-> returning (bool))
 * let provide_clock =
 *   foreign "gst_element_provide_clock" (ptr t_typ @-> returning (ptr_opt Clock.t_typ))
 * let query =
 *   foreign "gst_element_query" (ptr t_typ @-> ptr Query.t_typ @-> returning (bool))
 * let query_convert self src_format src_val dest_format =
 *   let query_convert_raw =
 *     foreign "gst_element_query_convert" (ptr t_typ @-> Format.t_view @-> int64_t @-> Format.t_view @-> ptr (int64_t) @-> returning (bool))
 *   in
 *   let dest_val_ptr = allocate int64_t Int64.zero in
 *   let ret = query_convert_raw self src_format src_val dest_format dest_val_ptr in
 *   let dest_val = !@ dest_val_ptr in
 *   (ret, dest_val)
 * let query_duration self format =
 *   let query_duration_raw =
 *     foreign "gst_element_query_duration" (ptr t_typ @-> Format.t_view @-> ptr (int64_t) @-> returning (bool))
 *   in
 *   let duration_ptr = allocate int64_t Int64.zero in
 *   let ret = query_duration_raw self format duration_ptr in
 *   let duration = !@ duration_ptr in
 *   (ret, duration)
 * let query_position self format =
 *   let query_position_raw =
 *     foreign "gst_element_query_position" (ptr t_typ @-> Format.t_view @-> ptr (int64_t) @-> returning (bool))
 *   in
 *   let cur_ptr = allocate int64_t Int64.zero in
 *   let ret = query_position_raw self format cur_ptr in
 *   let cur = !@ cur_ptr in
 *   (ret, cur)
 * let release_request_pad =
 *   foreign "gst_element_release_request_pad" (ptr t_typ @-> ptr Pad.t_typ @-> returning (void))
 * let remove_pad =
 *   foreign "gst_element_remove_pad" (ptr t_typ @-> ptr Pad.t_typ @-> returning (bool))
 * let remove_property_notify_watch =
 *   foreign "gst_element_remove_property_notify_watch" (ptr t_typ @-> uint64_t @-> returning (void))
 * let request_pad =
 *   foreign "gst_element_request_pad" (ptr t_typ @-> ptr Pad_template.t_typ @-> string_opt @-> ptr_opt Caps.t_typ @-> returning (ptr_opt Pad.t_typ))
 * let seek =
 *   foreign "gst_element_seek" (ptr t_typ @-> double @-> Format.t_view @-> Seek_flags.t_list_view @-> Seek_type.t_view @-> int64_t @-> Seek_type.t_view @-> int64_t @-> returning (bool))
 * let seek_simple =
 *   foreign "gst_element_seek_simple" (ptr t_typ @-> Format.t_view @-> Seek_flags.t_list_view @-> int64_t @-> returning (bool))
 * let send_event =
 *   foreign "gst_element_send_event" (ptr t_typ @-> ptr Event.t_typ @-> returning (bool))
 * let set_base_time =
 *   foreign "gst_element_set_base_time" (ptr t_typ @-> uint64_t @-> returning (void))
 * let set_bus =
 *   foreign "gst_element_set_bus" (ptr t_typ @-> ptr_opt Bus.t_typ @-> returning (void))
 * let set_clock =
 *   foreign "gst_element_set_clock" (ptr t_typ @-> ptr_opt Clock.t_typ @-> returning (bool))
 * let set_context =
 *   foreign "gst_element_set_context" (ptr t_typ @-> ptr Context.t_typ @-> returning (void))
 * let set_locked_state =
 *   foreign "gst_element_set_locked_state" (ptr t_typ @-> bool @-> returning (bool))
 * let set_start_time =
 *   foreign "gst_element_set_start_time" (ptr t_typ @-> uint64_t @-> returning (void))
 * let set_state =
 *   foreign "gst_element_set_state" (ptr t_typ @-> State.t_view @-> returning (State_change_return.t_view))
 * let sync_state_with_parent =
 *   foreign "gst_element_sync_state_with_parent" (ptr t_typ @-> returning (bool))
 * let unlink =
 *   foreign "gst_element_unlink" (ptr t_typ @-> ptr t_typ @-> returning (void))
 * let unlink_pads =
 *   foreign "gst_element_unlink_pads" (ptr t_typ @-> string @-> ptr t_typ @-> string @-> returning (void)) *)

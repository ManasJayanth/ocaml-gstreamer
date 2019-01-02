open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

(* let create =
 *   foreign "gst_pad_new" (string_opt @-> Pad_direction.t_view @-> returning (ptr_opt t_typ))
 * let create_from_static_template =
 *   foreign "gst_pad_new_from_static_template" (ptr Static_pad_template.t_typ @-> string @-> returning (ptr_opt t_typ))
 * let create_from_template =
 *   foreign "gst_pad_new_from_template" (ptr Pad_template.t_typ @-> string_opt @-> returning (ptr_opt t_typ))
 * let link_get_name =
 *   foreign "gst_pad_link_get_name" (Pad_link_return.t_view @-> returning (string_opt))
 * let activate_mode =
 *   foreign "gst_pad_activate_mode" (t_typ @-> Pad_mode.t_view @-> bool @-> returning (bool))
 * (\*Not implemented gst_pad_add_probe type callback not implemented*\)
 * let can_link =
 *   foreign "gst_pad_can_link" (t_typ @-> ptr t_typ @-> returning (bool))
 * let chain =
 *   foreign "gst_pad_chain" (t_typ @-> ptr Buffer.t_typ @-> returning (Flow_return.t_view))
 * let chain_list =
 *   foreign "gst_pad_chain_list" (t_typ @-> ptr Buffer_list.t_typ @-> returning (Flow_return.t_view))
 * let check_reconfigure =
 *   foreign "gst_pad_check_reconfigure" (t_typ @-> returning (bool))
 * let create_stream_id =
 *   foreign "gst_pad_create_stream_id" (t_typ @-> ptr Element.t_typ @-> string_opt @-> returning (string_opt))
 * let event_default =
 *   foreign "gst_pad_event_default" (t_typ @-> ptr_opt Object.t_typ @-> ptr Event.t_typ @-> returning (bool))
 * (\*Not implemented gst_pad_forward type callback not implemented*\)
 * let get_allowed_caps =
 *   foreign "gst_pad_get_allowed_caps" (t_typ @-> returning (ptr_opt Caps.t_typ))
 * let get_current_caps =
 *   foreign "gst_pad_get_current_caps" (t_typ @-> returning (ptr_opt Caps.t_typ))
 * let get_direction =
 *   foreign "gst_pad_get_direction" (t_typ @-> returning (Pad_direction.t_view))
 * let get_element_private =
 *   foreign "gst_pad_get_element_private" (t_typ @-> returning (ptr_opt void))
 * let get_last_flow_return =
 *   foreign "gst_pad_get_last_flow_return" (t_typ @-> returning (Flow_return.t_view))
 * let get_offset =
 *   foreign "gst_pad_get_offset" (t_typ @-> returning (int64_t))
 * let get_pad_template =
 *   foreign "gst_pad_get_pad_template" (t_typ @-> returning (ptr_opt Pad_template.t_typ))
 * let get_pad_template_caps =
 *   foreign "gst_pad_get_pad_template_caps" (t_typ @-> returning (ptr Caps.t_typ))
 * let get_parent_element =
 *   foreign "gst_pad_get_parent_element" (t_typ @-> returning (ptr_opt Element.t_typ))
 * let get_peer =
 *   foreign "gst_pad_get_peer" (t_typ @-> returning (ptr_opt t_typ))
 * let get_range self offset size =
 *   let get_range_raw =
 *     foreign "gst_pad_get_range" (t_typ @-> uint64_t @-> uint32_t @-> ptr (ptr Buffer.t_typ) @-> returning (Flow_return.t_view))
 *   in
 *   let buffer_ptr = allocate (ptr_opt Buffer.t_typ) None in
 *   let ret = get_range_raw self offset size buffer_ptr in
 *   let buffer = !@ buffer_ptr in
 *   (ret, buffer)
 * let get_sticky_event =
 *   foreign "gst_pad_get_sticky_event" (t_typ @-> Event_type.t_view @-> uint32_t @-> returning (ptr_opt Event.t_typ))
 * let get_stream =
 *   foreign "gst_pad_get_stream" (t_typ @-> returning (ptr_opt Stream.t_typ))
 * let get_stream_id =
 *   foreign "gst_pad_get_stream_id" (t_typ @-> returning (string_opt))
 * let get_task_state =
 *   foreign "gst_pad_get_task_state" (t_typ @-> returning (Task_state.t_view))
 * let has_current_caps =
 *   foreign "gst_pad_has_current_caps" (t_typ @-> returning (bool))
 * let is_active =
 *   foreign "gst_pad_is_active" (t_typ @-> returning (bool))
 * let is_blocked =
 *   foreign "gst_pad_is_blocked" (t_typ @-> returning (bool))
 * let is_blocking =
 *   foreign "gst_pad_is_blocking" (t_typ @-> returning (bool))
 * let is_linked =
 *   foreign "gst_pad_is_linked" (t_typ @-> returning (bool))
 * let iterate_internal_links =
 *   foreign "gst_pad_iterate_internal_links" (t_typ @-> returning (ptr_opt Iterator.t_typ))
 * let iterate_internal_links_default =
 *   foreign "gst_pad_iterate_internal_links_default" (t_typ @-> ptr_opt Object.t_typ @-> returning (ptr_opt Iterator.t_typ))
 * let link =
 *   foreign "gst_pad_link" (t_typ @-> ptr t_typ @-> returning (Pad_link_return.t_view))
 * let link_full =
 *   foreign "gst_pad_link_full" (t_typ @-> ptr t_typ @-> Pad_link_check.t_list_view @-> returning (Pad_link_return.t_view))
 * let link_maybe_ghosting =
 *   foreign "gst_pad_link_maybe_ghosting" (t_typ @-> ptr t_typ @-> returning (bool))
 * let link_maybe_ghosting_full =
 *   foreign "gst_pad_link_maybe_ghosting_full" (t_typ @-> ptr t_typ @-> Pad_link_check.t_list_view @-> returning (bool))
 * let mark_reconfigure =
 *   foreign "gst_pad_mark_reconfigure" (t_typ @-> returning (void))
 * let needs_reconfigure =
 *   foreign "gst_pad_needs_reconfigure" (t_typ @-> returning (bool))
 * let pause_task =
 *   foreign "gst_pad_pause_task" (t_typ @-> returning (bool))
 * let peer_query =
 *   foreign "gst_pad_peer_query" (t_typ @-> ptr Query.t_typ @-> returning (bool))
 * let peer_query_accept_caps =
 *   foreign "gst_pad_peer_query_accept_caps" (t_typ @-> ptr Caps.t_typ @-> returning (bool))
 * let peer_query_caps =
 *   foreign "gst_pad_peer_query_caps" (t_typ @-> ptr_opt Caps.t_typ @-> returning (ptr Caps.t_typ))
 * let peer_query_convert self src_format src_val dest_format =
 *   let peer_query_convert_raw =
 *     foreign "gst_pad_peer_query_convert" (t_typ @-> Format.t_view @-> int64_t @-> Format.t_view @-> ptr (int64_t) @-> returning (bool))
 *   in
 *   let dest_val_ptr = allocate int64_t Int64.zero in
 *   let ret = peer_query_convert_raw self src_format src_val dest_format dest_val_ptr in
 *   let dest_val = !@ dest_val_ptr in
 *   (ret, dest_val)
 * let peer_query_duration self format =
 *   let peer_query_duration_raw =
 *     foreign "gst_pad_peer_query_duration" (t_typ @-> Format.t_view @-> ptr (int64_t) @-> returning (bool))
 *   in
 *   let duration_ptr = allocate int64_t Int64.zero in
 *   let ret = peer_query_duration_raw self format duration_ptr in
 *   let duration = !@ duration_ptr in
 *   (ret, duration)
 * let peer_query_position self format =
 *   let peer_query_position_raw =
 *     foreign "gst_pad_peer_query_position" (t_typ @-> Format.t_view @-> ptr (int64_t) @-> returning (bool))
 *   in
 *   let cur_ptr = allocate int64_t Int64.zero in
 *   let ret = peer_query_position_raw self format cur_ptr in
 *   let cur = !@ cur_ptr in
 *   (ret, cur)
 * let proxy_query_accept_caps =
 *   foreign "gst_pad_proxy_query_accept_caps" (t_typ @-> ptr Query.t_typ @-> returning (bool))
 * let proxy_query_caps =
 *   foreign "gst_pad_proxy_query_caps" (t_typ @-> ptr Query.t_typ @-> returning (bool))
 * let pull_range self offset size =
 *   let pull_range_raw =
 *     foreign "gst_pad_pull_range" (t_typ @-> uint64_t @-> uint32_t @-> ptr (ptr Buffer.t_typ) @-> returning (Flow_return.t_view))
 *   in
 *   let buffer_ptr = allocate (ptr_opt Buffer.t_typ) None in
 *   let ret = pull_range_raw self offset size buffer_ptr in
 *   let buffer = !@ buffer_ptr in
 *   (ret, buffer)
 * let push =
 *   foreign "gst_pad_push" (t_typ @-> ptr Buffer.t_typ @-> returning (Flow_return.t_view))
 * let push_event =
 *   foreign "gst_pad_push_event" (t_typ @-> ptr Event.t_typ @-> returning (bool))
 * let push_list =
 *   foreign "gst_pad_push_list" (t_typ @-> ptr Buffer_list.t_typ @-> returning (Flow_return.t_view))
 * let query =
 *   foreign "gst_pad_query" (t_typ @-> ptr Query.t_typ @-> returning (bool))
 * let query_accept_caps =
 *   foreign "gst_pad_query_accept_caps" (t_typ @-> ptr Caps.t_typ @-> returning (bool))
 * let query_caps =
 *   foreign "gst_pad_query_caps" (t_typ @-> ptr_opt Caps.t_typ @-> returning (ptr Caps.t_typ))
 * let query_convert self src_format src_val dest_format =
 *   let query_convert_raw =
 *     foreign "gst_pad_query_convert" (t_typ @-> Format.t_view @-> int64_t @-> Format.t_view @-> ptr (int64_t) @-> returning (bool))
 *   in
 *   let dest_val_ptr = allocate int64_t Int64.zero in
 *   let ret = query_convert_raw self src_format src_val dest_format dest_val_ptr in
 *   let dest_val = !@ dest_val_ptr in
 *   (ret, dest_val)
 * let query_default =
 *   foreign "gst_pad_query_default" (t_typ @-> ptr_opt Object.t_typ @-> ptr Query.t_typ @-> returning (bool))
 * let query_duration self format =
 *   let query_duration_raw =
 *     foreign "gst_pad_query_duration" (t_typ @-> Format.t_view @-> ptr (int64_t) @-> returning (bool))
 *   in
 *   let duration_ptr = allocate int64_t Int64.zero in
 *   let ret = query_duration_raw self format duration_ptr in
 *   let duration = !@ duration_ptr in
 *   (ret, duration)
 * let query_position self format =
 *   let query_position_raw =
 *     foreign "gst_pad_query_position" (t_typ @-> Format.t_view @-> ptr (int64_t) @-> returning (bool))
 *   in
 *   let cur_ptr = allocate int64_t Int64.zero in
 *   let ret = query_position_raw self format cur_ptr in
 *   let cur = !@ cur_ptr in
 *   (ret, cur)
 * let remove_probe =
 *   foreign "gst_pad_remove_probe" (t_typ @-> uint64_t @-> returning (void))
 * let send_event =
 *   foreign "gst_pad_send_event" (t_typ @-> ptr Event.t_typ @-> returning (bool))
 * (\*Not implemented gst_pad_set_activate_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_activatemode_function_full type callback not implemented*\)
 * let set_active =
 *   foreign "gst_pad_set_active" (t_typ @-> bool @-> returning (bool))
 * (\*Not implemented gst_pad_set_chain_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_chain_list_function_full type callback not implemented*\)
 * let set_element_private =
 *   foreign "gst_pad_set_element_private" (t_typ @-> ptr_opt void @-> returning (void))
 * (\*Not implemented gst_pad_set_event_full_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_event_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_getrange_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_iterate_internal_links_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_link_function_full type callback not implemented*\)
 * let set_offset =
 *   foreign "gst_pad_set_offset" (t_typ @-> int64_t @-> returning (void))
 * (\*Not implemented gst_pad_set_query_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_unlink_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_start_task type callback not implemented*\)
 * (\*Not implemented gst_pad_sticky_events_foreach type callback not implemented*\)
 * let stop_task =
 *   foreign "gst_pad_stop_task" (t_typ @-> returning (bool))
 * let store_sticky_event =
 *   foreign "gst_pad_store_sticky_event" (t_typ @-> ptr Event.t_typ @-> returning (Flow_return.t_view))
 * let unlink =
 *   foreign "gst_pad_unlink" (t_typ @-> ptr t_typ @-> returning (bool))
 * let use_fixed_caps =
 *   foreign "gst_pad_use_fixed_caps" (t_typ @-> returning (void)) *)

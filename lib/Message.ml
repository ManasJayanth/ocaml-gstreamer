open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Message"

let f_mini_object = field t_typ "mini_object" (Mini_object.t_typ)
let f_type = field t_typ "type" (Message_type.t_list_view)
let f_timestamp = field t_typ "timestamp" (uint64_t)
let f_src = field t_typ "src" (ptr Object.t_typ)
let f_seqnum = field t_typ "seqnum" (uint32_t)
(*Struct field Message : union tag not implemented*)
(* let f_cond = field t_typ "cond" (Cond.t_typ) *)
let _ = seal t_typ

let create_application =
  foreign "gst_message_new_application" (ptr_opt Object.t_typ @-> ptr Structure.t_typ @-> returning (ptr_opt t_typ))
let create_async_done =
  foreign "gst_message_new_async_done" (ptr_opt Object.t_typ @-> uint64_t @-> returning (ptr t_typ))
let create_async_start =
  foreign "gst_message_new_async_start" (ptr_opt Object.t_typ @-> returning (ptr t_typ))
let create_buffering =
  foreign "gst_message_new_buffering" (ptr_opt Object.t_typ @-> int32_t @-> returning (ptr_opt t_typ))
let create_clock_lost =
  foreign "gst_message_new_clock_lost" (ptr_opt Object.t_typ @-> ptr Clock.t_typ @-> returning (ptr t_typ))
let create_clock_provide =
  foreign "gst_message_new_clock_provide" (ptr_opt Object.t_typ @-> ptr Clock.t_typ @-> bool @-> returning (ptr t_typ))
let create_custom =
  foreign "gst_message_new_custom" (Message_type.t_list_view @-> ptr_opt Object.t_typ @-> ptr_opt Structure.t_typ @-> returning (ptr_opt t_typ))
let create_device_added =
  foreign "gst_message_new_device_added" (ptr Object.t_typ @-> ptr Device.t_typ @-> returning (ptr t_typ))
let create_device_removed =
  foreign "gst_message_new_device_removed" (ptr Object.t_typ @-> ptr Device.t_typ @-> returning (ptr t_typ))
let create_duration_changed =
  foreign "gst_message_new_duration_changed" (ptr_opt Object.t_typ @-> returning (ptr t_typ))
let create_element =
  foreign "gst_message_new_element" (ptr_opt Object.t_typ @-> ptr Structure.t_typ @-> returning (ptr_opt t_typ))
let create_eos =
  foreign "gst_message_new_eos" (ptr_opt Object.t_typ @-> returning (ptr t_typ))
let create_error =
  foreign "gst_message_new_error" (ptr_opt Object.t_typ @-> ptr Error.t_typ @-> string @-> returning (ptr t_typ))
let create_error_with_details =
  foreign "gst_message_new_error_with_details" (ptr_opt Object.t_typ @-> ptr Error.t_typ @-> string @-> ptr Structure.t_typ @-> returning (ptr_opt t_typ))
let create_have_context =
  foreign "gst_message_new_have_context" (ptr_opt Object.t_typ @-> ptr Context.t_typ @-> returning (ptr t_typ))
let create_info =
  foreign "gst_message_new_info" (ptr_opt Object.t_typ @-> ptr Error.t_typ @-> string @-> returning (ptr t_typ))
let create_info_with_details =
  foreign "gst_message_new_info_with_details" (ptr_opt Object.t_typ @-> ptr Error.t_typ @-> string @-> ptr Structure.t_typ @-> returning (ptr_opt t_typ))
let create_latency =
  foreign "gst_message_new_latency" (ptr_opt Object.t_typ @-> returning (ptr t_typ))
let create_need_context =
  foreign "gst_message_new_need_context" (ptr_opt Object.t_typ @-> string @-> returning (ptr t_typ))
let create_create_clock =
  foreign "gst_message_new_new_clock" (ptr_opt Object.t_typ @-> ptr Clock.t_typ @-> returning (ptr t_typ))
let create_progress =
  foreign "gst_message_new_progress" (ptr Object.t_typ @-> Progress_type.t_view @-> string @-> string @-> returning (ptr_opt t_typ))
let create_property_notify =
  foreign "gst_message_new_property_notify" (ptr Object.t_typ @-> string @-> ptr_opt Value.t_typ @-> returning (ptr t_typ))
let create_qos =
  foreign "gst_message_new_qos" (ptr Object.t_typ @-> bool @-> uint64_t @-> uint64_t @-> uint64_t @-> uint64_t @-> returning (ptr t_typ))
let create_redirect =
  foreign "gst_message_new_redirect" (ptr Object.t_typ @-> string @-> ptr_opt Tag_list.t_typ @-> ptr_opt Structure.t_typ @-> returning (ptr t_typ))
let create_request_state =
  foreign "gst_message_new_request_state" (ptr_opt Object.t_typ @-> State.t_view @-> returning (ptr t_typ))
let create_reset_time =
  foreign "gst_message_new_reset_time" (ptr_opt Object.t_typ @-> uint64_t @-> returning (ptr t_typ))
let create_segment_done =
  foreign "gst_message_new_segment_done" (ptr_opt Object.t_typ @-> Format.t_view @-> int64_t @-> returning (ptr t_typ))
let create_segment_start =
  foreign "gst_message_new_segment_start" (ptr_opt Object.t_typ @-> Format.t_view @-> int64_t @-> returning (ptr t_typ))
let create_state_changed =
  foreign "gst_message_new_state_changed" (ptr_opt Object.t_typ @-> State.t_view @-> State.t_view @-> State.t_view @-> returning (ptr t_typ))
let create_state_dirty =
  foreign "gst_message_new_state_dirty" (ptr_opt Object.t_typ @-> returning (ptr t_typ))
let create_step_done =
  foreign "gst_message_new_step_done" (ptr Object.t_typ @-> Format.t_view @-> uint64_t @-> double @-> bool @-> bool @-> uint64_t @-> bool @-> returning (ptr t_typ))
let create_step_start =
  foreign "gst_message_new_step_start" (ptr Object.t_typ @-> bool @-> Format.t_view @-> uint64_t @-> double @-> bool @-> bool @-> returning (ptr t_typ))
let create_stream_collection =
  foreign "gst_message_new_stream_collection" (ptr Object.t_typ @-> ptr Stream_collection.t_typ @-> returning (ptr t_typ))
let create_stream_start =
  foreign "gst_message_new_stream_start" (ptr_opt Object.t_typ @-> returning (ptr t_typ))
(* let create_stream_status =
 *   foreign "gst_message_new_stream_status" (ptr Object.t_typ @-> Stream_status_type.t_view @-> ptr Element.t_typ @-> returning (ptr t_typ)) *)
let create_streams_selected =
  foreign "gst_message_new_streams_selected" (ptr Object.t_typ @-> ptr Stream_collection.t_typ @-> returning (ptr t_typ))
(* let create_structure_change =
 *   foreign "gst_message_new_structure_change" (ptr_opt Object.t_typ @-> Structure_change_type.t_view @-> ptr Element.t_typ @-> bool @-> returning (ptr t_typ)) *)
let create_tag =
  foreign "gst_message_new_tag" (ptr_opt Object.t_typ @-> ptr Tag_list.t_typ @-> returning (ptr t_typ))
let create_toc =
  foreign "gst_message_new_toc" (ptr Object.t_typ @-> ptr Toc.t_typ @-> bool @-> returning (ptr t_typ))
let create_warning =
  foreign "gst_message_new_warning" (ptr_opt Object.t_typ @-> ptr Error.t_typ @-> string @-> returning (ptr t_typ))
let create_warning_with_details =
  foreign "gst_message_new_warning_with_details" (ptr_opt Object.t_typ @-> ptr Error.t_typ @-> string @-> ptr Structure.t_typ @-> returning (ptr_opt t_typ))
let add_redirect_entry =
  foreign "gst_message_add_redirect_entry" (ptr t_typ @-> string @-> ptr_opt Tag_list.t_typ @-> ptr_opt Structure.t_typ @-> returning (void))
let get_num_redirect_entries =
  foreign "gst_message_get_num_redirect_entries" (ptr t_typ @-> returning (uint64_t))
let get_seqnum =
  foreign "gst_message_get_seqnum" (ptr t_typ @-> returning (uint32_t))
let get_stream_status_object =
  foreign "gst_message_get_stream_status_object" (ptr t_typ @-> returning (ptr_opt Value.t_typ))
let get_structure =
  foreign "gst_message_get_structure" (ptr t_typ @-> returning (ptr_opt Structure.t_typ))
let has_name =
  foreign "gst_message_has_name" (ptr t_typ @-> string @-> returning (bool))
(* let parse_async_done self =
 *   let parse_async_done_raw =
 *     foreign "gst_message_parse_async_done" (ptr t_typ @-> ptr (uint64_t) @-> returning (void))
 *   in
 *   let running_time_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let ret = parse_async_done_raw self running_time_ptr in
 *   let running_time = !@ running_time_ptr in
 *   (running_time)
 * let parse_buffering self =
 *   let parse_buffering_raw =
 *     foreign "gst_message_parse_buffering" (ptr t_typ @-> ptr (int32_t) @-> returning (void))
 *   in
 *   let percent_ptr = allocate int32_t Int32.zero in
 *   let ret = parse_buffering_raw self percent_ptr in
 *   let percent = !@ percent_ptr in
 *   (percent)
 * let parse_buffering_stats self =
 *   let parse_buffering_stats_raw =
 *     foreign "gst_message_parse_buffering_stats" (ptr t_typ @-> ptr (Buffering_mode.t_view) @-> ptr (int32_t) @-> ptr (int32_t) @-> ptr (int64_t) @-> returning (void))
 *   in
 *   let mode_ptr = allocate Buffering_mode.t_view (Buffering_mode.t_view.of_value (Unsigned.UInt32.zero)) in
 *   let avg_in_ptr = allocate int32_t Int32.zero in
 *   let avg_out_ptr = allocate int32_t Int32.zero in
 *   let buffering_left_ptr = allocate int64_t Int64.zero in
 *   let ret = parse_buffering_stats_raw self mode_ptr avg_in_ptr avg_out_ptr buffering_left_ptr in
 *   let mode = (!@ mode_ptr) in
 *   let avg_in = !@ avg_in_ptr in
 *   let avg_out = !@ avg_out_ptr in
 *   let buffering_left = !@ buffering_left_ptr in
 *   (mode, avg_in, avg_out, buffering_left)
 * let parse_clock_lost self =
 *   let parse_clock_lost_raw =
 *     foreign "gst_message_parse_clock_lost" (ptr t_typ @-> ptr (ptr Clock.t_typ) @-> returning (void))
 *   in
 *   let clock_ptr = allocate (ptr_opt Clock.t_typ) None in
 *   let ret = parse_clock_lost_raw self clock_ptr in
 *   let clock = !@ clock_ptr in
 *   (clock)
 * let parse_clock_provide self =
 *   let parse_clock_provide_raw =
 *     foreign "gst_message_parse_clock_provide" (ptr t_typ @-> ptr (ptr Clock.t_typ) @-> ptr (bool) @-> returning (void))
 *   in
 *   let clock_ptr = allocate (ptr_opt Clock.t_typ) None in
 *   let ready_ptr = allocate bool false in
 *   let ret = parse_clock_provide_raw self clock_ptr ready_ptr in
 *   let clock = !@ clock_ptr in
 *   let ready = !@ ready_ptr in
 *   (clock, ready)
 * let parse_context_type self =
 *   let parse_context_type_raw =
 *     foreign "gst_message_parse_context_type" (ptr t_typ @-> ptr (string) @-> returning (bool))
 *   in
 *   let context_type_ptr = allocate string " " in
 *   let ret = parse_context_type_raw self context_type_ptr in
 *   let context_type = !@ context_type_ptr in
 *   (ret, context_type)
 * let parse_device_added self =
 *   let parse_device_added_raw =
 *     foreign "gst_message_parse_device_added" (ptr t_typ @-> ptr (ptr Device.t_typ) @-> returning (void))
 *   in
 *   let device_ptr = allocate (ptr_opt Device.t_typ) None in
 *   let ret = parse_device_added_raw self device_ptr in
 *   let device = !@ device_ptr in
 *   (device)
 * let parse_device_removed self =
 *   let parse_device_removed_raw =
 *     foreign "gst_message_parse_device_removed" (ptr t_typ @-> ptr (ptr Device.t_typ) @-> returning (void))
 *   in
 *   let device_ptr = allocate (ptr_opt Device.t_typ) None in
 *   let ret = parse_device_removed_raw self device_ptr in
 *   let device = !@ device_ptr in
 *   (device)
 * let parse_error self =
 *   let parse_error_raw =
 *     foreign "gst_message_parse_error" (ptr t_typ @-> ptr (ptr Error.t_typ) @-> ptr (string) @-> returning (void))
 *   in
 *   let gerror_ptr = allocate (ptr_opt Error.t_typ) None in
 *   let debug_ptr = allocate string " " in
 *   let ret = parse_error_raw self gerror_ptr debug_ptr in
 *   let gerror = !@ gerror_ptr in
 *   let debug = !@ debug_ptr in
 *   (gerror, debug)
 * let parse_error_details self =
 *   let parse_error_details_raw =
 *     foreign "gst_message_parse_error_details" (ptr t_typ @-> ptr (ptr Structure.t_typ) @-> returning (void))
 *   in
 *   let structure_ptr = allocate (ptr_opt Structure.t_typ) None in
 *   let ret = parse_error_details_raw self structure_ptr in
 *   let structure = !@ structure_ptr in
 *   (structure)
 * let parse_group_id self =
 *   let parse_group_id_raw =
 *     foreign "gst_message_parse_group_id" (ptr t_typ @-> ptr (uint32_t) @-> returning (bool))
 *   in
 *   let group_id_ptr = allocate uint32_t Unsigned.UInt32.zero in
 *   let ret = parse_group_id_raw self group_id_ptr in
 *   let group_id = !@ group_id_ptr in
 *   (ret, group_id)
 * let parse_have_context self =
 *   let parse_have_context_raw =
 *     foreign "gst_message_parse_have_context" (ptr t_typ @-> ptr (ptr Context.t_typ) @-> returning (void))
 *   in
 *   let context_ptr = allocate (ptr_opt Context.t_typ) None in
 *   let ret = parse_have_context_raw self context_ptr in
 *   let context = !@ context_ptr in
 *   (context)
 * let parse_info self =
 *   let parse_info_raw =
 *     foreign "gst_message_parse_info" (ptr t_typ @-> ptr (ptr Error.t_typ) @-> ptr (string) @-> returning (void))
 *   in
 *   let gerror_ptr = allocate (ptr_opt Error.t_typ) None in
 *   let debug_ptr = allocate string " " in
 *   let ret = parse_info_raw self gerror_ptr debug_ptr in
 *   let gerror = !@ gerror_ptr in
 *   let debug = !@ debug_ptr in
 *   (gerror, debug)
 * let parse_info_details self =
 *   let parse_info_details_raw =
 *     foreign "gst_message_parse_info_details" (ptr t_typ @-> ptr (ptr Structure.t_typ) @-> returning (void))
 *   in
 *   let structure_ptr = allocate (ptr_opt Structure.t_typ) None in
 *   let ret = parse_info_details_raw self structure_ptr in
 *   let structure = !@ structure_ptr in
 *   (structure)
 * let parse_create_clock self =
 *   let parse_create_clock_raw =
 *     foreign "gst_message_parse_new_clock" (ptr t_typ @-> ptr (ptr Clock.t_typ) @-> returning (void))
 *   in
 *   let clock_ptr = allocate (ptr_opt Clock.t_typ) None in
 *   let ret = parse_create_clock_raw self clock_ptr in
 *   let clock = !@ clock_ptr in
 *   (clock)
 * let parse_progress self =
 *   let parse_progress_raw =
 *     foreign "gst_message_parse_progress" (ptr t_typ @-> ptr (Progress_type.t_view) @-> ptr (string) @-> ptr (string) @-> returning (void))
 *   in
 *   let _type_ptr = allocate Progress_type.t_view (Progress_type.t_view.of_value (Unsigned.UInt32.zero)) in
 *   let code_ptr = allocate string " " in
 *   let text_ptr = allocate string " " in
 *   let ret = parse_progress_raw self _type_ptr code_ptr text_ptr in
 *   let _type = (!@ _type_ptr) in
 *   let code = !@ code_ptr in
 *   let text = !@ text_ptr in
 *   (_type, code, text)
 * let parse_property_notify self =
 *   let parse_property_notify_raw =
 *     foreign "gst_message_parse_property_notify" (ptr t_typ @-> ptr (ptr Object.t_typ) @-> ptr (string) @-> ptr (ptr Value.t_typ) @-> returning (void))
 *   in
 *   let _object_ptr = allocate (ptr_opt Object.t_typ) None in
 *   let property_name_ptr = allocate string " " in
 *   let property_value_ptr = allocate (ptr_opt Value.t_typ) None in
 *   let ret = parse_property_notify_raw self _object_ptr property_name_ptr property_value_ptr in
 *   let _object = !@ _object_ptr in
 *   let property_name = !@ property_name_ptr in
 *   let property_value = !@ property_value_ptr in
 *   (_object, property_name, property_value)
 * let parse_qos self =
 *   let parse_qos_raw =
 *     foreign "gst_message_parse_qos" (ptr t_typ @-> ptr (bool) @-> ptr (uint64_t) @-> ptr (uint64_t) @-> ptr (uint64_t) @-> ptr (uint64_t) @-> returning (void))
 *   in
 *   let live_ptr = allocate bool false in
 *   let running_time_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let stream_time_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let timestamp_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let duration_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let ret = parse_qos_raw self live_ptr running_time_ptr stream_time_ptr timestamp_ptr duration_ptr in
 *   let live = !@ live_ptr in
 *   let running_time = !@ running_time_ptr in
 *   let stream_time = !@ stream_time_ptr in
 *   let timestamp = !@ timestamp_ptr in
 *   let duration = !@ duration_ptr in
 *   (live, running_time, stream_time, timestamp, duration)
 * let parse_qos_stats self =
 *   let parse_qos_stats_raw =
 *     foreign "gst_message_parse_qos_stats" (ptr t_typ @-> ptr (Format.t_view) @-> ptr (uint64_t) @-> ptr (uint64_t) @-> returning (void))
 *   in
 *   let format_ptr = allocate Format.t_view (Format.t_view.of_value (Unsigned.UInt32.zero)) in
 *   let processed_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let dropped_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let ret = parse_qos_stats_raw self format_ptr processed_ptr dropped_ptr in
 *   let format = (!@ format_ptr) in
 *   let processed = !@ processed_ptr in
 *   let dropped = !@ dropped_ptr in
 *   (format, processed, dropped)
 * let parse_qos_values self =
 *   let parse_qos_values_raw =
 *     foreign "gst_message_parse_qos_values" (ptr t_typ @-> ptr (int64_t) @-> ptr (double) @-> ptr (int32_t) @-> returning (void))
 *   in
 *   let jitter_ptr = allocate int64_t Int64.zero in
 *   let proportion_ptr = allocate double 0.0 in
 *   let quality_ptr = allocate int32_t Int32.zero in
 *   let ret = parse_qos_values_raw self jitter_ptr proportion_ptr quality_ptr in
 *   let jitter = !@ jitter_ptr in
 *   let proportion = !@ proportion_ptr in
 *   let quality = !@ quality_ptr in
 *   (jitter, proportion, quality)
 * let parse_redirect_entry self entry_index =
 *   let parse_redirect_entry_raw =
 *     foreign "gst_message_parse_redirect_entry" (ptr t_typ @-> uint64_t @-> ptr (string) @-> ptr (ptr Tag_list.t_typ) @-> ptr (ptr Structure.t_typ) @-> returning (void))
 *   in
 *   let location_ptr = allocate string " " in
 *   let tag_list_ptr = allocate (ptr_opt Tag_list.t_typ) None in
 *   let entry_struct_ptr = allocate (ptr_opt Structure.t_typ) None in
 *   let ret = parse_redirect_entry_raw self entry_index location_ptr tag_list_ptr entry_struct_ptr in
 *   let location = !@ location_ptr in
 *   let tag_list = !@ tag_list_ptr in
 *   let entry_struct = !@ entry_struct_ptr in
 *   (location, tag_list, entry_struct)
 * let parse_request_state self =
 *   let parse_request_state_raw =
 *     foreign "gst_message_parse_request_state" (ptr t_typ @-> ptr (State.t_view) @-> returning (void))
 *   in
 *   let state_ptr = allocate State.t_view (State.t_view.of_value (Unsigned.UInt32.zero)) in
 *   let ret = parse_request_state_raw self state_ptr in
 *   let state = (!@ state_ptr) in
 *   (state)
 * let parse_reset_time self =
 *   let parse_reset_time_raw =
 *     foreign "gst_message_parse_reset_time" (ptr t_typ @-> ptr (uint64_t) @-> returning (void))
 *   in
 *   let running_time_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let ret = parse_reset_time_raw self running_time_ptr in
 *   let running_time = !@ running_time_ptr in
 *   (running_time)
 * let parse_segment_done self =
 *   let parse_segment_done_raw =
 *     foreign "gst_message_parse_segment_done" (ptr t_typ @-> ptr (Format.t_view) @-> ptr (int64_t) @-> returning (void))
 *   in
 *   let format_ptr = allocate Format.t_view (Format.t_view.of_value (Unsigned.UInt32.zero)) in
 *   let position_ptr = allocate int64_t Int64.zero in
 *   let ret = parse_segment_done_raw self format_ptr position_ptr in
 *   let format = (!@ format_ptr) in
 *   let position = !@ position_ptr in
 *   (format, position)
 * let parse_segment_start self =
 *   let parse_segment_start_raw =
 *     foreign "gst_message_parse_segment_start" (ptr t_typ @-> ptr (Format.t_view) @-> ptr (int64_t) @-> returning (void))
 *   in
 *   let format_ptr = allocate Format.t_view (Format.t_view.of_value (Unsigned.UInt32.zero)) in
 *   let position_ptr = allocate int64_t Int64.zero in
 *   let ret = parse_segment_start_raw self format_ptr position_ptr in
 *   let format = (!@ format_ptr) in
 *   let position = !@ position_ptr in
 *   (format, position)
 * let parse_state_changed self =
 *   let parse_state_changed_raw =
 *     foreign "gst_message_parse_state_changed" (ptr t_typ @-> ptr (State.t_view) @-> ptr (State.t_view) @-> ptr (State.t_view) @-> returning (void))
 *   in
 *   let oldstate_ptr = allocate State.t_view (State.t_view.of_value (Unsigned.UInt32.zero)) in
 *   let newstate_ptr = allocate State.t_view (State.t_view.of_value (Unsigned.UInt32.zero)) in
 *   let pending_ptr = allocate State.t_view (State.t_view.of_value (Unsigned.UInt32.zero)) in
 *   let ret = parse_state_changed_raw self oldstate_ptr newstate_ptr pending_ptr in
 *   let oldstate = (!@ oldstate_ptr) in
 *   let newstate = (!@ newstate_ptr) in
 *   let pending = (!@ pending_ptr) in
 *   (oldstate, newstate, pending)
 * let parse_step_done self =
 *   let parse_step_done_raw =
 *     foreign "gst_message_parse_step_done" (ptr t_typ @-> ptr (Format.t_view) @-> ptr (uint64_t) @-> ptr (double) @-> ptr (bool) @-> ptr (bool) @-> ptr (uint64_t) @-> ptr (bool) @-> returning (void))
 *   in
 *   let format_ptr = allocate Format.t_view (Format.t_view.of_value (Unsigned.UInt32.zero)) in
 *   let amount_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let rate_ptr = allocate double 0.0 in
 *   let flush_ptr = allocate bool false in
 *   let intermediate_ptr = allocate bool false in
 *   let duration_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let eos_ptr = allocate bool false in
 *   let ret = parse_step_done_raw self format_ptr amount_ptr rate_ptr flush_ptr intermediate_ptr duration_ptr eos_ptr in
 *   let format = (!@ format_ptr) in
 *   let amount = !@ amount_ptr in
 *   let rate = !@ rate_ptr in
 *   let flush = !@ flush_ptr in
 *   let intermediate = !@ intermediate_ptr in
 *   let duration = !@ duration_ptr in
 *   let eos = !@ eos_ptr in
 *   (format, amount, rate, flush, intermediate, duration, eos)
 * let parse_step_start self =
 *   let parse_step_start_raw =
 *     foreign "gst_message_parse_step_start" (ptr t_typ @-> ptr (bool) @-> ptr (Format.t_view) @-> ptr (uint64_t) @-> ptr (double) @-> ptr (bool) @-> ptr (bool) @-> returning (void))
 *   in
 *   let active_ptr = allocate bool false in
 *   let format_ptr = allocate Format.t_view (Format.t_view.of_value (Unsigned.UInt32.zero)) in
 *   let amount_ptr = allocate uint64_t Unsigned.UInt64.zero in
 *   let rate_ptr = allocate double 0.0 in
 *   let flush_ptr = allocate bool false in
 *   let intermediate_ptr = allocate bool false in
 *   let ret = parse_step_start_raw self active_ptr format_ptr amount_ptr rate_ptr flush_ptr intermediate_ptr in
 *   let active = !@ active_ptr in
 *   let format = (!@ format_ptr) in
 *   let amount = !@ amount_ptr in
 *   let rate = !@ rate_ptr in
 *   let flush = !@ flush_ptr in
 *   let intermediate = !@ intermediate_ptr in
 *   (active, format, amount, rate, flush, intermediate)
 * let parse_stream_collection self =
 *   let parse_stream_collection_raw =
 *     foreign "gst_message_parse_stream_collection" (ptr t_typ @-> ptr (ptr Stream_collection.t_typ) @-> returning (void))
 *   in
 *   let collection_ptr = allocate (ptr_opt Stream_collection.t_typ) None in
 *   let ret = parse_stream_collection_raw self collection_ptr in
 *   let collection = !@ collection_ptr in
 *   (collection)
 * (\* let parse_stream_status self =
 *  *   let parse_stream_status_raw =
 *  *     foreign "gst_message_parse_stream_status" (ptr t_typ @-> ptr (Stream_status_type.t_view) @-> ptr (ptr Element.t_typ) @-> returning (void))
 *  *   in
 *  *   let _type_ptr = allocate Stream_status_type.t_view (Stream_status_type.t_view.of_value (Unsigned.UInt32.zero)) in
 *  *   let owner_ptr = allocate (ptr_opt Element.t_typ) None in
 *  *   let ret = parse_stream_status_raw self _type_ptr owner_ptr in
 *  *   let _type = (!@ _type_ptr) in
 *  *   let owner = !@ owner_ptr in
 *  *   (_type, owner) *\)
 * let parse_streams_selected self =
 *   let parse_streams_selected_raw =
 *     foreign "gst_message_parse_streams_selected" (ptr t_typ @-> ptr (ptr Stream_collection.t_typ) @-> returning (void))
 *   in
 *   let collection_ptr = allocate (ptr_opt Stream_collection.t_typ) None in
 *   let ret = parse_streams_selected_raw self collection_ptr in
 *   let collection = !@ collection_ptr in
 *   (collection)
 * (\* let parse_structure_change self =
 *  *   let parse_structure_change_raw =
 *  *     foreign "gst_message_parse_structure_change" (ptr t_typ @-> ptr (Structure_change_type.t_view) @-> ptr (ptr Element.t_typ) @-> ptr (bool) @-> returning (void))
 *  *   in
 *  *   let _type_ptr = allocate Structure_change_type.t_view (Structure_change_type.t_view.of_value (Unsigned.UInt32.zero)) in
 *  *   let owner_ptr = allocate (ptr_opt Element.t_typ) None in
 *  *   let busy_ptr = allocate bool false in
 *  *   let ret = parse_structure_change_raw self _type_ptr owner_ptr busy_ptr in
 *  *   let _type = (!@ _type_ptr) in
 *  *   let owner = !@ owner_ptr in
 *  *   let busy = !@ busy_ptr in
 *  *   (_type, owner, busy) *\)
 * let parse_tag self =
 *   let parse_tag_raw =
 *     foreign "gst_message_parse_tag" (ptr t_typ @-> ptr (ptr Tag_list.t_typ) @-> returning (void))
 *   in
 *   let tag_list_ptr = allocate (ptr_opt Tag_list.t_typ) None in
 *   let ret = parse_tag_raw self tag_list_ptr in
 *   let tag_list = !@ tag_list_ptr in
 *   (tag_list)
 * let parse_toc self =
 *   let parse_toc_raw =
 *     foreign "gst_message_parse_toc" (ptr t_typ @-> ptr (ptr Toc.t_typ) @-> ptr (bool) @-> returning (void))
 *   in
 *   let toc_ptr = allocate (ptr_opt Toc.t_typ) None in
 *   let updated_ptr = allocate bool false in
 *   let ret = parse_toc_raw self toc_ptr updated_ptr in
 *   let toc = !@ toc_ptr in
 *   let updated = !@ updated_ptr in
 *   (toc, updated)
 * let parse_warning self =
 *   let parse_warning_raw =
 *     foreign "gst_message_parse_warning" (ptr t_typ @-> ptr (ptr Error.t_typ) @-> ptr (string) @-> returning (void))
 *   in
 *   let gerror_ptr = allocate (ptr_opt Error.t_typ) None in
 *   let debug_ptr = allocate string " " in
 *   let ret = parse_warning_raw self gerror_ptr debug_ptr in
 *   let gerror = !@ gerror_ptr in
 *   let debug = !@ debug_ptr in
 *   (gerror, debug)
 * let parse_warning_details self =
 *   let parse_warning_details_raw =
 *     foreign "gst_message_parse_warning_details" (ptr t_typ @-> ptr (ptr Structure.t_typ) @-> returning (void))
 *   in
 *   let structure_ptr = allocate (ptr_opt Structure.t_typ) None in
 *   let ret = parse_warning_details_raw self structure_ptr in
 *   let structure = !@ structure_ptr in
 *   (structure) *)
let set_buffering_stats =
  foreign "gst_message_set_buffering_stats" (ptr t_typ @-> Buffering_mode.t_view @-> int32_t @-> int32_t @-> int64_t @-> returning (void))
let set_group_id =
  foreign "gst_message_set_group_id" (ptr t_typ @-> uint32_t @-> returning (void))
let set_qos_stats =
  foreign "gst_message_set_qos_stats" (ptr t_typ @-> Format.t_view @-> uint64_t @-> uint64_t @-> returning (void))
let set_qos_values =
  foreign "gst_message_set_qos_values" (ptr t_typ @-> int64_t @-> double @-> int32_t @-> returning (void))
let set_seqnum =
  foreign "gst_message_set_seqnum" (ptr t_typ @-> uint32_t @-> returning (void))
let set_stream_status_object =
  foreign "gst_message_set_stream_status_object" (ptr t_typ @-> ptr Value.t_typ @-> returning (void))
let streams_selected_add =
  foreign "gst_message_streams_selected_add" (ptr t_typ @-> ptr Stream.t_typ @-> returning (void))
let streams_selected_get_size =
  foreign "gst_message_streams_selected_get_size" (ptr t_typ @-> returning (uint32_t))
let streams_selected_get_stream =
  foreign "gst_message_streams_selected_get_stream" (ptr t_typ @-> uint32_t @-> returning (ptr_opt Stream.t_typ))
let writable_structure =
  foreign "gst_message_writable_structure" (ptr t_typ @-> returning (ptr Structure.t_typ))

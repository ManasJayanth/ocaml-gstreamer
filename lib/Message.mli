open Ctypes

type t
val t_typ : t structure typ

val f_mini_object: (Mini_object.t structure, t structure) field
val f_type: (Message_type.t_list, t structure) field
val f_timestamp: (Unsigned.uint64, t structure) field
val f_src: (Object.t ptr, t structure) field
val f_seqnum: (Unsigned.uint32, t structure) field
(*Struct field Message : union tag not implemented*)
(* val f_cond: (Cond.t structure, t structure) field *)

val create_application :
  Object.t ptr option -> Structure.t structure ptr -> t structure ptr option
val create_async_done :
  Object.t ptr option -> Unsigned.uint64 -> t structure ptr
val create_async_start :
  Object.t ptr option -> t structure ptr
val create_buffering :
  Object.t ptr option -> int32 -> t structure ptr option
val create_clock_lost :
  Object.t ptr option -> Clock.t ptr -> t structure ptr
val create_clock_provide :
  Object.t ptr option -> Clock.t ptr -> bool -> t structure ptr
val create_custom :
  Message_type.t_list -> Object.t ptr option -> Structure.t structure ptr option -> t structure ptr option
val create_device_added :
  Object.t ptr -> Device.t ptr -> t structure ptr
val create_device_removed :
  Object.t ptr -> Device.t ptr -> t structure ptr
val create_duration_changed :
  Object.t ptr option -> t structure ptr
val create_element :
  Object.t ptr option -> Structure.t structure ptr -> t structure ptr option
val create_eos :
  Object.t ptr option -> t structure ptr
val create_error :
  Object.t ptr option -> Error.t structure ptr -> string -> t structure ptr
val create_error_with_details :
  Object.t ptr option -> Error.t structure ptr -> string -> Structure.t structure ptr -> t structure ptr option
val create_have_context :
  Object.t ptr option -> Context.t structure ptr -> t structure ptr
val create_info :
  Object.t ptr option -> Error.t structure ptr -> string -> t structure ptr
val create_info_with_details :
  Object.t ptr option -> Error.t structure ptr -> string -> Structure.t structure ptr -> t structure ptr option
val create_latency :
  Object.t ptr option -> t structure ptr
val create_need_context :
  Object.t ptr option -> string -> t structure ptr
val create_create_clock :
  Object.t ptr option -> Clock.t ptr -> t structure ptr
val create_progress :
  Object.t ptr -> Progress_type.t -> string -> string -> t structure ptr option
val create_property_notify :
  Object.t ptr -> string -> Value.t structure ptr option -> t structure ptr
val create_qos :
  Object.t ptr -> bool -> Unsigned.uint64 -> Unsigned.uint64 -> Unsigned.uint64 -> Unsigned.uint64 -> t structure ptr
val create_redirect :
  Object.t ptr -> string -> Tag_list.t structure ptr option -> Structure.t structure ptr option -> t structure ptr
val create_request_state :
  Object.t ptr option -> State.t -> t structure ptr
val create_reset_time :
  Object.t ptr option -> Unsigned.uint64 -> t structure ptr
val create_segment_done :
  Object.t ptr option -> Format.t -> int64 -> t structure ptr
val create_segment_start :
  Object.t ptr option -> Format.t -> int64 -> t structure ptr
val create_state_changed :
  Object.t ptr option -> State.t -> State.t -> State.t -> t structure ptr
val create_state_dirty :
  Object.t ptr option -> t structure ptr
val create_step_done :
  Object.t ptr -> Format.t -> Unsigned.uint64 -> float -> bool -> bool -> Unsigned.uint64 -> bool -> t structure ptr
val create_step_start :
  Object.t ptr -> bool -> Format.t -> Unsigned.uint64 -> float -> bool -> bool -> t structure ptr
val create_stream_collection :
  Object.t ptr -> Stream_collection.t ptr -> t structure ptr
val create_stream_start :
  Object.t ptr option -> t structure ptr
(* val create_stream_status :
 *   Object.t ptr -> Stream_status_type.t -> Element.t ptr -> t structure ptr *)
val create_streams_selected :
  Object.t ptr -> Stream_collection.t ptr -> t structure ptr
(* val create_structure_change :
 *   Object.t ptr option -> Structure_change_type.t -> Element.t ptr -> bool -> t structure ptr *)
val create_tag :
  Object.t ptr option -> Tag_list.t structure ptr -> t structure ptr
val create_toc :
  Object.t ptr -> Toc.t structure ptr -> bool -> t structure ptr
val create_warning :
  Object.t ptr option -> Error.t structure ptr -> string -> t structure ptr
val create_warning_with_details :
  Object.t ptr option -> Error.t structure ptr -> string -> Structure.t structure ptr -> t structure ptr option
val add_redirect_entry :
  t structure ptr -> string -> Tag_list.t structure ptr option -> Structure.t structure ptr option -> unit
val get_num_redirect_entries :
  t structure ptr -> Unsigned.uint64
val get_seqnum :
  t structure ptr -> Unsigned.uint32
val get_stream_status_object :
  t structure ptr -> Value.t structure ptr option
val get_structure :
  t structure ptr -> Structure.t structure ptr option
val has_name :
  t structure ptr -> string -> bool
(* val parse_async_done :
 *   t structure ptr -> (Unsigned.uint64)
 * val parse_buffering :
 *   t structure ptr -> (int32)
 * val parse_buffering_stats :
 *   t structure ptr -> (Buffering_mode.t * int32 * int32 * int64)
 * val parse_clock_lost :
 *   t structure ptr -> (Clock.t ptr)
 * val parse_clock_provide :
 *   t structure ptr -> (Clock.t ptr * bool)
 * val parse_context_type :
 *   t structure ptr -> (bool * string)
 * val parse_device_added :
 *   t structure ptr -> (Device.t ptr)
 * val parse_device_removed :
 *   t structure ptr -> (Device.t ptr)
 * val parse_error :
 *   t structure ptr -> (Error.t structure ptr * string)
 * val parse_error_details :
 *   t structure ptr -> (Structure.t structure ptr)
 * val parse_group_id :
 *   t structure ptr -> (bool * Unsigned.uint32)
 * val parse_have_context :
 *   t structure ptr -> (Context.t structure ptr)
 * val parse_info :
 *   t structure ptr -> (Error.t structure ptr * string)
 * val parse_info_details :
 *   t structure ptr -> (Structure.t structure ptr)
 * val parse_create_clock :
 *   t structure ptr -> (Clock.t ptr)
 * val parse_progress :
 *   t structure ptr -> (Progress_type.t * string * string)
 * val parse_property_notify :
 *   t structure ptr -> (Object.t ptr * string * Value.t structure ptr)
 * val parse_qos :
 *   t structure ptr -> (bool * Unsigned.uint64 * Unsigned.uint64 * Unsigned.uint64 * Unsigned.uint64)
 * val parse_qos_stats :
 *   t structure ptr -> (Format.t * Unsigned.uint64 * Unsigned.uint64)
 * val parse_qos_values :
 *   t structure ptr -> (int64 * float * int32)
 * val parse_redirect_entry :
 *   t structure ptr -> Unsigned.uint64 -> (string * Tag_list.t structure ptr * Structure.t structure ptr)
 * val parse_request_state :
 *   t structure ptr -> (State.t)
 * val parse_reset_time :
 *   t structure ptr -> (Unsigned.uint64)
 * val parse_segment_done :
 *   t structure ptr -> (Format.t * int64)
 * val parse_segment_start :
 *   t structure ptr -> (Format.t * int64)
 * val parse_state_changed :
 *   t structure ptr -> (State.t * State.t * State.t)
 * val parse_step_done :
 *   t structure ptr -> (Format.t * Unsigned.uint64 * float * bool * bool * Unsigned.uint64 * bool)
 * val parse_step_start :
 *   t structure ptr -> (bool * Format.t * Unsigned.uint64 * float * bool * bool)
 * val parse_stream_collection :
 *   t structure ptr -> (Stream_collection.t ptr)
 * (\* val parse_stream_status :
 *  *   t structure ptr -> (Stream_status_type.t * Element.t ptr) *\)
 * val parse_streams_selected :
 *   t structure ptr -> (Stream_collection.t ptr)
 * (\* val parse_structure_change :
 *  *   t structure ptr -> (Structure_change_type.t * Element.t ptr * bool) *\)
 * val parse_tag :
 *   t structure ptr -> (Tag_list.t structure ptr)
 * val parse_toc :
 *   t structure ptr -> (Toc.t structure ptr * bool)
 * val parse_warning :
 *   t structure ptr -> (Error.t structure ptr * string)
 * val parse_warning_details :
 *   t structure ptr -> (Structure.t structure ptr) *)
val set_buffering_stats :
  t structure ptr -> Buffering_mode.t -> int32 -> int32 -> int64 -> unit
val set_group_id :
  t structure ptr -> Unsigned.uint32 -> unit
val set_qos_stats :
  t structure ptr -> Format.t -> Unsigned.uint64 -> Unsigned.uint64 -> unit
val set_qos_values :
  t structure ptr -> int64 -> float -> int32 -> unit
val set_seqnum :
  t structure ptr -> Unsigned.uint32 -> unit
val set_stream_status_object :
  t structure ptr -> Value.t structure ptr -> unit
val streams_selected_add :
  t structure ptr -> Stream.t ptr -> unit
val streams_selected_get_size :
  t structure ptr -> Unsigned.uint32
val streams_selected_get_stream :
  t structure ptr -> Unsigned.uint32 -> Stream.t ptr option
val writable_structure :
  t structure ptr -> Structure.t structure ptr

open Ctypes

type t
val t_typ : t typ

val make_from_uri :
  URIType.t -> string -> string option -> (t ptr option, Error.t structure ptr option) result
(*Not implemented gst_element_register type gType not implemented*)
val state_change_return_get_name :
  State_change_return.t -> string option
val state_get_name :
  State.t -> string option
val abort_state :
  t ptr -> unit
val add_pad :
  t ptr -> Pad.t ptr -> bool
val add_property_deep_notify_watch :
  t ptr -> string option -> bool -> Unsigned.uint64
val add_property_notify_watch :
  t ptr -> string option -> bool -> Unsigned.uint64
(*Not implemented gst_element_call_async type callback not implemented*)
val change_state :
  t ptr -> State_change.t -> State_change_return.t
val continue_state :
  t ptr -> State_change_return.t -> State_change_return.t
val create_all_pads :
  t ptr -> unit
(*Not implemented gst_element_foreach_pad type callback not implemented*)
(*Not implemented gst_element_foreach_sink_pad type callback not implemented*)
(*Not implemented gst_element_foreach_src_pad type callback not implemented*)
val get_base_time :
  t ptr -> Unsigned.uint64
val get_bus :
  t ptr -> Bus.t ptr option
val get_clock :
  t ptr -> Clock.t ptr option
val get_compatible_pad :
  t ptr -> Pad.t ptr -> Caps.t structure ptr option -> Pad.t ptr option
val get_compatible_pad_template :
  t ptr -> Pad_template.t ptr -> Pad_template.t ptr option
val get_context :
  t ptr -> string -> Context.t structure ptr
val get_context_unlocked :
  t ptr -> string -> Context.t structure ptr option
(* val get_contexts :
 *   t ptr -> List.t structure (\* Not implemented : interface *\) ptr *)
val get_factory :
  t ptr -> Element_factory.t ptr
val get_metadata :
  t ptr -> string -> string option
val get_pad_template :
  t ptr -> string -> Pad_template.t ptr option
(* val get_pad_template_list :
 *   t ptr -> List.t structure (\* Not implemented : interface *\) ptr *)
val get_request_pad :
  t ptr -> string -> Pad.t ptr option
val get_start_time :
  t ptr -> Unsigned.uint64
val get_state :
  t ptr -> Unsigned.uint64 -> (State_change_return.t * State.t * State.t)
val get_static_pad :
  t ptr -> string -> Pad.t ptr option
val is_locked_state :
  t ptr -> bool
(* val iterate_pads :
 *   t ptr -> Iterator.t structure ptr
 * val iterate_sink_pads :
 *   t ptr -> Iterator.t structure ptr
 * val iterate_src_pads :
 *   t ptr -> Iterator.t structure ptr
 * val link :
 *   t ptr -> t ptr -> bool
 * val link_filtered :
 *   t ptr -> t ptr -> Caps.t structure ptr option -> bool
 * val link_pads :
 *   t ptr -> string option -> t ptr -> string option -> bool
 * val link_pads_filtered :
 *   t ptr -> string option -> t ptr -> string option -> Caps.t structure ptr option -> bool
 * val link_pads_full :
 *   t ptr -> string option -> t ptr -> string option -> Pad_link_check.t_list -> bool
 * val lost_state :
 *   t ptr -> unit
 * val message_full :
 *   t ptr -> Message_type.t_list -> Unsigned.uint32 -> int32 -> string option -> string option -> string -> string -> int32 -> unit
 * val message_full_with_details :
 *   t ptr -> Message_type.t_list -> Unsigned.uint32 -> int32 -> string option -> string option -> string -> string -> int32 -> Structure.t structure ptr -> unit
 * val no_more_pads :
 *   t ptr -> unit
 * val post_message :
 *   t ptr -> Message.t structure ptr -> bool
 * val provide_clock :
 *   t ptr -> Clock.t ptr option
 * val query :
 *   t ptr -> Query.t structure ptr -> bool
 * val query_convert :
 *   t ptr -> Format.t -> int64 -> Format.t -> (bool * int64)
 * val query_duration :
 *   t ptr -> Format.t -> (bool * int64)
 * val query_position :
 *   t ptr -> Format.t -> (bool * int64)
 * val release_request_pad :
 *   t ptr -> Pad.t ptr -> unit
 * val remove_pad :
 *   t ptr -> Pad.t ptr -> bool
 * val remove_property_notify_watch :
 *   t ptr -> Unsigned.uint64 -> unit
 * val request_pad :
 *   t ptr -> Pad_template.t ptr -> string option -> Caps.t structure ptr option -> Pad.t ptr option
 * val seek :
 *   t ptr -> float -> Format.t -> Seek_flags.t_list -> Seek_type.t -> int64 -> Seek_type.t -> int64 -> bool
 * val seek_simple :
 *   t ptr -> Format.t -> Seek_flags.t_list -> int64 -> bool
 * val send_event :
 *   t ptr -> Event.t structure ptr -> bool
 * val set_base_time :
 *   t ptr -> Unsigned.uint64 -> unit
 * val set_bus :
 *   t ptr -> Bus.t ptr option -> unit
 * val set_clock :
 *   t ptr -> Clock.t ptr option -> bool
 * val set_context :
 *   t ptr -> Context.t structure ptr -> unit
 * val set_locked_state :
 *   t ptr -> bool -> bool
 * val set_start_time :
 *   t ptr -> Unsigned.uint64 -> unit
 * val set_state :
 *   t ptr -> State.t -> State_change_return.t
 * val sync_state_with_parent :
 *   t ptr -> bool
 * val unlink :
 *   t ptr -> t ptr -> unit
 * val unlink_pads :
 *   t ptr -> string -> t ptr -> string -> unit *)

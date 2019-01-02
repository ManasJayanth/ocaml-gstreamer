open Ctypes

type t
val t_typ : t typ

(* val create :
 *   string option -> Pad_direction.t -> t ptr option
 * val create_from_static_template :
 *   Static_pad_template.t structure ptr -> string -> t ptr option
 * val create_from_template :
 *   Pad_template.t ptr -> string option -> t ptr option
 * val link_get_name :
 *   Pad_link_return.t -> string option
 * val activate_mode :
 *   t -> Pad_mode.t -> bool -> bool
 * (\*Not implemented gst_pad_add_probe type callback not implemented*\)
 * val can_link :
 *   t -> t ptr -> bool
 * val chain :
 *   t -> Buffer.t structure ptr -> Flow_return.t
 * val chain_list :
 *   t -> Buffer_list.t structure ptr -> Flow_return.t
 * val check_reconfigure :
 *   t -> bool
 * val create_stream_id :
 *   t -> Element.t ptr -> string option -> string option
 * val event_default :
 *   t -> Object.t ptr option -> Event.t structure ptr -> bool
 * (\*Not implemented gst_pad_forward type callback not implemented*\)
 * val get_allowed_caps :
 *   t -> Caps.t structure ptr option
 * val get_current_caps :
 *   t -> Caps.t structure ptr option
 * val get_direction :
 *   t -> Pad_direction.t
 * val get_element_private :
 *   t -> unit ptr option
 * val get_last_flow_return :
 *   t -> Flow_return.t
 * val get_offset :
 *   t -> int64
 * val get_pad_template :
 *   t -> Pad_template.t ptr option
 * val get_pad_template_caps :
 *   t -> Caps.t structure ptr
 * val get_parent_element :
 *   t -> Element.t ptr option
 * val get_peer :
 *   t -> t ptr option
 * val get_range :
 *   t -> Unsigned.uint64 -> Unsigned.uint32 -> (Flow_return.t * Buffer.t structure ptr)
 * val get_sticky_event :
 *   t -> Event_type.t -> Unsigned.uint32 -> Event.t structure ptr option
 * val get_stream :
 *   t -> Stream.t ptr option
 * val get_stream_id :
 *   t -> string option
 * val get_task_state :
 *   t -> Task_state.t
 * val has_current_caps :
 *   t -> bool
 * val is_active :
 *   t -> bool
 * val is_blocked :
 *   t -> bool
 * val is_blocking :
 *   t -> bool
 * val is_linked :
 *   t -> bool
 * val iterate_internal_links :
 *   t -> Iterator.t structure ptr option
 * val iterate_internal_links_default :
 *   t -> Object.t ptr option -> Iterator.t structure ptr option
 * val link :
 *   t -> t ptr -> Pad_link_return.t
 * val link_full :
 *   t -> t ptr -> Pad_link_check.t_list -> Pad_link_return.t
 * val link_maybe_ghosting :
 *   t -> t ptr -> bool
 * val link_maybe_ghosting_full :
 *   t -> t ptr -> Pad_link_check.t_list -> bool
 * val mark_reconfigure :
 *   t -> unit
 * val needs_reconfigure :
 *   t -> bool
 * val pause_task :
 *   t -> bool
 * val peer_query :
 *   t -> Query.t structure ptr -> bool
 * val peer_query_accept_caps :
 *   t -> Caps.t structure ptr -> bool
 * val peer_query_caps :
 *   t -> Caps.t structure ptr option -> Caps.t structure ptr
 * val peer_query_convert :
 *   t -> Format.t -> int64 -> Format.t -> (bool * int64)
 * val peer_query_duration :
 *   t -> Format.t -> (bool * int64)
 * val peer_query_position :
 *   t -> Format.t -> (bool * int64)
 * val proxy_query_accept_caps :
 *   t -> Query.t structure ptr -> bool
 * val proxy_query_caps :
 *   t -> Query.t structure ptr -> bool
 * val pull_range :
 *   t -> Unsigned.uint64 -> Unsigned.uint32 -> (Flow_return.t * Buffer.t structure ptr)
 * val push :
 *   t -> Buffer.t structure ptr -> Flow_return.t
 * val push_event :
 *   t -> Event.t structure ptr -> bool
 * val push_list :
 *   t -> Buffer_list.t structure ptr -> Flow_return.t
 * val query :
 *   t -> Query.t structure ptr -> bool
 * val query_accept_caps :
 *   t -> Caps.t structure ptr -> bool
 * val query_caps :
 *   t -> Caps.t structure ptr option -> Caps.t structure ptr
 * val query_convert :
 *   t -> Format.t -> int64 -> Format.t -> (bool * int64)
 * val query_default :
 *   t -> Object.t ptr option -> Query.t structure ptr -> bool
 * val query_duration :
 *   t -> Format.t -> (bool * int64)
 * val query_position :
 *   t -> Format.t -> (bool * int64)
 * val remove_probe :
 *   t -> Unsigned.uint64 -> unit
 * val send_event :
 *   t -> Event.t structure ptr -> bool
 * (\*Not implemented gst_pad_set_activate_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_activatemode_function_full type callback not implemented*\)
 * val set_active :
 *   t -> bool -> bool
 * (\*Not implemented gst_pad_set_chain_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_chain_list_function_full type callback not implemented*\)
 * val set_element_private :
 *   t -> unit ptr option -> unit
 * (\*Not implemented gst_pad_set_event_full_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_event_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_getrange_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_iterate_internal_links_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_link_function_full type callback not implemented*\)
 * val set_offset :
 *   t -> int64 -> unit
 * (\*Not implemented gst_pad_set_query_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_set_unlink_function_full type callback not implemented*\)
 * (\*Not implemented gst_pad_start_task type callback not implemented*\)
 * (\*Not implemented gst_pad_sticky_events_foreach type callback not implemented*\)
 * val stop_task :
 *   t -> bool
 * val store_sticky_event :
 *   t -> Event.t structure ptr -> Flow_return.t
 * val unlink :
 *   t -> t ptr -> bool
 * val use_fixed_caps :
 *   t -> unit *)

open Ctypes

type t
val t_typ : t typ

val create :
  unit -> t ptr
val add_signal_watch :
  t ptr -> unit
val add_signal_watch_full :
  t ptr -> int32 -> unit
(*Not implemented gst_bus_add_watch_full type callback not implemented*)
val async_signal_func :
  t ptr -> Message.t structure ptr -> unit ptr option -> bool
(* val create_watch :
 *   t ptr -> Source.t structure ptr option *)
val disable_sync_message_emission :
  t ptr -> unit
val enable_sync_message_emission :
  t ptr -> unit
(* val get_pollfd :
 *   t ptr -> (Poll_fd.t structure) *)
val have_pending :
  t ptr -> bool
val peek :
  t ptr -> Message.t structure ptr option
val poll :
  t ptr -> Message_type.t_list -> Unsigned.uint64 -> Message.t structure ptr option
val pop :
  t ptr -> Message.t structure ptr option
val pop_filtered :
  t ptr -> Message_type.t_list -> Message.t structure ptr option
val post :
  t ptr -> Message.t structure ptr -> bool
val remove_signal_watch :
  t ptr -> unit
val remove_watch :
  t ptr -> bool
val set_flushing :
  t ptr -> bool -> unit
(*Not implemented gst_bus_set_sync_handler type callback not implemented*)
(* val sync_signal_handler :
 *   t ptr -> Message.t structure ptr -> unit ptr option -> Bus_sync_reply.t *)
val timed_pop :
  t ptr -> Unsigned.uint64 -> Message.t structure ptr option
val timed_pop_filtered :
  t ptr -> Unsigned.uint64 -> Message_type.t_list -> Message.t structure ptr option

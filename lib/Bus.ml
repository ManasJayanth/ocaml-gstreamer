open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

let create =
  foreign "gst_bus_new" (void @-> returning (ptr t_typ))
let add_signal_watch =
  foreign "gst_bus_add_signal_watch" (ptr t_typ @-> returning (void))
let add_signal_watch_full =
  foreign "gst_bus_add_signal_watch_full" (ptr t_typ @-> int32_t @-> returning (void))
(*Not implemented gst_bus_add_watch_full type callback not implemented*)
let async_signal_func =
  foreign "gst_bus_async_signal_func" (ptr t_typ @-> ptr Message.t_typ @-> ptr_opt void @-> returning (bool))
(* let create_watch =
 *   foreign "gst_bus_create_watch" (ptr t_typ @-> returning (ptr_opt Source.t_typ)) *)
let disable_sync_message_emission =
  foreign "gst_bus_disable_sync_message_emission" (ptr t_typ @-> returning (void))
let enable_sync_message_emission =
  foreign "gst_bus_enable_sync_message_emission" (ptr t_typ @-> returning (void))
(* let get_pollfd self =
 *   let get_pollfd_raw =
 *     foreign "gst_bus_get_pollfd" (ptr t_typ @-> ptr (Poll_fd.t_typ) @-> returning (void))
 *   in
 *   let fd_ptr = allocate Poll_fd.t_typ (make Poll_fd.t_typ) in
 *   let ret = get_pollfd_raw self fd_ptr in
 *   let fd = !@ fd_ptr in
 *   (fd) *)
let have_pending =
  foreign "gst_bus_have_pending" (ptr t_typ @-> returning (bool))
let peek =
  foreign "gst_bus_peek" (ptr t_typ @-> returning (ptr_opt Message.t_typ))
let poll =
  foreign "gst_bus_poll" (ptr t_typ @-> Message_type.t_list_view @-> uint64_t @-> returning (ptr_opt Message.t_typ))
let pop =
  foreign "gst_bus_pop" (ptr t_typ @-> returning (ptr_opt Message.t_typ))
let pop_filtered =
  foreign "gst_bus_pop_filtered" (ptr t_typ @-> Message_type.t_list_view @-> returning (ptr_opt Message.t_typ))
let post =
  foreign "gst_bus_post" (ptr t_typ @-> ptr Message.t_typ @-> returning (bool))
let remove_signal_watch =
  foreign "gst_bus_remove_signal_watch" (ptr t_typ @-> returning (void))
let remove_watch =
  foreign "gst_bus_remove_watch" (ptr t_typ @-> returning (bool))
let set_flushing =
  foreign "gst_bus_set_flushing" (ptr t_typ @-> bool @-> returning (void))
(*Not implemented gst_bus_set_sync_handler type callback not implemented*)
(* let sync_signal_handler =
 *   foreign "gst_bus_sync_signal_handler" (ptr t_typ @-> ptr Message.t_typ @-> ptr_opt void @-> returning (Bus_sync_reply.t_view)) *)
let timed_pop =
  foreign "gst_bus_timed_pop" (ptr t_typ @-> uint64_t @-> returning (ptr_opt Message.t_typ))
let timed_pop_filtered =
  foreign "gst_bus_timed_pop_filtered" (ptr t_typ @-> uint64_t @-> Message_type.t_list_view @-> returning (ptr_opt Message.t_typ))

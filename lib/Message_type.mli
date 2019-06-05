open Ctypes

type t = Unknown | Eos | Error | Warning | Info | Tag | Buffering | State_changed | State_dirty | Step_done | Clock_provide | Clock_lost | New_clock | Structure_change | Stream_status | Application | Element | Segment_start | Segment_done | Duration_changed | Latency | Async_start | Async_done | Request_state | Step_start | Qos | Progress | Toc | Reset_time | Stream_start | Need_context | Have_context | Extended | Device_added | Device_removed | Property_notify | Stream_collection | Streams_selected | Redirect | Device_changed | Any
type t_list = t list

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val list_of_value:
  Unsigned.uint32 -> t_list

val list_to_value:
  t_list -> Unsigned.uint32

val t_list_view : t_list typ


open Ctypes

type t = Unknown | Position | Duration | Latency | Jitter | Rate | Seeking | Segment | Convert | Formats | Buffering | Custom | Uri | Allocation | Scheduling | Accept_caps | Caps | Drain | Context | Bitrate

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


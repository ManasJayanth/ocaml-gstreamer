open Ctypes

type t = Unknown | Flush_start | Flush_stop | Stream_start | Caps | Segment | Stream_collection | Tag | Buffersize | Sink_message | Stream_group_done | Eos | Toc | Protection | Segment_done | Gap | Qos | Seek | Navigation | Latency | Step | Reconfigure | Toc_select | Select_streams | Custom_upstream | Custom_downstream | Custom_downstream_oob | Custom_downstream_sticky | Custom_both | Custom_both_oob

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


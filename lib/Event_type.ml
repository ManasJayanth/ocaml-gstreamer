open Ctypes
open Foreign

type t = Unknown | Flush_start | Flush_stop | Stream_start | Caps | Segment | Stream_collection | Tag | Buffersize | Sink_message | Stream_group_done | Eos | Toc | Protection | Segment_done | Gap | Qos | Seek | Navigation | Latency | Step | Reconfigure | Toc_select | Select_streams | Custom_upstream | Custom_downstream | Custom_downstream_oob | Custom_downstream_sticky | Custom_both | Custom_both_oob

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unknown
  else if v = Unsigned.UInt32.of_int 2563 then Flush_start
  else if v = Unsigned.UInt32.of_int 5127 then Flush_stop
  else if v = Unsigned.UInt32.of_int 10254 then Stream_start
  else if v = Unsigned.UInt32.of_int 12814 then Caps
  else if v = Unsigned.UInt32.of_int 17934 then Segment
  else if v = Unsigned.UInt32.of_int 19230 then Stream_collection
  else if v = Unsigned.UInt32.of_int 20510 then Tag
  else if v = Unsigned.UInt32.of_int 23054 then Buffersize
  else if v = Unsigned.UInt32.of_int 25630 then Sink_message
  else if v = Unsigned.UInt32.of_int 26894 then Stream_group_done
  else if v = Unsigned.UInt32.of_int 28174 then Eos
  else if v = Unsigned.UInt32.of_int 30750 then Toc
  else if v = Unsigned.UInt32.of_int 33310 then Protection
  else if v = Unsigned.UInt32.of_int 38406 then Segment_done
  else if v = Unsigned.UInt32.of_int 40966 then Gap
  else if v = Unsigned.UInt32.of_int 48641 then Qos
  else if v = Unsigned.UInt32.of_int 51201 then Seek
  else if v = Unsigned.UInt32.of_int 53761 then Navigation
  else if v = Unsigned.UInt32.of_int 56321 then Latency
  else if v = Unsigned.UInt32.of_int 58881 then Step
  else if v = Unsigned.UInt32.of_int 61441 then Reconfigure
  else if v = Unsigned.UInt32.of_int 64001 then Toc_select
  else if v = Unsigned.UInt32.of_int 66561 then Select_streams
  else if v = Unsigned.UInt32.of_int 69121 then Custom_upstream
  else if v = Unsigned.UInt32.of_int 71686 then Custom_downstream
  else if v = Unsigned.UInt32.of_int 74242 then Custom_downstream_oob
  else if v = Unsigned.UInt32.of_int 76830 then Custom_downstream_sticky
  else if v = Unsigned.UInt32.of_int 79367 then Custom_both
  else if v = Unsigned.UInt32.of_int 81923 then Custom_both_oob
  else raise (Invalid_argument "Unexpected Event_type value")

let to_value = function
  | Unknown -> Unsigned.UInt32.of_int 0
  | Flush_start -> Unsigned.UInt32.of_int 2563
  | Flush_stop -> Unsigned.UInt32.of_int 5127
  | Stream_start -> Unsigned.UInt32.of_int 10254
  | Caps -> Unsigned.UInt32.of_int 12814
  | Segment -> Unsigned.UInt32.of_int 17934
  | Stream_collection -> Unsigned.UInt32.of_int 19230
  | Tag -> Unsigned.UInt32.of_int 20510
  | Buffersize -> Unsigned.UInt32.of_int 23054
  | Sink_message -> Unsigned.UInt32.of_int 25630
  | Stream_group_done -> Unsigned.UInt32.of_int 26894
  | Eos -> Unsigned.UInt32.of_int 28174
  | Toc -> Unsigned.UInt32.of_int 30750
  | Protection -> Unsigned.UInt32.of_int 33310
  | Segment_done -> Unsigned.UInt32.of_int 38406
  | Gap -> Unsigned.UInt32.of_int 40966
  | Qos -> Unsigned.UInt32.of_int 48641
  | Seek -> Unsigned.UInt32.of_int 51201
  | Navigation -> Unsigned.UInt32.of_int 53761
  | Latency -> Unsigned.UInt32.of_int 56321
  | Step -> Unsigned.UInt32.of_int 58881
  | Reconfigure -> Unsigned.UInt32.of_int 61441
  | Toc_select -> Unsigned.UInt32.of_int 64001
  | Select_streams -> Unsigned.UInt32.of_int 66561
  | Custom_upstream -> Unsigned.UInt32.of_int 69121
  | Custom_downstream -> Unsigned.UInt32.of_int 71686
  | Custom_downstream_oob -> Unsigned.UInt32.of_int 74242
  | Custom_downstream_sticky -> Unsigned.UInt32.of_int 76830
  | Custom_both -> Unsigned.UInt32.of_int 79367
  | Custom_both_oob -> Unsigned.UInt32.of_int 81923

let t_view = view ~read:of_value ~write:to_value uint32_t


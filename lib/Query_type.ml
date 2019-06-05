open Ctypes
open Foreign

type t = Unknown | Position | Duration | Latency | Jitter | Rate | Seeking | Segment | Convert | Formats | Buffering | Custom | Uri | Allocation | Scheduling | Accept_caps | Caps | Drain | Context | Bitrate

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unknown
  else if v = Unsigned.UInt32.of_int 2563 then Position
  else if v = Unsigned.UInt32.of_int 5123 then Duration
  else if v = Unsigned.UInt32.of_int 7683 then Latency
  else if v = Unsigned.UInt32.of_int 10243 then Jitter
  else if v = Unsigned.UInt32.of_int 12803 then Rate
  else if v = Unsigned.UInt32.of_int 15363 then Seeking
  else if v = Unsigned.UInt32.of_int 17923 then Segment
  else if v = Unsigned.UInt32.of_int 20483 then Convert
  else if v = Unsigned.UInt32.of_int 23043 then Formats
  else if v = Unsigned.UInt32.of_int 28163 then Buffering
  else if v = Unsigned.UInt32.of_int 30723 then Custom
  else if v = Unsigned.UInt32.of_int 33283 then Uri
  else if v = Unsigned.UInt32.of_int 35846 then Allocation
  else if v = Unsigned.UInt32.of_int 38401 then Scheduling
  else if v = Unsigned.UInt32.of_int 40963 then Accept_caps
  else if v = Unsigned.UInt32.of_int 43523 then Caps
  else if v = Unsigned.UInt32.of_int 46086 then Drain
  else if v = Unsigned.UInt32.of_int 48643 then Context
  else if v = Unsigned.UInt32.of_int 51202 then Bitrate
  else raise (Invalid_argument "Unexpected Query_type value")

let to_value = function
  | Unknown -> Unsigned.UInt32.of_int 0
  | Position -> Unsigned.UInt32.of_int 2563
  | Duration -> Unsigned.UInt32.of_int 5123
  | Latency -> Unsigned.UInt32.of_int 7683
  | Jitter -> Unsigned.UInt32.of_int 10243
  | Rate -> Unsigned.UInt32.of_int 12803
  | Seeking -> Unsigned.UInt32.of_int 15363
  | Segment -> Unsigned.UInt32.of_int 17923
  | Convert -> Unsigned.UInt32.of_int 20483
  | Formats -> Unsigned.UInt32.of_int 23043
  | Buffering -> Unsigned.UInt32.of_int 28163
  | Custom -> Unsigned.UInt32.of_int 30723
  | Uri -> Unsigned.UInt32.of_int 33283
  | Allocation -> Unsigned.UInt32.of_int 35846
  | Scheduling -> Unsigned.UInt32.of_int 38401
  | Accept_caps -> Unsigned.UInt32.of_int 40963
  | Caps -> Unsigned.UInt32.of_int 43523
  | Drain -> Unsigned.UInt32.of_int 46086
  | Context -> Unsigned.UInt32.of_int 48643
  | Bitrate -> Unsigned.UInt32.of_int 51202

let t_view = view ~read:of_value ~write:to_value uint32_t


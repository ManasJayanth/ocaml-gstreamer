open Ctypes
open Foreign

type t = Unknown | Eos | Error | Warning | Info | Tag | Buffering | State_changed | State_dirty | Step_done | Clock_provide | Clock_lost | New_clock | Structure_change | Stream_status | Application | Element | Segment_start | Segment_done | Duration_changed | Latency | Async_start | Async_done | Request_state | Step_start | Qos | Progress | Toc | Reset_time | Stream_start | Need_context | Have_context | Extended | Device_added | Device_removed | Property_notify | Stream_collection | Streams_selected | Redirect | Device_changed | Any
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unknown
  else if v = Unsigned.UInt32.of_int 1 then Eos
  else if v = Unsigned.UInt32.of_int 2 then Error
  else if v = Unsigned.UInt32.of_int 4 then Warning
  else if v = Unsigned.UInt32.of_int 8 then Info
  else if v = Unsigned.UInt32.of_int 16 then Tag
  else if v = Unsigned.UInt32.of_int 32 then Buffering
  else if v = Unsigned.UInt32.of_int 64 then State_changed
  else if v = Unsigned.UInt32.of_int 128 then State_dirty
  else if v = Unsigned.UInt32.of_int 256 then Step_done
  else if v = Unsigned.UInt32.of_int 512 then Clock_provide
  else if v = Unsigned.UInt32.of_int 1024 then Clock_lost
  else if v = Unsigned.UInt32.of_int 2048 then New_clock
  else if v = Unsigned.UInt32.of_int 4096 then Structure_change
  else if v = Unsigned.UInt32.of_int 8192 then Stream_status
  else if v = Unsigned.UInt32.of_int 16384 then Application
  else if v = Unsigned.UInt32.of_int 32768 then Element
  else if v = Unsigned.UInt32.of_int 65536 then Segment_start
  else if v = Unsigned.UInt32.of_int 131072 then Segment_done
  else if v = Unsigned.UInt32.of_int 262144 then Duration_changed
  else if v = Unsigned.UInt32.of_int 524288 then Latency
  else if v = Unsigned.UInt32.of_int 1048576 then Async_start
  else if v = Unsigned.UInt32.of_int 2097152 then Async_done
  else if v = Unsigned.UInt32.of_int 4194304 then Request_state
  else if v = Unsigned.UInt32.of_int 8388608 then Step_start
  else if v = Unsigned.UInt32.of_int 16777216 then Qos
  else if v = Unsigned.UInt32.of_int 33554432 then Progress
  else if v = Unsigned.UInt32.of_int 67108864 then Toc
  else if v = Unsigned.UInt32.of_int 134217728 then Reset_time
  else if v = Unsigned.UInt32.of_int 268435456 then Stream_start
  else if v = Unsigned.UInt32.of_int 536870912 then Need_context
  else if v = Unsigned.UInt32.of_int 1073741824 then Have_context
  else if v = Unsigned.UInt32.of_int 2147483648 then Extended
  else if v = Unsigned.UInt32.of_int 2147483649 then Device_added
  else if v = Unsigned.UInt32.of_int 2147483650 then Device_removed
  else if v = Unsigned.UInt32.of_int 2147483651 then Property_notify
  else if v = Unsigned.UInt32.of_int 2147483652 then Stream_collection
  else if v = Unsigned.UInt32.of_int 2147483653 then Streams_selected
  else if v = Unsigned.UInt32.of_int 2147483654 then Redirect
  else if v = Unsigned.UInt32.of_int 2147483654 then Device_changed
  else if v = Unsigned.UInt32.of_int 4294967295 then Any
  else raise (Invalid_argument "Unexpected Message_type value")

let to_value = function
  | Unknown -> Unsigned.UInt32.of_int 0
  | Eos -> Unsigned.UInt32.of_int 1
  | Error -> Unsigned.UInt32.of_int 2
  | Warning -> Unsigned.UInt32.of_int 4
  | Info -> Unsigned.UInt32.of_int 8
  | Tag -> Unsigned.UInt32.of_int 16
  | Buffering -> Unsigned.UInt32.of_int 32
  | State_changed -> Unsigned.UInt32.of_int 64
  | State_dirty -> Unsigned.UInt32.of_int 128
  | Step_done -> Unsigned.UInt32.of_int 256
  | Clock_provide -> Unsigned.UInt32.of_int 512
  | Clock_lost -> Unsigned.UInt32.of_int 1024
  | New_clock -> Unsigned.UInt32.of_int 2048
  | Structure_change -> Unsigned.UInt32.of_int 4096
  | Stream_status -> Unsigned.UInt32.of_int 8192
  | Application -> Unsigned.UInt32.of_int 16384
  | Element -> Unsigned.UInt32.of_int 32768
  | Segment_start -> Unsigned.UInt32.of_int 65536
  | Segment_done -> Unsigned.UInt32.of_int 131072
  | Duration_changed -> Unsigned.UInt32.of_int 262144
  | Latency -> Unsigned.UInt32.of_int 524288
  | Async_start -> Unsigned.UInt32.of_int 1048576
  | Async_done -> Unsigned.UInt32.of_int 2097152
  | Request_state -> Unsigned.UInt32.of_int 4194304
  | Step_start -> Unsigned.UInt32.of_int 8388608
  | Qos -> Unsigned.UInt32.of_int 16777216
  | Progress -> Unsigned.UInt32.of_int 33554432
  | Toc -> Unsigned.UInt32.of_int 67108864
  | Reset_time -> Unsigned.UInt32.of_int 134217728
  | Stream_start -> Unsigned.UInt32.of_int 268435456
  | Need_context -> Unsigned.UInt32.of_int 536870912
  | Have_context -> Unsigned.UInt32.of_int 1073741824
  | Extended -> Unsigned.UInt32.of_int 2147483648
  | Device_added -> Unsigned.UInt32.of_int 2147483649
  | Device_removed -> Unsigned.UInt32.of_int 2147483650
  | Property_notify -> Unsigned.UInt32.of_int 2147483651
  | Stream_collection -> Unsigned.UInt32.of_int 2147483652
  | Streams_selected -> Unsigned.UInt32.of_int 2147483653
  | Redirect -> Unsigned.UInt32.of_int 2147483654
  | Device_changed -> Unsigned.UInt32.of_int 2147483654
  | Any -> Unsigned.UInt32.of_int 4294967295

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , Unknown ); ( 1 , Eos ); ( 2 , Error ); ( 4 , Warning ); ( 8 , Info ); ( 16 , Tag ); ( 32 , Buffering ); ( 64 , State_changed ); ( 128 , State_dirty ); ( 256 , Step_done ); ( 512 , Clock_provide ); ( 1024 , Clock_lost ); ( 2048 , New_clock ); ( 4096 , Structure_change ); ( 8192 , Stream_status ); ( 16384 , Application ); ( 32768 , Element ); ( 65536 , Segment_start ); ( 131072 , Segment_done ); ( 262144 , Duration_changed ); ( 524288 , Latency ); ( 1048576 , Async_start ); ( 2097152 , Async_done ); ( 4194304 , Request_state ); ( 8388608 , Step_start ); ( 16777216 , Qos ); ( 33554432 , Progress ); ( 67108864 , Toc ); ( 134217728 , Reset_time ); ( 268435456 , Stream_start ); ( 536870912 , Need_context ); ( 1073741824 , Have_context ); ( 2147483648 , Extended ); ( 2147483649 , Device_added ); ( 2147483650 , Device_removed ); ( 2147483651 , Property_notify ); ( 2147483652 , Stream_collection ); ( 2147483653 , Streams_selected ); ( 2147483654 , Redirect ); ( 2147483654 , Device_changed ); ( 4294967295 , Any )]
  in
  let rec build_flags_list allf acc =
    match allf with
    | [] -> acc
    | (i, f) :: q -> if ((logand v (of_int i )) <> zero) then build_flags_list q (f :: acc)
      else build_flags_list q acc
  in build_flags_list all_flags []

let list_to_value flags =
  let open Unsigned.UInt32 in
  let rec logor_flags l acc =
    match l with
    | [] -> acc
    | f :: q -> let v = to_value f in
      let acc' = logor acc v in
      logor_flags q acc'
  in
  logor_flags flags zero

let t_list_view = view ~read:list_of_value ~write:list_to_value uint32_t

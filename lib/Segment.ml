open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Segment"

let f_flags = field t_typ "flags" (Segment_flags.t_list_view)
let f_rate = field t_typ "rate" (double)
let f_applied_rate = field t_typ "applied_rate" (double)
let f_format = field t_typ "format" (Format.t_view)
let f_base = field t_typ "base" (uint64_t)
let f_offset = field t_typ "offset" (uint64_t)
let f_start = field t_typ "start" (uint64_t)
let f_stop = field t_typ "stop" (uint64_t)
let f_time = field t_typ "time" (uint64_t)
let f_position = field t_typ "position" (uint64_t)
let f_duration = field t_typ "duration" (uint64_t)
(*Struct field Segment : C Array type for Types.Array tag tag not implemented*)
let _ = seal t_typ

let create =
  foreign "gst_segment_new" (void @-> returning (ptr t_typ))
let clip self format start stop =
  let clip_raw =
    foreign "gst_segment_clip" (ptr t_typ @-> Format.t_view @-> uint64_t @-> uint64_t @-> ptr (uint64_t) @-> ptr (uint64_t) @-> returning (bool))
  in
  let clip_start_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let clip_stop_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let ret = clip_raw self format start stop clip_start_ptr clip_stop_ptr in
  let clip_start = !@ clip_start_ptr in
  let clip_stop = !@ clip_stop_ptr in
  (ret, clip_start, clip_stop)
let copy =
  foreign "gst_segment_copy" (ptr t_typ @-> returning (ptr t_typ))
let copy_into =
  foreign "gst_segment_copy_into" (ptr t_typ @-> ptr t_typ @-> returning (void))
let do_seek self rate format flags start_type start stop_type stop =
  let do_seek_raw =
    foreign "gst_segment_do_seek" (ptr t_typ @-> double @-> Format.t_view @-> Seek_flags.t_list_view @-> Seek_type.t_view @-> uint64_t @-> Seek_type.t_view @-> uint64_t @-> ptr (bool) @-> returning (bool))
  in
  let update_ptr = allocate bool false in
  let ret = do_seek_raw self rate format flags start_type start stop_type stop update_ptr in
  let update = !@ update_ptr in
  (ret, update)
let free =
  foreign "gst_segment_free" (ptr t_typ @-> returning (void))
let init =
  foreign "gst_segment_init" (ptr t_typ @-> Format.t_view @-> returning (void))
let is_equal =
  foreign "gst_segment_is_equal" (ptr t_typ @-> ptr t_typ @-> returning (bool))
let offset_running_time =
  foreign "gst_segment_offset_running_time" (ptr t_typ @-> Format.t_view @-> int64_t @-> returning (bool))
let position_from_running_time =
  foreign "gst_segment_position_from_running_time" (ptr t_typ @-> Format.t_view @-> uint64_t @-> returning (uint64_t))
let position_from_running_time_full self format running_time =
  let position_from_running_time_full_raw =
    foreign "gst_segment_position_from_running_time_full" (ptr t_typ @-> Format.t_view @-> uint64_t @-> ptr (uint64_t) @-> returning (int32_t))
  in
  let position_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let ret = position_from_running_time_full_raw self format running_time position_ptr in
  let position = !@ position_ptr in
  (ret, position)
let position_from_stream_time =
  foreign "gst_segment_position_from_stream_time" (ptr t_typ @-> Format.t_view @-> uint64_t @-> returning (uint64_t))
let position_from_stream_time_full self format stream_time =
  let position_from_stream_time_full_raw =
    foreign "gst_segment_position_from_stream_time_full" (ptr t_typ @-> Format.t_view @-> uint64_t @-> ptr (uint64_t) @-> returning (int32_t))
  in
  let position_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let ret = position_from_stream_time_full_raw self format stream_time position_ptr in
  let position = !@ position_ptr in
  (ret, position)
let set_running_time =
  foreign "gst_segment_set_running_time" (ptr t_typ @-> Format.t_view @-> uint64_t @-> returning (bool))
let to_position =
  foreign "gst_segment_to_position" (ptr t_typ @-> Format.t_view @-> uint64_t @-> returning (uint64_t))
let to_running_time =
  foreign "gst_segment_to_running_time" (ptr t_typ @-> Format.t_view @-> uint64_t @-> returning (uint64_t))
let to_running_time_full self format position =
  let to_running_time_full_raw =
    foreign "gst_segment_to_running_time_full" (ptr t_typ @-> Format.t_view @-> uint64_t @-> ptr (uint64_t) @-> returning (int32_t))
  in
  let running_time_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let ret = to_running_time_full_raw self format position running_time_ptr in
  let running_time = !@ running_time_ptr in
  (ret, running_time)
let to_stream_time =
  foreign "gst_segment_to_stream_time" (ptr t_typ @-> Format.t_view @-> uint64_t @-> returning (uint64_t))
let to_stream_time_full self format position =
  let to_stream_time_full_raw =
    foreign "gst_segment_to_stream_time_full" (ptr t_typ @-> Format.t_view @-> uint64_t @-> ptr (uint64_t) @-> returning (int32_t))
  in
  let stream_time_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let ret = to_stream_time_full_raw self format position stream_time_ptr in
  let stream_time = !@ stream_time_ptr in
  (ret, stream_time)

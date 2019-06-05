open Ctypes

type t
val t_typ : t structure typ

val f_flags: (Segment_flags.t_list, t structure) field
val f_rate: (float, t structure) field
val f_applied_rate: (float, t structure) field
val f_format: (Format.t, t structure) field
val f_base: (Unsigned.uint64, t structure) field
val f_offset: (Unsigned.uint64, t structure) field
val f_start: (Unsigned.uint64, t structure) field
val f_stop: (Unsigned.uint64, t structure) field
val f_time: (Unsigned.uint64, t structure) field
val f_position: (Unsigned.uint64, t structure) field
val f_duration: (Unsigned.uint64, t structure) field
(*Struct field Segment : C Array type for Types.Array tag tag not implemented*)

val create :
  unit -> t structure ptr
val clip :
  t structure ptr -> Format.t -> Unsigned.uint64 -> Unsigned.uint64 -> (bool * Unsigned.uint64 * Unsigned.uint64)
val copy :
  t structure ptr -> t structure ptr
val copy_into :
  t structure ptr -> t structure ptr -> unit
val do_seek :
  t structure ptr -> float -> Format.t -> Seek_flags.t_list -> Seek_type.t -> Unsigned.uint64 -> Seek_type.t -> Unsigned.uint64 -> (bool * bool)
val free :
  t structure ptr -> unit
val init :
  t structure ptr -> Format.t -> unit
val is_equal :
  t structure ptr -> t structure ptr -> bool
val offset_running_time :
  t structure ptr -> Format.t -> int64 -> bool
val position_from_running_time :
  t structure ptr -> Format.t -> Unsigned.uint64 -> Unsigned.uint64
val position_from_running_time_full :
  t structure ptr -> Format.t -> Unsigned.uint64 -> (int32 * Unsigned.uint64)
val position_from_stream_time :
  t structure ptr -> Format.t -> Unsigned.uint64 -> Unsigned.uint64
val position_from_stream_time_full :
  t structure ptr -> Format.t -> Unsigned.uint64 -> (int32 * Unsigned.uint64)
val set_running_time :
  t structure ptr -> Format.t -> Unsigned.uint64 -> bool
val to_position :
  t structure ptr -> Format.t -> Unsigned.uint64 -> Unsigned.uint64
val to_running_time :
  t structure ptr -> Format.t -> Unsigned.uint64 -> Unsigned.uint64
val to_running_time_full :
  t structure ptr -> Format.t -> Unsigned.uint64 -> (int32 * Unsigned.uint64)
val to_stream_time :
  t structure ptr -> Format.t -> Unsigned.uint64 -> Unsigned.uint64
val to_stream_time_full :
  t structure ptr -> Format.t -> Unsigned.uint64 -> (int32 * Unsigned.uint64)

open Ctypes

type t
val t_typ : t typ

val id_compare_func :
  unit ptr option -> unit ptr option -> int32
val id_get_clock :
  unit ptr -> t ptr option
val id_get_time :
  unit ptr -> Unsigned.uint64
val id_ref :
  unit ptr -> unit ptr
val id_unref :
  unit ptr -> unit
val id_unschedule :
  unit ptr -> unit
val id_uses_clock :
  unit ptr -> t ptr -> bool
val id_wait :
  unit ptr -> (Clock_return.t * int64)
(*Not implemented gst_clock_id_wait_async type callback not implemented*)
val add_observation :
  t ptr -> Unsigned.uint64 -> Unsigned.uint64 -> (bool * float)
val add_observation_unapplied :
  t ptr -> Unsigned.uint64 -> Unsigned.uint64 -> (bool * float * Unsigned.uint64 * Unsigned.uint64 * Unsigned.uint64 * Unsigned.uint64)
val adjust_unlocked :
  t ptr -> Unsigned.uint64 -> Unsigned.uint64
val adjust_with_calibration :
  t ptr -> Unsigned.uint64 -> Unsigned.uint64 -> Unsigned.uint64 -> Unsigned.uint64 -> Unsigned.uint64 -> Unsigned.uint64
val get_calibration :
  t ptr -> (Unsigned.uint64 * Unsigned.uint64 * Unsigned.uint64 * Unsigned.uint64)
val get_internal_time :
  t ptr -> Unsigned.uint64
val get_master :
  t ptr -> t ptr option
val get_resolution :
  t ptr -> Unsigned.uint64
val get_time :
  t ptr -> Unsigned.uint64
val get_timeout :
  t ptr -> Unsigned.uint64
val is_synced :
  t ptr -> bool
val create_periodic_id :
  t ptr -> Unsigned.uint64 -> Unsigned.uint64 -> unit ptr
val create_single_shot_id :
  t ptr -> Unsigned.uint64 -> unit ptr
val periodic_id_reinit :
  t ptr -> unit ptr -> Unsigned.uint64 -> Unsigned.uint64 -> bool
val set_calibration :
  t ptr -> Unsigned.uint64 -> Unsigned.uint64 -> Unsigned.uint64 -> Unsigned.uint64 -> unit
val set_master :
  t ptr -> t ptr option -> bool
val set_resolution :
  t ptr -> Unsigned.uint64 -> Unsigned.uint64
val set_synced :
  t ptr -> bool -> unit
val set_timeout :
  t ptr -> Unsigned.uint64 -> unit
val single_shot_id_reinit :
  t ptr -> unit ptr -> Unsigned.uint64 -> bool
val unadjust_unlocked :
  t ptr -> Unsigned.uint64 -> Unsigned.uint64
val unadjust_with_calibration :
  t ptr -> Unsigned.uint64 -> Unsigned.uint64 -> Unsigned.uint64 -> Unsigned.uint64 -> Unsigned.uint64 -> Unsigned.uint64
val wait_for_sync :
  t ptr -> Unsigned.uint64 -> bool

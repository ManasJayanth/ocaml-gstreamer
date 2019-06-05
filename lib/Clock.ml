open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

let id_compare_func =
  foreign "gst_clock_id_compare_func" (ptr_opt void @-> ptr_opt void @-> returning (int32_t))
let id_get_clock =
  foreign "gst_clock_id_get_clock" (ptr void @-> returning (ptr_opt t_typ))
let id_get_time =
  foreign "gst_clock_id_get_time" (ptr void @-> returning (uint64_t))
let id_ref =
  foreign "gst_clock_id_ref" (ptr void @-> returning (ptr void))
let id_unref =
  foreign "gst_clock_id_unref" (ptr void @-> returning (void))
let id_unschedule =
  foreign "gst_clock_id_unschedule" (ptr void @-> returning (void))
let id_uses_clock =
  foreign "gst_clock_id_uses_clock" (ptr void @-> ptr t_typ @-> returning (bool))
let id_wait id =
  let id_wait_raw =
    foreign "gst_clock_id_wait" (ptr void @-> ptr (int64_t) @-> returning (Clock_return.t_view))
  in
  let jitter_ptr = allocate int64_t Int64.zero in
  let ret = id_wait_raw id jitter_ptr in
  let jitter = !@ jitter_ptr in
  (ret, jitter)
(*Not implemented gst_clock_id_wait_async type callback not implemented*)
let add_observation self slave master =
  let add_observation_raw =
    foreign "gst_clock_add_observation" (ptr t_typ @-> uint64_t @-> uint64_t @-> ptr (double) @-> returning (bool))
  in
  let r_squared_ptr = allocate double 0.0 in
  let ret = add_observation_raw self slave master r_squared_ptr in
  let r_squared = !@ r_squared_ptr in
  (ret, r_squared)
let add_observation_unapplied self slave master =
  let add_observation_unapplied_raw =
    foreign "gst_clock_add_observation_unapplied" (ptr t_typ @-> uint64_t @-> uint64_t @-> ptr (double) @-> ptr (uint64_t) @-> ptr (uint64_t) @-> ptr (uint64_t) @-> ptr (uint64_t) @-> returning (bool))
  in
  let r_squared_ptr = allocate double 0.0 in
  let internal_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let _external_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let rate_num_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let rate_denom_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let ret = add_observation_unapplied_raw self slave master r_squared_ptr internal_ptr _external_ptr rate_num_ptr rate_denom_ptr in
  let r_squared = !@ r_squared_ptr in
  let internal = !@ internal_ptr in
  let _external = !@ _external_ptr in
  let rate_num = !@ rate_num_ptr in
  let rate_denom = !@ rate_denom_ptr in
  (ret, r_squared, internal, _external, rate_num, rate_denom)
let adjust_unlocked =
  foreign "gst_clock_adjust_unlocked" (ptr t_typ @-> uint64_t @-> returning (uint64_t))
let adjust_with_calibration =
  foreign "gst_clock_adjust_with_calibration" (ptr t_typ @-> uint64_t @-> uint64_t @-> uint64_t @-> uint64_t @-> uint64_t @-> returning (uint64_t))
let get_calibration self =
  let get_calibration_raw =
    foreign "gst_clock_get_calibration" (ptr t_typ @-> ptr (uint64_t) @-> ptr (uint64_t) @-> ptr (uint64_t) @-> ptr (uint64_t) @-> returning (void))
  in
  let internal_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let _external_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let rate_num_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let rate_denom_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let ret = get_calibration_raw self internal_ptr _external_ptr rate_num_ptr rate_denom_ptr in
  let internal = !@ internal_ptr in
  let _external = !@ _external_ptr in
  let rate_num = !@ rate_num_ptr in
  let rate_denom = !@ rate_denom_ptr in
  (internal, _external, rate_num, rate_denom)
let get_internal_time =
  foreign "gst_clock_get_internal_time" (ptr t_typ @-> returning (uint64_t))
let get_master =
  foreign "gst_clock_get_master" (ptr t_typ @-> returning (ptr_opt t_typ))
let get_resolution =
  foreign "gst_clock_get_resolution" (ptr t_typ @-> returning (uint64_t))
let get_time =
  foreign "gst_clock_get_time" (ptr t_typ @-> returning (uint64_t))
let get_timeout =
  foreign "gst_clock_get_timeout" (ptr t_typ @-> returning (uint64_t))
let is_synced =
  foreign "gst_clock_is_synced" (ptr t_typ @-> returning (bool))
let create_periodic_id =
  foreign "gst_clock_new_periodic_id" (ptr t_typ @-> uint64_t @-> uint64_t @-> returning (ptr void))
let create_single_shot_id =
  foreign "gst_clock_new_single_shot_id" (ptr t_typ @-> uint64_t @-> returning (ptr void))
let periodic_id_reinit =
  foreign "gst_clock_periodic_id_reinit" (ptr t_typ @-> ptr void @-> uint64_t @-> uint64_t @-> returning (bool))
let set_calibration =
  foreign "gst_clock_set_calibration" (ptr t_typ @-> uint64_t @-> uint64_t @-> uint64_t @-> uint64_t @-> returning (void))
let set_master =
  foreign "gst_clock_set_master" (ptr t_typ @-> ptr_opt t_typ @-> returning (bool))
let set_resolution =
  foreign "gst_clock_set_resolution" (ptr t_typ @-> uint64_t @-> returning (uint64_t))
let set_synced =
  foreign "gst_clock_set_synced" (ptr t_typ @-> bool @-> returning (void))
let set_timeout =
  foreign "gst_clock_set_timeout" (ptr t_typ @-> uint64_t @-> returning (void))
let single_shot_id_reinit =
  foreign "gst_clock_single_shot_id_reinit" (ptr t_typ @-> ptr void @-> uint64_t @-> returning (bool))
let unadjust_unlocked =
  foreign "gst_clock_unadjust_unlocked" (ptr t_typ @-> uint64_t @-> returning (uint64_t))
let unadjust_with_calibration =
  foreign "gst_clock_unadjust_with_calibration" (ptr t_typ @-> uint64_t @-> uint64_t @-> uint64_t @-> uint64_t @-> uint64_t @-> returning (uint64_t))
let wait_for_sync =
  foreign "gst_clock_wait_for_sync" (ptr t_typ @-> uint64_t @-> returning (bool))

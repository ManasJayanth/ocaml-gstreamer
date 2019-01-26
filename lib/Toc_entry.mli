open Ctypes

type t
val t_typ : t structure typ

val create :
  Toc_entry_type.t -> string -> t structure ptr
val append_sub_entry :
  t structure ptr -> t structure ptr -> unit
val get_entry_type :
  t structure ptr -> Toc_entry_type.t
(* val get_loop :
 *   t structure ptr -> (bool * Toc_loop_type.t * int32) *)
val get_parent :
  t structure ptr -> t structure ptr option
val get_start_stop_times :
  t structure ptr -> (bool * int64 * int64)
(* val get_sub_entries :
 *   t structure ptr -> List.t structure (\* Not implemented : interface *\) ptr *)
val get_tags :
  t structure ptr -> Tag_list.t structure ptr
(* val get_toc :
 *   t structure ptr -> Toc.t structure ptr *)
val get_uid :
  t structure ptr -> string option
val is_alternative :
  t structure ptr -> bool
val is_sequence :
  t structure ptr -> bool
val merge_tags :
  t structure ptr -> Tag_list.t structure ptr option -> Tag_merge_mode.t -> unit
val set_loop :
  t structure ptr -> Toc_loop_type.t -> int32 -> unit
val set_start_stop_times :
  t structure ptr -> int64 -> int64 -> unit
val set_tags :
  t structure ptr -> Tag_list.t structure ptr option -> unit

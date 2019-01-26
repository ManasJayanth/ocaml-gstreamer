open Ctypes

type t
val t_typ : t structure typ

val create :
  Toc_scope.t -> t structure ptr
val append_entry :
  t structure ptr -> Toc_entry.t structure ptr -> unit
val dump :
  t structure ptr -> unit
val find_entry :
  t structure ptr -> string -> Toc_entry.t structure ptr option
(* val get_entries :
 *   t structure ptr -> List.t structure (\* Not implemented : interface *\) ptr *)
val get_scope :
  t structure ptr -> Toc_scope.t
val get_tags :
  t structure ptr -> Tag_list.t structure ptr
val merge_tags :
  t structure ptr -> Tag_list.t structure ptr option -> Tag_merge_mode.t -> unit
val set_tags :
  t structure ptr -> Tag_list.t structure ptr option -> unit

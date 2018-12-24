open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Mini_object"

(*Struct field Mini_object : gType tag not implemented*)
let f_refcount = field t_typ "refcount" (int32_t)
let f_lockstate = field t_typ "lockstate" (int32_t)
let f_flags = field t_typ "flags" (uint32_t)
let f_copy = field t_typ "copy" (ptr void)
(*Struct field Mini_object : callback tag not implemented*)
(*Struct field Mini_object : callback tag not implemented*)
let f_n_qdata = field t_typ "n_qdata" (uint32_t)
let f_qdata = field t_typ "qdata" (ptr void)
let _ = seal t_typ

let get_qdata =
  foreign "gst_mini_object_get_qdata" (ptr t_typ @-> uint32_t @-> returning (ptr_opt void))
let is_writable =
  foreign "gst_mini_object_is_writable" (ptr t_typ @-> returning (bool))
let lock =
  foreign "gst_mini_object_lock" (ptr t_typ @-> Lock_flags.t_list_view @-> returning (bool))
(*Not implemented gst_mini_object_set_qdata type callback not implemented*)
let steal_qdata =
  foreign "gst_mini_object_steal_qdata" (ptr t_typ @-> uint32_t @-> returning (ptr_opt void))
let unlock =
  foreign "gst_mini_object_unlock" (ptr t_typ @-> Lock_flags.t_list_view @-> returning (void))
let replace newdata olddata =
  let replace_raw =
    foreign "gst_mini_object_replace" (ptr_opt t_typ @-> ptr (ptr_opt t_typ) @-> returning (bool))
  in
  let olddata_ptr = allocate (ptr_opt t_typ) None in
  let ret = replace_raw newdata olddata_ptr in
  let olddata = !@ olddata_ptr in
  (ret, olddata)
(* let take newdata olddata =
 *   let take_raw =
 *     foreign "gst_mini_object_take" (ptr t_typ @-> ptr (ptr t_typ) @-> returning (bool))
 *   in
 *   let olddata_ptr = allocate (ptr_opt t_typ) None in
 *   let ret = take_raw newdata olddata_ptr in
 *   let olddata = !@ olddata_ptr in
 *   (ret, olddata) *)

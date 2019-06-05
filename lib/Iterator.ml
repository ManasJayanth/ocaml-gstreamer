open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Iterator"

(*Struct field Iterator : callback tag not implemented*)
(*Struct field Iterator : callback tag not implemented*)
(*Struct field Iterator : callback tag not implemented*)
(*Struct field Iterator : callback tag not implemented*)
(*Struct field Iterator : callback tag not implemented*)
let f_pushed = field t_typ "pushed" (ptr t_typ)
(*Struct field Iterator : gType tag not implemented*)
(*Struct field Iterator : union tag not implemented*)
let f_cookie = field t_typ "cookie" (uint32_t)
let f_master_cookie = field t_typ "master_cookie" (ptr uint32_t)
let f_size = field t_typ "size" (uint32_t)
(*Struct field Iterator : C Array type for Types.Array tag tag not implemented*)
let _ = seal t_typ

(*Not implemented gst_iterator_new_single type gType not implemented*)
let copy =
  foreign "gst_iterator_copy" (ptr t_typ @-> returning (ptr t_typ))
(*Not implemented gst_iterator_filter type callback not implemented*)
(*Not implemented gst_iterator_find_custom type callback not implemented*)
(*Not implemented gst_iterator_fold type callback not implemented*)
(*Not implemented gst_iterator_foreach type callback not implemented*)
let free =
  foreign "gst_iterator_free" (ptr t_typ @-> returning (void))
let next self =
  let next_raw =
    foreign "gst_iterator_next" (ptr t_typ @-> ptr (Value.t_typ) @-> returning (Iterator_result.t_view))
  in
  let elem_ptr = allocate Value.t_typ (make Value.t_typ) in
  let ret = next_raw self elem_ptr in
  let elem = !@ elem_ptr in
  (ret, elem)
let push =
  foreign "gst_iterator_push" (ptr t_typ @-> ptr t_typ @-> returning (void))
let resync =
  foreign "gst_iterator_resync" (ptr t_typ @-> returning (void))

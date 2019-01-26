open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

let find =
  foreign "gst_allocator_find" (string_opt @-> returning (ptr_opt t_typ))
let register =
  foreign "gst_allocator_register" (string @-> ptr t_typ @-> returning (void))
let alloc =
  foreign "gst_allocator_alloc" (ptr t_typ @-> uint64_t @-> ptr_opt Allocation_params.t_typ @-> returning (ptr_opt Memory.t_typ))
let free =
  foreign "gst_allocator_free" (ptr t_typ @-> ptr Memory.t_typ @-> returning (void))
let set_default =
  foreign "gst_allocator_set_default" (ptr t_typ @-> returning (void))

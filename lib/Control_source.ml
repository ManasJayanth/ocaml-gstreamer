open Ctypes
open Foreign

type t = unit ptr
let t_typ : t typ = ptr void

let control_source_get_value self timestamp =
  let control_source_get_value_raw =
    foreign "gst_control_source_get_value" (ptr t_typ @-> uint64_t @-> ptr (double) @-> returning (bool))
  in
  let value_ptr = allocate double 0.0 in
  let ret = control_source_get_value_raw self timestamp value_ptr in
  let value = !@ value_ptr in
  (ret, value)
(*Not implemented gst_control_source_get_value_array type C Array type for Types.Array tag not implemented*)

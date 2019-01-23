open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Tag_list"

let f_mini_object = field t_typ "mini_object" (Mini_object.t_typ)
let _ = seal t_typ

let create_empty =
  foreign "gst_tag_list_new_empty" (void @-> returning (ptr t_typ))
let create_from_string =
  foreign "gst_tag_list_new_from_string" (string @-> returning (ptr_opt t_typ))
let add_value =
  foreign "gst_tag_list_add_value" (ptr t_typ @-> Tag_merge_mode.t_view @-> string @-> ptr Value.t_typ @-> returning (void))
(*Not implemented gst_tag_list_foreach type callback not implemented*)
(* let get_boolean self tag =
 *   let get_boolean_raw =
 *     foreign "gst_tag_list_get_boolean" (ptr t_typ @-> string @-> ptr (bool) @-> returning (bool))
 *   in
 *   let value_ptr = allocate bool false in
 *   let ret = get_boolean_raw self tag value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_boolean_index self tag index =
 *   let get_boolean_index_raw =
 *     foreign "gst_tag_list_get_boolean_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (bool) @-> returning (bool))
 *   in
 *   let value_ptr = allocate bool false in
 *   let ret = get_boolean_index_raw self tag index value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_date self tag =
 *   let get_date_raw =
 *     foreign "gst_tag_list_get_date" (ptr t_typ @-> string @-> ptr (ptr Date.t_typ) @-> returning (bool))
 *   in
 *   let value_ptr = allocate (ptr_opt Date.t_typ) None in
 *   let ret = get_date_raw self tag value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_date_index self tag index =
 *   let get_date_index_raw =
 *     foreign "gst_tag_list_get_date_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (ptr Date.t_typ) @-> returning (bool))
 *   in
 *   let value_ptr = allocate (ptr_opt Date.t_typ) None in
 *   let ret = get_date_index_raw self tag index value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_date_time self tag =
 *   let get_date_time_raw =
 *     foreign "gst_tag_list_get_date_time" (ptr t_typ @-> string @-> ptr (ptr Date_time.t_typ) @-> returning (bool))
 *   in
 *   let value_ptr = allocate (ptr_opt Date_time.t_typ) None in
 *   let ret = get_date_time_raw self tag value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_date_time_index self tag index =
 *   let get_date_time_index_raw =
 *     foreign "gst_tag_list_get_date_time_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (ptr Date_time.t_typ) @-> returning (bool))
 *   in
 *   let value_ptr = allocate (ptr_opt Date_time.t_typ) None in
 *   let ret = get_date_time_index_raw self tag index value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_double self tag =
 *   let get_double_raw =
 *     foreign "gst_tag_list_get_double" (ptr t_typ @-> string @-> ptr (double) @-> returning (bool))
 *   in
 *   let value_ptr = allocate double 0.0 in
 *   let ret = get_double_raw self tag value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_double_index self tag index =
 *   let get_double_index_raw =
 *     foreign "gst_tag_list_get_double_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (double) @-> returning (bool))
 *   in
 *   let value_ptr = allocate double 0.0 in
 *   let ret = get_double_index_raw self tag index value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_float self tag =
 *   let get_float_raw =
 *     foreign "gst_tag_list_get_float" (ptr t_typ @-> string @-> ptr (float) @-> returning (bool))
 *   in
 *   let value_ptr = allocate float 0.0 in
 *   let ret = get_float_raw self tag value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_float_index self tag index =
 *   let get_float_index_raw =
 *     foreign "gst_tag_list_get_float_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (float) @-> returning (bool))
 *   in
 *   let value_ptr = allocate float 0.0 in
 *   let ret = get_float_index_raw self tag index value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_int self tag =
 *   let get_int_raw =
 *     foreign "gst_tag_list_get_int" (ptr t_typ @-> string @-> ptr (int32_t) @-> returning (bool))
 *   in
 *   let value_ptr = allocate int32_t Int32.zero in
 *   let ret = get_int_raw self tag value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_int64 self tag =
 *   let get_int64_raw =
 *     foreign "gst_tag_list_get_int64" (ptr t_typ @-> string @-> ptr (int64_t) @-> returning (bool))
 *   in
 *   let value_ptr = allocate int64_t Int64.zero in
 *   let ret = get_int64_raw self tag value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_int64_index self tag index =
 *   let get_int64_index_raw =
 *     foreign "gst_tag_list_get_int64_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (int64_t) @-> returning (bool))
 *   in
 *   let value_ptr = allocate int64_t Int64.zero in
 *   let ret = get_int64_index_raw self tag index value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_int_index self tag index =
 *   let get_int_index_raw =
 *     foreign "gst_tag_list_get_int_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (int32_t) @-> returning (bool))
 *   in
 *   let value_ptr = allocate int32_t Int32.zero in
 *   let ret = get_int_index_raw self tag index value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_pointer self tag =
 *   let get_pointer_raw =
 *     foreign "gst_tag_list_get_pointer" (ptr t_typ @-> string @-> ptr (ptr_opt void) @-> returning (bool))
 *   in
 *   let value_ptr = allocate (ptr_opt void) None in
 *   let ret = get_pointer_raw self tag value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_pointer_index self tag index =
 *   let get_pointer_index_raw =
 *     foreign "gst_tag_list_get_pointer_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (ptr_opt void) @-> returning (bool))
 *   in
 *   let value_ptr = allocate (ptr_opt void) None in
 *   let ret = get_pointer_index_raw self tag index value_ptr in
 *   let value = !@ value_ptr in
 *   (ret, value)
 * let get_sample self tag =
 *   let get_sample_raw =
 *     foreign "gst_tag_list_get_sample" (ptr t_typ @-> string @-> ptr (ptr Sample.t_typ) @-> returning (bool))
 *   in
 *   let sample_ptr = allocate (ptr_opt Sample.t_typ) None in
 *   let ret = get_sample_raw self tag sample_ptr in
 *   let sample = !@ sample_ptr in
 *   (ret, sample)
 * let get_sample_index self tag index =
 *   let get_sample_index_raw =
 *     foreign "gst_tag_list_get_sample_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (ptr Sample.t_typ) @-> returning (bool))
 *   in
 *   let sample_ptr = allocate (ptr_opt Sample.t_typ) None in
 *   let ret = get_sample_index_raw self tag index sample_ptr in
 *   let sample = !@ sample_ptr in
 *   (ret, sample) *)
let get_scope =
  foreign "gst_tag_list_get_scope" (ptr t_typ @-> returning (Tag_scope.t_view))
let get_string self tag =
  let get_string_raw =
    foreign "gst_tag_list_get_string" (ptr t_typ @-> string @-> ptr (string) @-> returning (bool))
  in
  let value_ptr = allocate string " " in
  let ret = get_string_raw self tag value_ptr in
  let value = !@ value_ptr in
  (ret, value)
let get_string_index self tag index =
  let get_string_index_raw =
    foreign "gst_tag_list_get_string_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (string) @-> returning (bool))
  in
  let value_ptr = allocate string " " in
  let ret = get_string_index_raw self tag index value_ptr in
  let value = !@ value_ptr in
  (ret, value)
let get_tag_size =
  foreign "gst_tag_list_get_tag_size" (ptr t_typ @-> string @-> returning (uint32_t))
let get_uint self tag =
  let get_uint_raw =
    foreign "gst_tag_list_get_uint" (ptr t_typ @-> string @-> ptr (uint32_t) @-> returning (bool))
  in
  let value_ptr = allocate uint32_t Unsigned.UInt32.zero in
  let ret = get_uint_raw self tag value_ptr in
  let value = !@ value_ptr in
  (ret, value)
let get_uint64 self tag =
  let get_uint64_raw =
    foreign "gst_tag_list_get_uint64" (ptr t_typ @-> string @-> ptr (uint64_t) @-> returning (bool))
  in
  let value_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let ret = get_uint64_raw self tag value_ptr in
  let value = !@ value_ptr in
  (ret, value)
let get_uint64_index self tag index =
  let get_uint64_index_raw =
    foreign "gst_tag_list_get_uint64_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (uint64_t) @-> returning (bool))
  in
  let value_ptr = allocate uint64_t Unsigned.UInt64.zero in
  let ret = get_uint64_index_raw self tag index value_ptr in
  let value = !@ value_ptr in
  (ret, value)
let get_uint_index self tag index =
  let get_uint_index_raw =
    foreign "gst_tag_list_get_uint_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (uint32_t) @-> returning (bool))
  in
  let value_ptr = allocate uint32_t Unsigned.UInt32.zero in
  let ret = get_uint_index_raw self tag index value_ptr in
  let value = !@ value_ptr in
  (ret, value)
let get_value_index =
  foreign "gst_tag_list_get_value_index" (ptr t_typ @-> string @-> uint32_t @-> returning (ptr_opt Value.t_typ))
let insert =
  foreign "gst_tag_list_insert" (ptr t_typ @-> ptr t_typ @-> Tag_merge_mode.t_view @-> returning (void))
let is_empty =
  foreign "gst_tag_list_is_empty" (ptr t_typ @-> returning (bool))
let is_equal =
  foreign "gst_tag_list_is_equal" (ptr t_typ @-> ptr t_typ @-> returning (bool))
let merge =
  foreign "gst_tag_list_merge" (ptr t_typ @-> ptr_opt t_typ @-> Tag_merge_mode.t_view @-> returning (ptr_opt t_typ))
let n_tags =
  foreign "gst_tag_list_n_tags" (ptr t_typ @-> returning (int32_t))
let nth_tag_name =
  foreign "gst_tag_list_nth_tag_name" (ptr t_typ @-> uint32_t @-> returning (string_opt))
let peek_string_index self tag index =
  let peek_string_index_raw =
    foreign "gst_tag_list_peek_string_index" (ptr t_typ @-> string @-> uint32_t @-> ptr (string) @-> returning (bool))
  in
  let value_ptr = allocate string " " in
  let ret = peek_string_index_raw self tag index value_ptr in
  let value = !@ value_ptr in
  (ret, value)
let remove_tag =
  foreign "gst_tag_list_remove_tag" (ptr t_typ @-> string @-> returning (void))
let set_scope =
  foreign "gst_tag_list_set_scope" (ptr t_typ @-> Tag_scope.t_view @-> returning (void))
let to_string =
  foreign "gst_tag_list_to_string" (ptr t_typ @-> returning (string_opt))
let copy_value _list tag =
  let copy_value_raw =
    foreign "gst_tag_list_copy_value" (ptr t_typ @-> string @-> ptr (Value.t_typ) @-> returning (bool))
  in
  let dest_ptr = allocate Value.t_typ (make Value.t_typ) in
  let ret = copy_value_raw _list tag dest_ptr in
  let dest = !@ dest_ptr in
  (ret, dest)

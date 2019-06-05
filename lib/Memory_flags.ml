open Ctypes
open Foreign

type t = Readonly | No_share | Zero_prefixed | Zero_padded | Physically_contiguous | Not_mappable | Last
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 2 then Readonly
  else if v = Unsigned.UInt32.of_int 16 then No_share
  else if v = Unsigned.UInt32.of_int 32 then Zero_prefixed
  else if v = Unsigned.UInt32.of_int 64 then Zero_padded
  else if v = Unsigned.UInt32.of_int 128 then Physically_contiguous
  else if v = Unsigned.UInt32.of_int 256 then Not_mappable
  else if v = Unsigned.UInt32.of_int 1048576 then Last
  else raise (Invalid_argument "Unexpected Memory_flags value")

let to_value = function
  | Readonly -> Unsigned.UInt32.of_int 2
  | No_share -> Unsigned.UInt32.of_int 16
  | Zero_prefixed -> Unsigned.UInt32.of_int 32
  | Zero_padded -> Unsigned.UInt32.of_int 64
  | Physically_contiguous -> Unsigned.UInt32.of_int 128
  | Not_mappable -> Unsigned.UInt32.of_int 256
  | Last -> Unsigned.UInt32.of_int 1048576

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 2 , Readonly ); ( 16 , No_share ); ( 32 , Zero_prefixed ); ( 64 , Zero_padded ); ( 128 , Physically_contiguous ); ( 256 , Not_mappable ); ( 1048576 , Last )]
  in
  let rec build_flags_list allf acc =
    match allf with
    | [] -> acc
    | (i, f) :: q -> if ((logand v (of_int i )) <> zero) then build_flags_list q (f :: acc)
      else build_flags_list q acc
  in build_flags_list all_flags []

let list_to_value flags =
  let open Unsigned.UInt32 in
  let rec logor_flags l acc =
    match l with
    | [] -> acc
    | f :: q -> let v = to_value f in
      let acc' = logor acc v in
      logor_flags q acc'
  in
  logor_flags flags zero

let t_list_view = view ~read:list_of_value ~write:list_to_value uint32_t

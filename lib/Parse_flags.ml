open Ctypes
open Foreign

type t = None | Fatal_errors | No_single_element_bins | Place_in_bin
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Fatal_errors
  else if v = Unsigned.UInt32.of_int 2 then No_single_element_bins
  else if v = Unsigned.UInt32.of_int 4 then Place_in_bin
  else raise (Invalid_argument "Unexpected Parse_flags value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | Fatal_errors -> Unsigned.UInt32.of_int 1
  | No_single_element_bins -> Unsigned.UInt32.of_int 2
  | Place_in_bin -> Unsigned.UInt32.of_int 4

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 1 , Fatal_errors ); ( 2 , No_single_element_bins ); ( 4 , Place_in_bin )]
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

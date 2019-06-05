open Ctypes
open Foreign

type t = Media_type | Caps_details | Non_default_params | States | Full_params | All | Verbose
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Media_type
  else if v = Unsigned.UInt32.of_int 2 then Caps_details
  else if v = Unsigned.UInt32.of_int 4 then Non_default_params
  else if v = Unsigned.UInt32.of_int 8 then States
  else if v = Unsigned.UInt32.of_int 16 then Full_params
  else if v = Unsigned.UInt32.of_int 15 then All
  else if v = Unsigned.UInt32.of_int 4294967295 then Verbose
  else raise (Invalid_argument "Unexpected Debug_graph_details value")

let to_value = function
  | Media_type -> Unsigned.UInt32.of_int 1
  | Caps_details -> Unsigned.UInt32.of_int 2
  | Non_default_params -> Unsigned.UInt32.of_int 4
  | States -> Unsigned.UInt32.of_int 8
  | Full_params -> Unsigned.UInt32.of_int 16
  | All -> Unsigned.UInt32.of_int 15
  | Verbose -> Unsigned.UInt32.of_int 4294967295

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 1 , Media_type ); ( 2 , Caps_details ); ( 4 , Non_default_params ); ( 8 , States ); ( 16 , Full_params ); ( 15 , All ); ( 4294967295 , Verbose )]
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

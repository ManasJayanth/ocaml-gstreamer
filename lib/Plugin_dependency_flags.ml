open Ctypes
open Foreign

type t = None | Recurse | Paths_are_default_only | File_name_is_suffix | File_name_is_prefix | Paths_are_relative_to_exe
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Recurse
  else if v = Unsigned.UInt32.of_int 2 then Paths_are_default_only
  else if v = Unsigned.UInt32.of_int 4 then File_name_is_suffix
  else if v = Unsigned.UInt32.of_int 8 then File_name_is_prefix
  else if v = Unsigned.UInt32.of_int 16 then Paths_are_relative_to_exe
  else raise (Invalid_argument "Unexpected Plugin_dependency_flags value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | Recurse -> Unsigned.UInt32.of_int 1
  | Paths_are_default_only -> Unsigned.UInt32.of_int 2
  | File_name_is_suffix -> Unsigned.UInt32.of_int 4
  | File_name_is_prefix -> Unsigned.UInt32.of_int 8
  | Paths_are_relative_to_exe -> Unsigned.UInt32.of_int 16

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 1 , Recurse ); ( 2 , Paths_are_default_only ); ( 4 , File_name_is_suffix ); ( 8 , File_name_is_prefix ); ( 16 , Paths_are_relative_to_exe )]
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

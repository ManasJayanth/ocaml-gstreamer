open Ctypes
open Foreign

type t = Unknown | Audio | Video | Container | Text
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Unknown
  else if v = Unsigned.UInt32.of_int 2 then Audio
  else if v = Unsigned.UInt32.of_int 4 then Video
  else if v = Unsigned.UInt32.of_int 8 then Container
  else if v = Unsigned.UInt32.of_int 16 then Text
  else raise (Invalid_argument "Unexpected Stream_type value")

let to_value = function
  | Unknown -> Unsigned.UInt32.of_int 1
  | Audio -> Unsigned.UInt32.of_int 2
  | Video -> Unsigned.UInt32.of_int 4
  | Container -> Unsigned.UInt32.of_int 8
  | Text -> Unsigned.UInt32.of_int 16

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 1 , Unknown ); ( 2 , Audio ); ( 4 , Video ); ( 8 , Container ); ( 16 , Text )]
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

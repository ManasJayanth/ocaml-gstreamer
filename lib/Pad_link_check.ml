open Ctypes
open Foreign

type t = Nothing | Hierarchy | Template_caps | Caps | No_reconfigure | Default
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Nothing
  else if v = Unsigned.UInt32.of_int 1 then Hierarchy
  else if v = Unsigned.UInt32.of_int 2 then Template_caps
  else if v = Unsigned.UInt32.of_int 4 then Caps
  else if v = Unsigned.UInt32.of_int 8 then No_reconfigure
  else if v = Unsigned.UInt32.of_int 5 then Default
  else raise (Invalid_argument "Unexpected Pad_link_check value")

let to_value = function
  | Nothing -> Unsigned.UInt32.of_int 0
  | Hierarchy -> Unsigned.UInt32.of_int 1
  | Template_caps -> Unsigned.UInt32.of_int 2
  | Caps -> Unsigned.UInt32.of_int 4
  | No_reconfigure -> Unsigned.UInt32.of_int 8
  | Default -> Unsigned.UInt32.of_int 5

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , Nothing ); ( 1 , Hierarchy ); ( 2 , Template_caps ); ( 4 , Caps ); ( 8 , No_reconfigure ); ( 5 , Default )]
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

open Ctypes
open Foreign

type t = Locked_state | Sink | Source | Provide_clock | Require_clock | Indexable | Last
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 16 then Locked_state
  else if v = Unsigned.UInt32.of_int 32 then Sink
  else if v = Unsigned.UInt32.of_int 64 then Source
  else if v = Unsigned.UInt32.of_int 128 then Provide_clock
  else if v = Unsigned.UInt32.of_int 256 then Require_clock
  else if v = Unsigned.UInt32.of_int 512 then Indexable
  else if v = Unsigned.UInt32.of_int 16384 then Last
  else raise (Invalid_argument "Unexpected Element_flags value")

let to_value = function
  | Locked_state -> Unsigned.UInt32.of_int 16
  | Sink -> Unsigned.UInt32.of_int 32
  | Source -> Unsigned.UInt32.of_int 64
  | Provide_clock -> Unsigned.UInt32.of_int 128
  | Require_clock -> Unsigned.UInt32.of_int 256
  | Indexable -> Unsigned.UInt32.of_int 512
  | Last -> Unsigned.UInt32.of_int 16384

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 16 , Locked_state ); ( 32 , Sink ); ( 64 , Source ); ( 128 , Provide_clock ); ( 256 , Require_clock ); ( 512 , Indexable ); ( 16384 , Last )]
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

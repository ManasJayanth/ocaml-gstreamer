open Ctypes
open Foreign

type t = Invalid | Idle | Block | Buffer | Buffer_list | Event_downstream | Event_upstream | Event_flush | Query_downstream | Query_upstream | Push | Pull | Blocking | Data_downstream | Data_upstream | Data_both | Block_downstream | Block_upstream | Event_both | Query_both | All_both | Scheduling
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Invalid
  else if v = Unsigned.UInt32.of_int 1 then Idle
  else if v = Unsigned.UInt32.of_int 2 then Block
  else if v = Unsigned.UInt32.of_int 16 then Buffer
  else if v = Unsigned.UInt32.of_int 32 then Buffer_list
  else if v = Unsigned.UInt32.of_int 64 then Event_downstream
  else if v = Unsigned.UInt32.of_int 128 then Event_upstream
  else if v = Unsigned.UInt32.of_int 256 then Event_flush
  else if v = Unsigned.UInt32.of_int 512 then Query_downstream
  else if v = Unsigned.UInt32.of_int 1024 then Query_upstream
  else if v = Unsigned.UInt32.of_int 4096 then Push
  else if v = Unsigned.UInt32.of_int 8192 then Pull
  else if v = Unsigned.UInt32.of_int 3 then Blocking
  else if v = Unsigned.UInt32.of_int 112 then Data_downstream
  else if v = Unsigned.UInt32.of_int 128 then Data_upstream
  else if v = Unsigned.UInt32.of_int 240 then Data_both
  else if v = Unsigned.UInt32.of_int 114 then Block_downstream
  else if v = Unsigned.UInt32.of_int 130 then Block_upstream
  else if v = Unsigned.UInt32.of_int 192 then Event_both
  else if v = Unsigned.UInt32.of_int 1536 then Query_both
  else if v = Unsigned.UInt32.of_int 1776 then All_both
  else if v = Unsigned.UInt32.of_int 12288 then Scheduling
  else raise (Invalid_argument "Unexpected Pad_probe_type value")

let to_value = function
  | Invalid -> Unsigned.UInt32.of_int 0
  | Idle -> Unsigned.UInt32.of_int 1
  | Block -> Unsigned.UInt32.of_int 2
  | Buffer -> Unsigned.UInt32.of_int 16
  | Buffer_list -> Unsigned.UInt32.of_int 32
  | Event_downstream -> Unsigned.UInt32.of_int 64
  | Event_upstream -> Unsigned.UInt32.of_int 128
  | Event_flush -> Unsigned.UInt32.of_int 256
  | Query_downstream -> Unsigned.UInt32.of_int 512
  | Query_upstream -> Unsigned.UInt32.of_int 1024
  | Push -> Unsigned.UInt32.of_int 4096
  | Pull -> Unsigned.UInt32.of_int 8192
  | Blocking -> Unsigned.UInt32.of_int 3
  | Data_downstream -> Unsigned.UInt32.of_int 112
  | Data_upstream -> Unsigned.UInt32.of_int 128
  | Data_both -> Unsigned.UInt32.of_int 240
  | Block_downstream -> Unsigned.UInt32.of_int 114
  | Block_upstream -> Unsigned.UInt32.of_int 130
  | Event_both -> Unsigned.UInt32.of_int 192
  | Query_both -> Unsigned.UInt32.of_int 1536
  | All_both -> Unsigned.UInt32.of_int 1776
  | Scheduling -> Unsigned.UInt32.of_int 12288

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , Invalid ); ( 1 , Idle ); ( 2 , Block ); ( 16 , Buffer ); ( 32 , Buffer_list ); ( 64 , Event_downstream ); ( 128 , Event_upstream ); ( 256 , Event_flush ); ( 512 , Query_downstream ); ( 1024 , Query_upstream ); ( 4096 , Push ); ( 8192 , Pull ); ( 3 , Blocking ); ( 112 , Data_downstream ); ( 128 , Data_upstream ); ( 240 , Data_both ); ( 114 , Block_downstream ); ( 130 , Block_upstream ); ( 192 , Event_both ); ( 1536 , Query_both ); ( 1776 , All_both ); ( 12288 , Scheduling )]
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

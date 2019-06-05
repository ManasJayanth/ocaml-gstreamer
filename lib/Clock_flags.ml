open Ctypes
open Foreign

type t = Can_do_single_sync | Can_do_single_async | Can_do_periodic_sync | Can_do_periodic_async | Can_set_resolution | Can_set_master | Needs_startup_sync | Last
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 16 then Can_do_single_sync
  else if v = Unsigned.UInt32.of_int 32 then Can_do_single_async
  else if v = Unsigned.UInt32.of_int 64 then Can_do_periodic_sync
  else if v = Unsigned.UInt32.of_int 128 then Can_do_periodic_async
  else if v = Unsigned.UInt32.of_int 256 then Can_set_resolution
  else if v = Unsigned.UInt32.of_int 512 then Can_set_master
  else if v = Unsigned.UInt32.of_int 1024 then Needs_startup_sync
  else if v = Unsigned.UInt32.of_int 4096 then Last
  else raise (Invalid_argument "Unexpected Clock_flags value")

let to_value = function
  | Can_do_single_sync -> Unsigned.UInt32.of_int 16
  | Can_do_single_async -> Unsigned.UInt32.of_int 32
  | Can_do_periodic_sync -> Unsigned.UInt32.of_int 64
  | Can_do_periodic_async -> Unsigned.UInt32.of_int 128
  | Can_set_resolution -> Unsigned.UInt32.of_int 256
  | Can_set_master -> Unsigned.UInt32.of_int 512
  | Needs_startup_sync -> Unsigned.UInt32.of_int 1024
  | Last -> Unsigned.UInt32.of_int 4096

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 16 , Can_do_single_sync ); ( 32 , Can_do_single_async ); ( 64 , Can_do_periodic_sync ); ( 128 , Can_do_periodic_async ); ( 256 , Can_set_resolution ); ( 512 , Can_set_master ); ( 1024 , Needs_startup_sync ); ( 4096 , Last )]
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

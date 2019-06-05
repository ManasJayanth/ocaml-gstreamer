open Ctypes
open Foreign

type t = Live | Decode_only | Discont | Resync | Corrupted | Marker | Header | Gap | Droppable | Delta_unit | Tag_memory | Sync_after | Non_droppable | Last
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 16 then Live
  else if v = Unsigned.UInt32.of_int 32 then Decode_only
  else if v = Unsigned.UInt32.of_int 64 then Discont
  else if v = Unsigned.UInt32.of_int 128 then Resync
  else if v = Unsigned.UInt32.of_int 256 then Corrupted
  else if v = Unsigned.UInt32.of_int 512 then Marker
  else if v = Unsigned.UInt32.of_int 1024 then Header
  else if v = Unsigned.UInt32.of_int 2048 then Gap
  else if v = Unsigned.UInt32.of_int 4096 then Droppable
  else if v = Unsigned.UInt32.of_int 8192 then Delta_unit
  else if v = Unsigned.UInt32.of_int 16384 then Tag_memory
  else if v = Unsigned.UInt32.of_int 32768 then Sync_after
  else if v = Unsigned.UInt32.of_int 65536 then Non_droppable
  else if v = Unsigned.UInt32.of_int 1048576 then Last
  else raise (Invalid_argument "Unexpected Buffer_flags value")

let to_value = function
  | Live -> Unsigned.UInt32.of_int 16
  | Decode_only -> Unsigned.UInt32.of_int 32
  | Discont -> Unsigned.UInt32.of_int 64
  | Resync -> Unsigned.UInt32.of_int 128
  | Corrupted -> Unsigned.UInt32.of_int 256
  | Marker -> Unsigned.UInt32.of_int 512
  | Header -> Unsigned.UInt32.of_int 1024
  | Gap -> Unsigned.UInt32.of_int 2048
  | Droppable -> Unsigned.UInt32.of_int 4096
  | Delta_unit -> Unsigned.UInt32.of_int 8192
  | Tag_memory -> Unsigned.UInt32.of_int 16384
  | Sync_after -> Unsigned.UInt32.of_int 32768
  | Non_droppable -> Unsigned.UInt32.of_int 65536
  | Last -> Unsigned.UInt32.of_int 1048576

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 16 , Live ); ( 32 , Decode_only ); ( 64 , Discont ); ( 128 , Resync ); ( 256 , Corrupted ); ( 512 , Marker ); ( 1024 , Header ); ( 2048 , Gap ); ( 4096 , Droppable ); ( 8192 , Delta_unit ); ( 16384 , Tag_memory ); ( 32768 , Sync_after ); ( 65536 , Non_droppable ); ( 1048576 , Last )]
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

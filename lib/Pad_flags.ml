open Ctypes
open Foreign

type t = Blocked | Flushing | Eos | Blocking | Need_parent | Need_reconfigure | Pending_events | Fixed_caps | Proxy_caps | Proxy_allocation | Proxy_scheduling | Accept_intersect | Accept_template | Last
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 16 then Blocked
  else if v = Unsigned.UInt32.of_int 32 then Flushing
  else if v = Unsigned.UInt32.of_int 64 then Eos
  else if v = Unsigned.UInt32.of_int 128 then Blocking
  else if v = Unsigned.UInt32.of_int 256 then Need_parent
  else if v = Unsigned.UInt32.of_int 512 then Need_reconfigure
  else if v = Unsigned.UInt32.of_int 1024 then Pending_events
  else if v = Unsigned.UInt32.of_int 2048 then Fixed_caps
  else if v = Unsigned.UInt32.of_int 4096 then Proxy_caps
  else if v = Unsigned.UInt32.of_int 8192 then Proxy_allocation
  else if v = Unsigned.UInt32.of_int 16384 then Proxy_scheduling
  else if v = Unsigned.UInt32.of_int 32768 then Accept_intersect
  else if v = Unsigned.UInt32.of_int 65536 then Accept_template
  else if v = Unsigned.UInt32.of_int 1048576 then Last
  else raise (Invalid_argument "Unexpected Pad_flags value")

let to_value = function
  | Blocked -> Unsigned.UInt32.of_int 16
  | Flushing -> Unsigned.UInt32.of_int 32
  | Eos -> Unsigned.UInt32.of_int 64
  | Blocking -> Unsigned.UInt32.of_int 128
  | Need_parent -> Unsigned.UInt32.of_int 256
  | Need_reconfigure -> Unsigned.UInt32.of_int 512
  | Pending_events -> Unsigned.UInt32.of_int 1024
  | Fixed_caps -> Unsigned.UInt32.of_int 2048
  | Proxy_caps -> Unsigned.UInt32.of_int 4096
  | Proxy_allocation -> Unsigned.UInt32.of_int 8192
  | Proxy_scheduling -> Unsigned.UInt32.of_int 16384
  | Accept_intersect -> Unsigned.UInt32.of_int 32768
  | Accept_template -> Unsigned.UInt32.of_int 65536
  | Last -> Unsigned.UInt32.of_int 1048576

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 16 , Blocked ); ( 32 , Flushing ); ( 64 , Eos ); ( 128 , Blocking ); ( 256 , Need_parent ); ( 512 , Need_reconfigure ); ( 1024 , Pending_events ); ( 2048 , Fixed_caps ); ( 4096 , Proxy_caps ); ( 8192 , Proxy_allocation ); ( 16384 , Proxy_scheduling ); ( 32768 , Accept_intersect ); ( 65536 , Accept_template ); ( 1048576 , Last )]
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

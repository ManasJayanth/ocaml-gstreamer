open Ctypes
open Foreign

type t = None | Flush | Accurate | Key_unit | Segment | Trickmode | Skip | Snap_before | Snap_after | Snap_nearest | Trickmode_key_units | Trickmode_no_audio
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Flush
  else if v = Unsigned.UInt32.of_int 2 then Accurate
  else if v = Unsigned.UInt32.of_int 4 then Key_unit
  else if v = Unsigned.UInt32.of_int 8 then Segment
  else if v = Unsigned.UInt32.of_int 16 then Trickmode
  else if v = Unsigned.UInt32.of_int 16 then Skip
  else if v = Unsigned.UInt32.of_int 32 then Snap_before
  else if v = Unsigned.UInt32.of_int 64 then Snap_after
  else if v = Unsigned.UInt32.of_int 96 then Snap_nearest
  else if v = Unsigned.UInt32.of_int 128 then Trickmode_key_units
  else if v = Unsigned.UInt32.of_int 256 then Trickmode_no_audio
  else raise (Invalid_argument "Unexpected Seek_flags value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | Flush -> Unsigned.UInt32.of_int 1
  | Accurate -> Unsigned.UInt32.of_int 2
  | Key_unit -> Unsigned.UInt32.of_int 4
  | Segment -> Unsigned.UInt32.of_int 8
  | Trickmode -> Unsigned.UInt32.of_int 16
  | Skip -> Unsigned.UInt32.of_int 16
  | Snap_before -> Unsigned.UInt32.of_int 32
  | Snap_after -> Unsigned.UInt32.of_int 64
  | Snap_nearest -> Unsigned.UInt32.of_int 96
  | Trickmode_key_units -> Unsigned.UInt32.of_int 128
  | Trickmode_no_audio -> Unsigned.UInt32.of_int 256

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 1 , Flush ); ( 2 , Accurate ); ( 4 , Key_unit ); ( 8 , Segment ); ( 16 , Trickmode ); ( 16 , Skip ); ( 32 , Snap_before ); ( 64 , Snap_after ); ( 96 , Snap_nearest ); ( 128 , Trickmode_key_units ); ( 256 , Trickmode_no_audio )]
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

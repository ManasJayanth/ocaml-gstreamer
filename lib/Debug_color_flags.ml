open Ctypes
open Foreign

type t = Fg_black | Fg_red | Fg_green | Fg_yellow | Fg_blue | Fg_magenta | Fg_cyan | Fg_white | Bg_black | Bg_red | Bg_green | Bg_yellow | Bg_blue | Bg_magenta | Bg_cyan | Bg_white | Bold | Underline
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Fg_black
  else if v = Unsigned.UInt32.of_int 1 then Fg_red
  else if v = Unsigned.UInt32.of_int 2 then Fg_green
  else if v = Unsigned.UInt32.of_int 3 then Fg_yellow
  else if v = Unsigned.UInt32.of_int 4 then Fg_blue
  else if v = Unsigned.UInt32.of_int 5 then Fg_magenta
  else if v = Unsigned.UInt32.of_int 6 then Fg_cyan
  else if v = Unsigned.UInt32.of_int 7 then Fg_white
  else if v = Unsigned.UInt32.of_int 0 then Bg_black
  else if v = Unsigned.UInt32.of_int 16 then Bg_red
  else if v = Unsigned.UInt32.of_int 32 then Bg_green
  else if v = Unsigned.UInt32.of_int 48 then Bg_yellow
  else if v = Unsigned.UInt32.of_int 64 then Bg_blue
  else if v = Unsigned.UInt32.of_int 80 then Bg_magenta
  else if v = Unsigned.UInt32.of_int 96 then Bg_cyan
  else if v = Unsigned.UInt32.of_int 112 then Bg_white
  else if v = Unsigned.UInt32.of_int 256 then Bold
  else if v = Unsigned.UInt32.of_int 512 then Underline
  else raise (Invalid_argument "Unexpected Debug_color_flags value")

let to_value = function
  | Fg_black -> Unsigned.UInt32.of_int 0
  | Fg_red -> Unsigned.UInt32.of_int 1
  | Fg_green -> Unsigned.UInt32.of_int 2
  | Fg_yellow -> Unsigned.UInt32.of_int 3
  | Fg_blue -> Unsigned.UInt32.of_int 4
  | Fg_magenta -> Unsigned.UInt32.of_int 5
  | Fg_cyan -> Unsigned.UInt32.of_int 6
  | Fg_white -> Unsigned.UInt32.of_int 7
  | Bg_black -> Unsigned.UInt32.of_int 0
  | Bg_red -> Unsigned.UInt32.of_int 16
  | Bg_green -> Unsigned.UInt32.of_int 32
  | Bg_yellow -> Unsigned.UInt32.of_int 48
  | Bg_blue -> Unsigned.UInt32.of_int 64
  | Bg_magenta -> Unsigned.UInt32.of_int 80
  | Bg_cyan -> Unsigned.UInt32.of_int 96
  | Bg_white -> Unsigned.UInt32.of_int 112
  | Bold -> Unsigned.UInt32.of_int 256
  | Underline -> Unsigned.UInt32.of_int 512

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , Fg_black ); ( 1 , Fg_red ); ( 2 , Fg_green ); ( 3 , Fg_yellow ); ( 4 , Fg_blue ); ( 5 , Fg_magenta ); ( 6 , Fg_cyan ); ( 7 , Fg_white ); ( 0 , Bg_black ); ( 16 , Bg_red ); ( 32 , Bg_green ); ( 48 , Bg_yellow ); ( 64 , Bg_blue ); ( 80 , Bg_magenta ); ( 96 , Bg_cyan ); ( 112 , Bg_white ); ( 256 , Bold ); ( 512 , Underline )]
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

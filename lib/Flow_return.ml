open Ctypes
open Foreign

type t = Custom_success_2 | Custom_success_1 | Custom_success | Ok | Not_linked | Flushing | Eos | Not_negotiated | Error | Not_supported | Custom_error | Custom_error_1 | Custom_error_2

let of_value v =
  if v = Int32.of_int 102 then Custom_success_2
  else if v = Int32.of_int 101 then Custom_success_1
  else if v = Int32.of_int 100 then Custom_success
  else if v = Int32.of_int 0 then Ok
  else if v = Int32.of_int (-1) then Not_linked
  else if v = Int32.of_int (-2) then Flushing
  else if v = Int32.of_int (-3) then Eos
  else if v = Int32.of_int (-4) then Not_negotiated
  else if v = Int32.of_int (-5) then Error
  else if v = Int32.of_int (-6) then Not_supported
  else if v = Int32.of_int (-100) then Custom_error
  else if v = Int32.of_int (-101) then Custom_error_1
  else if v = Int32.of_int (-102) then Custom_error_2
  else raise (Invalid_argument "Unexpected Flow_return value")

let to_value = function
  | Custom_success_2 -> Int32.of_int 102
  | Custom_success_1 -> Int32.of_int 101
  | Custom_success -> Int32.of_int 100
  | Ok -> Int32.of_int 0
  | Not_linked -> Int32.of_int (-1)
  | Flushing -> Int32.of_int (-2)
  | Eos -> Int32.of_int (-3)
  | Not_negotiated -> Int32.of_int (-4)
  | Error -> Int32.of_int (-5)
  | Not_supported -> Int32.of_int (-6)
  | Custom_error -> Int32.of_int (-100)
  | Custom_error_1 -> Int32.of_int (-101)
  | Custom_error_2 -> Int32.of_int (-102)

let t_view = view ~read:of_value ~write:to_value int32_t


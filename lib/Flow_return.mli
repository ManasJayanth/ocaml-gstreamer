open Ctypes

type t = Custom_success_2 | Custom_success_1 | Custom_success | Ok | Not_linked | Flushing | Eos | Not_negotiated | Error | Not_supported | Custom_error | Custom_error_1 | Custom_error_2

val of_value:
  int32 -> t

val to_value:
  t -> int32

val t_view: t typ


open Ctypes

type t = None | Recurse | Paths_are_default_only | File_name_is_suffix | File_name_is_prefix | Paths_are_relative_to_exe
type t_list = t list

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val list_of_value:
  Unsigned.uint32 -> t_list

val list_to_value:
  t_list -> Unsigned.uint32

val t_list_view : t_list typ


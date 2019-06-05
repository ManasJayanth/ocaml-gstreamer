open Ctypes

type t = Live | Decode_only | Discont | Resync | Corrupted | Marker | Header | Gap | Droppable | Delta_unit | Tag_memory | Sync_after | Non_droppable | Last
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


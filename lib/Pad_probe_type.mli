open Ctypes

type t = Invalid | Idle | Block | Buffer | Buffer_list | Event_downstream | Event_upstream | Event_flush | Query_downstream | Query_upstream | Push | Pull | Blocking | Data_downstream | Data_upstream | Data_both | Block_downstream | Block_upstream | Event_both | Query_both | All_both | Scheduling
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


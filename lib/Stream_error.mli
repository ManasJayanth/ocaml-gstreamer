open Ctypes

type t = Failed | Too_lazy | Not_implemented | Type_not_found | Wrong_type | Codec_not_found | Decode | Encode | Demux | Mux | Format | Decrypt | Decrypt_nokey | Num_errors

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ


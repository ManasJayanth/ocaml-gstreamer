open Ctypes

type t = Angle | Version | Edition | Invalid | Title | Track | Chapter

val of_value:
  int32 -> t

val to_value:
  t -> int32

val t_view: t typ


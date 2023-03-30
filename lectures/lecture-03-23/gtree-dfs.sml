use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

datatype node = NODE of int

(* ****** ****** *)

fun
gtree_dfs
( nxs: node list
, fchildren: node -> node list): node stream = fn() =>
(
case nxs of
  nil => strcon_nil
| nx1 :: nxs =>
  strcon_cons(nx1, gtree_dfs(fchildren(nx1) @ nxs, fchildren))
)

(* end of [CS320-2023-Spring-lectures-gtree-dfs.sml] *)

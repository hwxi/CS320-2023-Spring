(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

datatype node = NODE of int

(* ****** ****** *)

fun
node_get_nodes
(  nx: node  ): node list =
let
val NODE(id) = nx
in
  [ NODE(2*id+1), NODE(2*id+2) ]
end

(* ****** ****** *)

val theRoot = NODE(0)

(* ****** ****** *)
(*
val theNodes0 = [ theRoot ]
val theNodes1 = list_concat(list_map(theNodes0, fn(nx) => node_get_nodes(nx)))
val theNodes2 = list_concat(list_map(theNodes1, fn(nx) => node_get_nodes(nx)))
val theNodes3 = list_concat(list_map(theNodes2, fn(nx) => node_get_nodes(nx)))
*)
(*
val f_theNodes = fn(n) =>
int1_foldleft(n, [theRoot], fn (res, i) => list_concat(list_map(res, fn(nx) => node_get_nodes(nx))))
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-BFS.sml] *)

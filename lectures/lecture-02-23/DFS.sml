(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

datatype node = NODE of int

(* ****** ****** *)

val N = 8

(* ****** ****** *)

fun
node_get_nodes
(  nx: node  ): node list =
let
val NODE(id) = nx
in
if
(id < N)
then [ NODE(2*id+1), NODE(2*id+2) ] else []
end

(* ****** ****** *)

fun DFS(nxs: node list): unit =
(
case nxs of
  nil => ()
| nx1 :: nxs2 =>
  let
  val
  nxs1 = node_get_nodes(nx1) in DFS(nxs1 @ nxs2)
  end
)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-DFS.sml] *)

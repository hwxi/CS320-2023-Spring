(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

use "./midterm2-02.sml";
(*
use "./mytree_dfs_streamize.sml";
*)

(* ****** ****** *)

fun
leaf(x) = mytree_node(x, [])

(* ****** ****** *)

fun
stream_listize(fxs) =
foreach_to_listize(stream_foreach)(fxs)

(* ****** ****** *)

val t1 =
mytree_node
(100, int1_map_list(10, fn x => leaf(x)))
val xs = stream_listize(mytree_dfs_streamize(t1))
val () = assert320(xs = [100,0,1,2,3,4,5,6,7,8,9])

(* ****** ****** *)

(* Added by Zach *)

val t2 = mytree_node(20, [])
val () = assert320(stream_head(mytree_dfs_streamize(t2)) = 20)

val t3 = mytree_node(20, [mytree_node(30, []), mytree_node(40, [])])
val tres = mytree_dfs_streamize(t3)
val () = assert320(stream_get_at(tres, 0) = 20)
val () = assert320(stream_get_at(tres, 1) = 30)
val () = assert320(stream_get_at(tres, 2) = 40)

(* ****** ****** *)

(* Added by Hongwei *)
val t11 = mytree_node(1000, [t1, t1])
val xs1 = stream_listize(mytree_dfs_streamize(t11))
val ( ) = assert320(xs1 = [1000,100,0,1,2,3,4,5,6,7,8,9,100,0,1,2,3,4,5,6,7,8,9])

(* ****** ****** *)

val (  ) = print("midterm2-02-test: passed!\n")

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-02-test.sml] *)

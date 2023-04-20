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

(* ****** ****** *)

val (  ) = print("midterm2-02-test: passed!\n")

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-02-test.sml] *)

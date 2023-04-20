(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

use "./midterm2-06.sml";
(*
use "./perm_counting_out.sml";
*)

(* ****** ****** *)

val () =
assert320(perm_counting_out([1,2,3], 0) = [1,2,3])
val () =
assert320(perm_counting_out([1,2,3], 1) = [2,1,3])
val () =
assert320(perm_counting_out([1,2,3], 2) = [3,1,2])
val () =
assert320(perm_counting_out([1,2,3], 3) = [1,3,2])
val () =
assert320(perm_counting_out([1,2,3,4], 1) = [2,4,3,1])
val () =
assert320(perm_counting_out([1,2,3,4], 3) = [4,1,3,2])

(* ****** ****** *)
val (  ) = print("midterm2-06-test: passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-06-test.sml] *)

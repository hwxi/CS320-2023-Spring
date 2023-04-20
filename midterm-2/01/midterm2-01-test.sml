(* ****** ****** *)

use "./../../mysmlib//mysmlib-cls.sml";

(* ****** ****** *)

use "./midterm2-01.sml";
(*
use "./stream_evaluate.sml";
*)

(* ****** ****** *)

val fxs1 =
stream_tabulate(~1, fn n => 1.0)
val fxs2 = stream_evaluate(fxs1, 1.0/2.0)
val fxs3 = stream_evaluate(fxs1, 1.0/3.0)

(* ****** ****** *)

val (  ) =
assert320
((abs(stream_get_at(fxs2, 1000000) - 2.0)) < 0.001)

(* ****** ****** *)

val (  ) =
assert320
((abs(stream_get_at(fxs3, 1000000) - 1.5)) < 0.001)

(* ****** ****** *)

val (  ) = print("midterm2-01-test: passed!\n")

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-01-test.sml] *)
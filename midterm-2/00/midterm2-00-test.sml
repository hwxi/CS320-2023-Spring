(* ****** ****** *)

use "./../../mysmlib//mysmlib-cls.sml";

(* ****** ****** *)

use "./midterm2-00.sml";
(*
use "./stream_takedrop.sml";
*)

(* ****** ****** *)

val fxs1 =
stream_tabulate(~1, fn n => n)
val fxs2 = stream_take(fxs1, 200)
val fxs3 = stream_drop(fxs2, 100)

(* ****** ****** *)

val () = assert320(stream_length(fxs2) = 200)
val () = assert320(stream_length(fxs3) = 100)

(* ****** ****** *)
val (  ) = print("midterm2-00-test: passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-00-test.sml] *)
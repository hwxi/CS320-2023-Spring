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

val fxs4 =
stream_tabulate(0, fn n => n)
val fxs5 = stream_take(fxs4, 100)
val fxs6 = stream_drop(fxs4, 100)
val () = assert320(stream_length(fxs5) = 000)
val () = assert320(stream_length(fxs6) = 000)

(* ****** ****** *)

(* Added by Zach *)

val hxs1 = stream_tabulate(~1, fn n => n * 2)
val hxs2 = stream_take(hxs1, 0)
val ()   = assert320(stream_length(hxs2) = 0)
val hxs3 = stream_drop(hxs2, 0)
val ()   = assert320(stream_length(hxs3) = 0)

val gxs2 = stream_take(hxs1, 1)
val ()   = assert320(stream_get_at(gxs2, 0) = 0)
val gxs3 = stream_take(hxs1, 2)
val gxs4 = stream_drop(gxs3, 1)
val ()   = assert320(stream_get_at(gxs4, 0) = 2)

(* ****** ****** *)
val (  ) = print("midterm2-00-test: passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-00-test.sml] *)

(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

use "./midterm2-04.sml";
(*
use "./stream_drawdowns.sml";
*)

(* ****** ****** *)

val fxs0 =
stream_tabulate
( ~1
, fn (n:int) => (n div 3))
val fxs1 =
stream_tabulate
( ~1
, fn (n:int) =>
  (n div 2)*(n div 2))

val fxs2 = stream_drawdowns(fxs0)
val fxs3 = stream_drawdowns(fxs1)

(* ****** ****** *)

val
strcon_cons(ys0, fxs2) = fxs2()
val
strcon_cons(ys1, fxs2) = fxs2()
val
strcon_cons(ys2, fxs2) = fxs2()

val () = assert320(ys0 = [0,0,0])
val () = assert320(ys1 = [1,1,1])
val () = assert320(ys2 = [2,2,2])

(* ****** ****** *)

val
strcon_cons(zs0, fxs3) = fxs3()
val
strcon_cons(zs1, fxs3) = fxs3()
val
strcon_cons(zs2, fxs3) = fxs3()
val
strcon_cons(zs3, fxs3) = fxs3()
val
strcon_cons(zs4, fxs3) = fxs3()
val
strcon_cons(zs5, fxs3) = fxs3()

val () = assert320(zs0 = [0,0])
val () = assert320(zs1 = [1,1])
val () = assert320(zs2 = [4,4])
val () = assert320(zs3 = [9,9])
val () = assert320(zs4 = [16,16])
val () = assert320(zs5 = [25,25])

(* ****** ****** *)
val (  ) = print("midterm2-04-test: passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-04-test.sml] *)

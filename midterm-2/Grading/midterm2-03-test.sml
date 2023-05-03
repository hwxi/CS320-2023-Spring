(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

use "./midterm2-03.sml";
(*
use "./stream_zipstrm.sml";
*)

(* ****** ****** *)
fun
stream_listize(fxs) =
foreach_to_listize(stream_foreach)(fxs)
(* ****** ****** *)

fun
stream_ziplst(fxss) =
stream_make_map
(
stream_zipstrm
(list_streamize(fxss)), stream_listize)

(* ****** ****** *)

local

exception Error

in (* in-of-local *)

(* ****** ****** *)

val xs1 =
list_streamize[1,2,3]
val xs2 =
list_streamize[1,2,3]
val xs3 =
list_streamize[1,2,3]
val fxss =
stream_ziplst([xs1, xs2, xs3])
val (  ) =
assert320([1,1,1] = stream_get_at(fxss,0))
val (  ) =
assert320([2,2,2] = stream_get_at(fxss,1))
val (  ) =
assert320([3,3,3] = stream_get_at(fxss,2))

(* ****** ****** *)

(* Added by Zach *)

val hxs1 = stream_tabulate(~1, fn n => n)
val hxs2 = stream_tabulate(~1, fn n => ~1 * n)
val hres = stream_ziplst([hxs1, hxs2])
fun test_at(s, n) = ([n, ~1 * n] =  stream_get_at(s, n))
val ()   = assert320(test_at(hres, 0))
val ()   = assert320(test_at(hres, 100))
val ()   = assert320(test_at(hres, 1000))

(* ****** ****** *)

(* Added by Hongwei *)

val gxss =
stream_tabulate
( ~1
,
fn m =>
stream_tabulate
(~1, fn n => m+n))
val gcols = stream_zipstrm(gxss)
val () = assert320(stream_get_at(stream_get_at(gcols, 10), 10) = 20)
val () = assert320(stream_get_at(stream_get_at(gcols, 10), 100) = 110)
val () = assert320(stream_get_at(stream_get_at(gcols, 100), 10) = 110)
val () = assert320(stream_get_at(stream_get_at(gcols, 100), 100) = 200)

(* ****** ****** *)
val () = print( "midterm2-03-test passed!\n" )
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-03.sml] *)

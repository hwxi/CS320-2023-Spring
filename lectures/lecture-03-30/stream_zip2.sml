(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

fun
stream_zip2
( fxs: 'a stream
, fys: 'b stream)
: ('a * 'b) stream = fn() =>
case fxs() of
strcon_nil =>
strcon_nil(*void*)
|
strcon_cons(x1, fxs) =>
(
case fys() of
strcon_nil =>
strcon_nil(*void*)
|
strcon_cons(y1, fys) =>
strcon_cons((x1, y1), stream_zip2(fxs, fys)))

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-stream_zip2.sml] *)
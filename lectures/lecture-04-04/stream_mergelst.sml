(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

exception MyError

(* ****** ****** *)

fun
stream_mergelst
( fxs1: 'a stream list
, lte3: 'a * 'a -> bool): 'a stream = fn() => raise MyError

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-stream_mergelst.sml] *)
(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

exception MyError

(*
fun
stream_merge2
(fxs1: 'a stream
,fxs2: 'a stream, lte3: 'a * 'a -> bool): 'a stream
*)
fun
stream_merge2
(fxs1: 'a stream
,fxs2: 'a stream, lte3: 'a * 'a -> bool): 'a stream = raise MyError

(* ****** ****** *)

fun
list_merge2
(xs1: 'a list
,xs2: 'a list, lte3: 'a * 'a -> bool): 'a list =
(
case xs1 of
  nil => xs2
| x1 :: xs1 =>
(
case xs2 of
  nil => x1 :: xs1
| x2 :: xs2 =>
  if
  lte3(x1, x2)
  then x1 :: list_merge2(xs1, x2 :: xs2, lte3)
  else x2 :: list_merge2(x1 :: xs1, xs2, lte3)
)
)

(* ****** ****** *)

fun
stream_merge2
( fxs1: 'a stream
, fxs2: 'a stream
, lte3: 'a * 'a -> bool): 'a stream = fn() =>
(
case fxs1() of
  strcon_nil => fxs2()
| strcon_cons(x1, fxs1) =>
(
case fxs2() of
strcon_nil =>
strcon_cons(x1, fxs1)
|
strcon_cons(x2, fxs2) =>
if
lte3(x1, x2)
then strcon_cons
(x1, stream_merge2(fxs1, stream_cons(x2, fxs2), lte3))
else strcon_cons
(x2, stream_merge2(stream_cons(x1, fxs1), fxs2, lte3))
)
)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-stream_merge2.sml] *)

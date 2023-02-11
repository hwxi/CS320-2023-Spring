(* ****** ****** *)

use "./lazy.sml";

(* ****** ****** *)

datatype 'a mstrcon =
  mstrcon_nil
| mstrcon_cons of
  ('a * 'a mstrcon lazy)

(* ****** ****** *)

type 'a mstream = 'a mstrcon lazy

(* ****** ****** *)

fun
mstream_from(n: int): int mstream =
lazy_fun
(fn () => mstrcon_cons(n, mstream_from(n+1)))

(* ****** ****** *)

val
theNats = mstream_from(0)
val xs = theNats
val mstrcon_cons(x0, xs) = lazy_get(xs)
val () = print("x0 = " ^ Int.toString(x0) ^ "\n")
val mstrcon_cons(x0, xs) = lazy_get(xs)
val () = print("x0 = " ^ Int.toString(x0) ^ "\n")
val mstrcon_cons(x0, xs) = lazy_get(xs)
val () = print("x0 = " ^ Int.toString(x0) ^ "\n")
val mstrcon_cons(x0, xs) = lazy_get(xs)
val () = print("x0 = " ^ Int.toString(x0) ^ "\n")
val mstrcon_cons(x0, xs) = lazy_get(xs)
val () = print("x0 = " ^ Int.toString(x0) ^ "\n")
val mstrcon_cons(x0, xs) = lazy_get(xs)
val () = print("x0 = " ^ Int.toString(x0) ^ "\n")

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-mstream.sml] *)

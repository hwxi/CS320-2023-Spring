(* ****** ****** *)
use (* for class library *)
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
use "./../MySolution/assign01-03.sml";
(* ****** ****** *)

val list_size = List.length

(* ****** ****** *)

fun
nappend(xs: 'a xlist): int =
(
case xs of
xlist_nil => 0
|
xlist_cons(_, xs) => nappend(xs)
|
xlist_snoc(xs, _) => nappend(xs)
|
xlist_append(xs, ys) => 1 + nappend(xs) + nappend(ys)
|
xlist_reverse(xs) => nappend(xs)
)

(* ****** ****** *)

fun
nreverse(xs: 'a xlist): int =
(
case xs of
xlist_nil => 0
|
xlist_cons(_, xs) => nreverse(xs)
|
xlist_snoc(xs, _) => nreverse(xs)
|
xlist_append(xs, ys) => nreverse(xs) + nreverse(ys)
|
xlist_reverse(xs) => 1 + nreverse(xs)
)

(* ****** ****** *)

local
exception Error
in(*local*)
(* ****** ****** *)
val xs = xlist_nil
(*
xs = []
*)
val xs = xlist_cons(1, xs)
(*
xs = [1]
*)
val xs = xlist_snoc(xs, 2)
(*
xs = [1,2]
*)
val xs = xlist_reverse(xs)
(*
xs = [2,1]
*)
val xs = xlist_append(xs, xs)
(*
xs = [2,1,2,1]
*)
(* ****** ****** *)
val ys = xlist_remove_reverse(xs)
val () = assert320_some
(list_of_xlist(xs)=list_of_xlist(ys), "assign01-03-test:1")
val () = assert320_some(nreverse(ys)=0, "assign01-03-test:1")
val () = assert320_some(nappend(xs)=nappend(ys), "assign01-03-test:1")
(* ****** ****** *)
(*
val xs = xlist_cons(0, xs)
*)
val xs = xlist_cons(1, xs)
val xs = xlist_snoc(xs, 2)
(*
val xs = xlist_snoc(xs, 3)
val xs = xlist_snoc(xs, 4)
*)
val xs = xlist_reverse(xs)
val xs = xlist_append(xs, xs)
(* ****** ****** *)
val ys = xlist_remove_reverse(xs)
val () = assert320_some
(list_of_xlist(xs)=list_of_xlist(ys), "assign01-03-test:2")
val () = assert320_some(nreverse(ys)=0, "assign01-03-test:2")
val () = assert320_some(nappend(xs)=nappend(ys), "assign01-03-test:2")
(* ****** ****** *)

val () = print("Assign01-03-test passed!\n")

(* ****** ****** *)
val xs = xlist_reverse(xs)
val xs = xlist_append(xs, xs)
val ys = xlist_remove_reverse(xs)
val () = assert320_some
(list_of_xlist(xs)=list_of_xlist(ys), "assign01-03-test:2")
val () = assert320_some(nreverse(ys)=0, "assign01-03-test:2")
val () = assert320_some(nappend(xs)=nappend(ys), "assign01-03-test:2")
(* ****** ****** *)

val () = print("Assign01-03-grade passed!\n")

(* ****** ****** *)
end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign01-03-test.sml] *)

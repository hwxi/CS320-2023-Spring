(* ****** ****** *)
use (* for class library *)
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
use "./../MySolution/assign01-01.sml";
(* ****** ****** *)

val list_size = List.length

(* ****** ****** *)

local
exception Error
in(*local*)
(* ****** ****** *)
val xs = xlist_nil
val xs = xlist_cons(1, xs)
val xs = xlist_snoc(xs, 2)
val xs = xlist_reverse(xs)
val xs = xlist_append(xs, xs)
(* ****** ****** *)
val () =
assert320_some(xlist_size(xs)=list_size(list_of_xlist(xs)), "assign01-01-test:1")
(* ****** ****** *)
val xs = xlist_cons(1, xs)
val xs = xlist_snoc(xs, 2)
val xs = xlist_reverse(xs)
val xs = xlist_append(xs, xs)
val () =
assert320_some(xlist_size(xs)=list_size(list_of_xlist(xs)), "assign01-01-test:2")
(* ****** ****** *)

val () = print("Assign01-01-test passed!\n")

(* ****** ****** *)
end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign01-01-test.sml] *)

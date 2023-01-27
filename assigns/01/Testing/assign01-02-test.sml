(* ****** ****** *)
use (* for class library *)
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
use "./../MySolution/assign01-02.sml";
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
assert320_some(xlist_sub(xs, 0)=List.nth(list_of_xlist(xs), 0), "assign01-02-test:1")
(* ****** ****** *)
val xs = xlist_cons(1, xs)
val xs = xlist_snoc(xs, 2)
val xs = xlist_reverse(xs)
val xs = xlist_append(xs, xs)
val () =
assert320_some(xlist_sub(xs, 3)=List.nth(list_of_xlist(xs), 3), "assign01-02-test:2")
(* ****** ****** *)
val () =
assert320_some((xlist_sub(xs, 10) handle XlistSubscript => 0)=(List.nth(list_of_xlist(xs), 10) handle Subscript => 0), "assign01-02-test:3")
val () =
assert320_some((xlist_sub(xs, 11) handle XlistSubscript => 0)=(List.nth(list_of_xlist(xs), 11) handle Subscript => 0), "assign01-02-test:3")
val () =
assert320_some((xlist_sub(xs, 12) handle XlistSubscript => 0)=(List.nth(list_of_xlist(xs), 12) handle Subscript => 0), "assign01-02-test:3")
(* ****** ****** *)

val () = print("Assign01-02-test passed!\n")

(* ****** ****** *)
end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign01-02-test.sml] *)

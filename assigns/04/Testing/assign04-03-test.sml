use "./../MySolution/assign04-03.sml";

local

exception Error

in (* in-of-local *)

(* ****** ****** *)

fun
power
(x: int, y: int): int =
int1_foldleft(1, y, fn(r, _) => r * x)

(* ****** ****** *)

val
list_exists =
fn(xs, test) => forall_to_exists(list_forall)(xs, test)
val
list_forall' =
fn(xs, test) => forall_to_exists(list_exists)(xs, test)
val
list_exists' =
fn(xs, test) => forall_to_exists(list_forall')(xs, test)

(* ****** ****** *)

val xs = [1,2,3,4,5]
val p1 = fn(x) => (x < 6)
val p2 = fn(x) => (x > 2)
val p3 = fn(x) => (x = 2)
val ( ) =
assert320_some
(list_forall(xs, p1) = list_forall'(xs, p1), "assign04-03-test:1")
val ( ) =
assert320_some
(list_forall(xs, p2) = list_forall'(xs, p2), "assign04-03-test:2")
val ( ) =
assert320_some
(list_exists(xs, p1) = list_exists'(xs, p1), "assign04-03-test:3")
val ( ) =
assert320_some
(list_exists(xs, p2) = list_exists'(xs, p2), "assign04-03-test:4")
val ( ) =
assert320_some
(list_exists(xs, p3) = list_exists'(xs, p3), "assign04-03-test:5")

(* ****** ****** *)
val () = print("Assign04-03-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-03-test.sml] *)

use "./../MySolution/assign04-02.sml";

local

exception Error

in (* in-of-local *)

(* ****** ****** *)

fun
power
(x: int, y: int): int =
int1_foldleft(y, 1, fn(r, _) => r * x)

(* ****** ****** *)

val xs = [1,2,3,4,5]
val xss = list_subsets(xs)
val ( ) =
assert320_some
(list_length(xss) = power(2, list_length(xs)), "assign04-02-test:1")

(* ****** ****** *)
val () = print("Assign04-02-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-02-test.sml] *)

(* ****** ****** *)
use (* for class library *)
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
use "./../MySolution/assign03-01.sml";
(* ****** ****** *)
val () =
assert320
(find_root(fn(x:int) => x*(x+2)) = 0)
val () =
assert320
(find_root(fn(x:int) => (x+2)*(x-3)) = ~2)
val () =
assert320
(find_root(fn(x:int) => (x+3)*(x-3)) =  3)
(* ****** ****** *)
val () = print("Assign03-01-test passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-01-test.sml] *)

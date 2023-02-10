(* ****** ****** *)
use (* for class library *)
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
use "./../MySolution/assign03-02.sml";
(* ****** ****** *)
val () =
assert320_some
(list_range(1, 1) = [], "assign03-02-test:1")
val () =
assert320_some
(list_range(2, 1) = [], "assign03-02-test:2")
val () =
assert320_some
(list_range(1, 5) = [1,2,3,4], "assign03-02-test:3")
(* ****** ****** *)
val () = print("Assign03-02-test passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-02-test.sml] *)

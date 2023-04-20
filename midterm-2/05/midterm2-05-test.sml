(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

use "./midterm2-05.sml";
(*
use "./perm_capture_231.sml";
*)

(* ****** ****** *)

val () =
assert320(perm_capture_231[1,3,4,2])
val () =
assert320(not(perm_capture_231[1,2,4,3]))
val () =
assert320(not(perm_capture_231[1,2,3,4]))

(* ****** ****** *)
val (  ) = print("midterm2-05-test: passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-05-test.sml] *)

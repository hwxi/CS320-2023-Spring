(* ****** ****** *)
use
"./list_grouping.sml";
(* ****** ****** *)

local

exception ERROR_midterm1_06

(* ****** ****** *)

in (*local*)

(* ****** ****** *)

val N = 1000
val nxs =
list_grouping(int1_map_list(N, fn i => N-i))
val () =
print("midterm1-06-test: N=1000: passed!\n")
val N = 1000000
val nxs =
list_grouping(int1_map_list(N, fn i => N-i))
val () =
print("midterm1-06-test: N=1000000: passed!\n")

(* ****** ****** *)

val () =
print("midterm1-06-test: no failure detected!\n")

(* ****** ****** *)

end(*end-of-local*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-midterm1-06-test.sml] *)


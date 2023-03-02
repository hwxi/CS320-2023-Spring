(* ****** ****** *)
use
"./word_neighbors.sml";
(* ****** ****** *)

local

exception ERROR_midterm1_07

(* ****** ****** *)

in (*local*)

(* ****** ****** *)

val wds1 = word_neighbors("a")
val ( ) =
if length(wds1) = 25
then () else raise ERROR_midterm1_07

(* ****** ****** *)

val wds2 = word_neighbors("aa")
val ( ) =
if length(wds2) = 25 + 25
then () else raise ERROR_midterm1_07

(* ****** ****** *)

val wds3 = word_neighbors("xyz")
val ( ) =
if length(wds3) = 25 + 25 + 25
then () else raise ERROR_midterm1_07

(* ****** ****** *)

val () =
print("midterm1-07-test: no failure detected!\n")

(* ****** ****** *)

end(*end-of-local*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-midterm1-07-test.sml] *)


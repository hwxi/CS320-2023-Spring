(* ****** ****** *)
use
"./balance_test_nonrec.sml";
(* ****** ****** *)

local

exception ERROR_midterm1_05

(* ****** ****** *)

in (*local*)

(* ****** ****** *)

val t0 = LEAF(0)
val t1 = NODE(t0, t0)
val t2 = NODE(t1, t1)
val t3 = NODE(t2, t2)
val () =
if
bintr_balanced_nonrec(t3)
then () else raise ERROR_midterm1_05

val () =
if
bintr_balanced_nonrec(NODE(t3, t3))
then () else raise ERROR_midterm1_05

val () =
if
bintr_balanced_nonrec(NODE(t2, t3))
then raise ERROR_midterm1_05 else ()

val () =
if
bintr_balanced_nonrec(NODE(t3, t2))
then raise ERROR_midterm1_05 else ()

(* ****** ****** *)

val () =
print("midterm1-05-test: no failure detected!\n")

(* ****** ****** *)

end(*end-of-local*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-midterm1-05-test.sml] *)

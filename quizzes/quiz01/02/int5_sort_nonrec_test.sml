(* ****** ****** *)

use "./int5_sort_nonrec.sml";

(* ****** ****** *)

exception Error320 of string

(* ****** ****** *)

fun
assert320
(claim: bool) =
if claim
then () else raise Error320("int5_sort_nonrec")

(* ****** ****** *)

val
int5_sort =
fn(xs: int5): int5 =>
let
val (x1, x2, x3, x4, x5) = xs
val ys =
ListMergeSort.sort
(op>=)[x1,x2,x3,x4,x5]
val y1 = hd(ys) and ys = tl(ys)
val y2 = hd(ys) and ys = tl(ys)
val y3 = hd(ys) and ys = tl(ys)
val y4 = hd(ys) and ys = tl(ys)
val y5 = hd(ys) and ys = tl(ys) in (y1, y2, y3, y4, y5)
end (* end-of-[int5_sort]: let *)

(* ****** ****** *)

val xs1 = (2,3,6,4,1)
val xs2 = (2,3,4,4,1)
val xs3 = (3,2,4,2,3)

(* ****** ****** *)

val () =
assert320(int5_sort(xs1) = int5_sort_nr(xs1))
val () =
assert320(int5_sort(xs2) = int5_sort_nr(xs2))
val () =
assert320(int5_sort(xs3) = int5_sort_nr(xs3))

(* ****** ****** *)
val () = print("Testing for int5_sort_nonrec passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Spring-quiz01-int5_sort_nonrec_test.sml] *)

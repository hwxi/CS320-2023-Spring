(* ****** ****** *)
(*
Assign02: FP in Python
*)
(* ****** ****** *)
(*
use "./assign02-lib.sml";
*)
(* ****** ****** *)

fun
list_append
(xs: 'a list, ys: 'a list): 'a list =
(
case xs of
  nil => ys
| x1 :: xs => x1 :: list_append(xs, ys)
)

(* ****** ****** *)

fun
list_rappend
(xs: 'a list, ys: 'a list): 'a list =
(
case xs of
  nil => ys
| x1 :: xs => list_rappend(xs, x1 :: ys)
)

(* ****** ****** *)
fun
list_reverse
(xs: 'a list): 'a list = list_rappend(xs, [])
(* ****** ****** *)

fun
list_quicksort(xs: int list): int list = []

(* ****** ****** *)

fun
list_mergesort(xs: int list): int list = []

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign02.sml] *)

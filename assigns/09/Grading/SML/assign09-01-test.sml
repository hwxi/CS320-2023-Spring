(* ****** ****** *)
use "./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
use "./../../MySolution/SML/assign09-01.sml";
(* ****** ****** *)

fun
list_merge2
(xs1: int list
,xs2: int list): int list =
(
case xs1 of
  nil => xs2
| x1 :: xs1 =>
(
case xs2 of
  nil => x1 :: xs1
| x2 :: xs2 =>
  if
  (x1 <= x2)
  then x1 :: list_merge2(xs1, x2 :: xs2)
  else x2 :: list_merge2(x1 :: xs1, xs2)
)
)

(* ****** ****** *)

val xs1 = [1,2,3,4,5]
val xs2 = [1,2,3,4,5]
val ( ) = assert320(list_merge2(xs1, xs2) = list_kmerge2(xs1, xs2, fn res => res))

(* ****** ****** *)

val xs1 = [1,2,3,4,5]
val xs2 = [2,3,4,5,6]
val ( ) = assert320(list_merge2(xs1, xs2) = list_kmerge2(xs1, xs2, fn res => res))

(* ****** ****** *)

val xs1 = [1,2,3,4,5]
val xs2 = [3,4,5,6,7]
val ( ) = assert320(list_merge2(xs1, xs2) = list_kmerge2(xs1, xs2, fn res => res))

(* ****** ****** *)

val xs1 = [1,2,3,4,5]
val xs2 = [4,5,6,7,8]
val ( ) = assert320(list_merge2(xs1, xs2) = list_kmerge2(xs1, xs2, fn res => res))

(* ****** ****** *)

val xs1 = [1,2,3,4,5]
val xs2 = [5,6,7,8,9]
val ( ) = assert320(list_merge2(xs1, xs2) = list_kmerge2(xs1, xs2, fn res => res))

(* ****** ****** *)

val () = print( "Assign09-01-test passed!\n" )

(* ****** ****** *)

(* end of [CS320-2023-Spring-assigns-assign09-01.sml] *)

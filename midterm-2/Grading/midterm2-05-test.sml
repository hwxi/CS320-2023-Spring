(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

use "./midterm2-05.sml";
(*
use "./perm_capture_231.sml";
*)

(* ****** ****** *)

fun
strcon_sing(x0: 'a) =
strcon_cons(x0, stream_nil())
fun
list_insert
( xs: 'a list
, i0: int, x0: 'a): 'a list =
if i0 <= 0
then (x0 :: xs) else
(hd(xs) :: list_insert(tl(xs), i0-1, x0))
fun
stream_permute_list
  (xs: 'a list)
: 'a list stream = fn() =>
(
case xs of
nil => strcon_sing([])
|
x1 :: xs =>
let
val n0 = length(xs)
val
xss = stream_permute_list(xs)
fun
helper(i0: int): 'a list stream = fn() =>
if i0 > n0
then strcon_nil else
stream_append
(stream_make_map(xss, fn(xs) => list_insert(xs, i0, x1)), helper(i0+1))()
in
  helper(0)()
end
) (* end of [stream_permute_list] *)

(* ****** ****** *)

val () =
assert320(perm_capture_231[1,3,4,2])
val () =
assert320(not(perm_capture_231[1,2,4,3]))
val () =
assert320(not(perm_capture_231[1,2,3,4]))

(* ****** ****** *)

(* Added by Zach *)

val () = assert320(not(perm_capture_231[]))
val () = assert320(not(perm_capture_231[1]))
val () = assert320(not(perm_capture_231[1, 2]))
val () = assert320(perm_capture_231[1, 2, 0])
val () = assert320(not(perm_capture_231[0, 3, 0]))
val () = assert320(not(perm_capture_231[0, 0, 0]))
val () = assert320(perm_capture_231[0, 3, ~1])

(* ****** ****** *)

(* Added by Hongwei *)

val () =
assert320
(
stream_length
( stream_make_filter
  ( stream_permute_list[1,2,3,4,5]
  , fn xs => not(perm_capture_231(xs)))) = 42
)
val () =
assert320
(
stream_length
( stream_make_filter
  ( stream_permute_list[1,2,3,4,5,6]
  , fn xs => not(perm_capture_231(xs)))) = 132
)

(* ****** ****** *)
val (  ) = print("midterm2-05-test: passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-05-test.sml] *)

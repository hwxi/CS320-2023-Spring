(* ****** ****** *)

fun
list_reduce_left
( x0: 'a, xs: 'a list
, fopr: 'a * 'a -> 'a): 'a =
(
case xs of
  nil => x0
| x1 :: xs =>
  list_reduce_left(fopr(x0, x1), xs, fopr)
)

(* ****** ****** *)

fun
list_reduce_right
( xs: 'a list
, x0: 'a, fopr: 'a * 'a -> 'a): 'a =
(
case xs of
  nil => x0
| x1 :: xs =>
  fopr(x1, list_reduce_right(xs, x0, fopr))
)
  
(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-list_reduce.sml] *)
